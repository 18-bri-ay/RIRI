import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;
const String urlApiRiri =
    'https://many-discharge-fiction.ngrok-free.dev';

void main() {
  runApp(const RiriApp());
}

class RiriApp extends StatelessWidget {
  const RiriApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'RIRI',
      debugShowCheckedModeBanner: false,
      home: const PantallaBienvenida(),
    );
  }
}

class PantallaBienvenida extends StatefulWidget {
  const PantallaBienvenida({super.key});

  @override
  State<PantallaBienvenida> createState() =>
      _PantallaBienvenidaState();
}

class _PantallaBienvenidaState
    extends State<PantallaBienvenida> {

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 4), () {
      if (mounted) {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) =>
            const PantallaInicioSesion(),
          ),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF17354F),
              Color(0xFF91B6D4),
              Color(0xFF8A969F),
              Color(0xFF17354F),
            ],
          ),
        ),
        child: const Center(
          child: Text(
            'RIRI',
            style: TextStyle(
              fontSize: 75,
              fontWeight: FontWeight.w300,
              letterSpacing: 12,
              color: Color(0xFF243D51),
            ),
          ),
        ),
      ),
    );
  }
}

class PantallaInicioSesion extends StatefulWidget {
  const PantallaInicioSesion({super.key});

  @override
  State<PantallaInicioSesion> createState() =>
      _PantallaInicioSesionState();
}

class _PantallaInicioSesionState extends State<PantallaInicioSesion> {
  bool mostrarContrasena = false;
  final correoController = TextEditingController();
  final contrasenaController = TextEditingController();
  Future<void> iniciarSesion() async {
    final correo = correoController.text.trim();
    final contrasena = contrasenaController.text;

    if (correo.isEmpty || contrasena.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Ingresa tu correo y contraseÃ±a'),
        ),
      );
      return;
    }

    try {
      final respuesta = await http.post(
        Uri.parse('$urlApiRiri/api/auth/login'),
        headers: {
          'Content-Type': 'application/json',
          'x-api-key': 'CONFIGURAR_API_KEY',
        },
        body: jsonEncode({
          'email': correo,
          'password': contrasena,
        }),
      ).timeout(const Duration(seconds: 30));

      if (!mounted) return;

      if (respuesta.statusCode == 200) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const PantallaTipoRegistro(),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'No se pudo iniciar sesiÃ³n: ${respuesta.statusCode}',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo conectar con el servidor'),
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF17354F),
              Color(0xFF91B6D4),
              Color(0xFF8A969F),
              Color(0xFF17354F),
            ],
          ),
        ),
        child: SafeArea(
          child: Center(
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'RIRI',
                    style: TextStyle(
                      fontSize: 65,
                      fontWeight: FontWeight.w300,
                      letterSpacing: 10,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Acceso administrativo',
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 50),
                  TextField(
                    controller: correoController,
                    decoration: InputDecoration(
                      labelText: 'Correo electrÃ³nico',
                      prefixIcon: const Icon(Icons.person_outline),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  TextField(
                    controller: contrasenaController,
                    obscureText: !mostrarContrasena,
                    decoration: InputDecoration(
                      labelText: 'ContraseÃ±a',
                      prefixIcon: const Icon(Icons.lock_outline),
                      suffixIcon: IconButton(
                        icon: Icon(
                          mostrarContrasena
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            mostrarContrasena = !mostrarContrasena;
                          });
                        },
                      ),
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: iniciarSesion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF17354F),
                        foregroundColor: Colors.white,
                      ),
                      child: const Text(
                        'Entrar',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                  const SizedBox(height: 35),
                  const Text(
                    'Acceso exclusivo para personal autorizado',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}


class PantallaTipoRegistro extends StatelessWidget {
  const PantallaTipoRegistro({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF17354F),
              Color(0xFF91B6D4),
              Color(0xFF8A969F),
              Color(0xFF17354F),
            ],
          ),
        ),
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(25),
            child: Column(
              children: [
                const SizedBox(height: 45),
                const Text(
                  'RIRI',
                  style: TextStyle(
                    fontSize: 55,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 10,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Â¿QuÃ© deseas realizar?',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 15),
                const Text(
                  'Selecciona el tipo de registro para continuar',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 15,
                    color: Colors.white,
                  ),
                ),
                const Spacer(),
                _crearOpcion(
                  icono: Icons.person_search,
                  titulo: 'Persona desaparecida',
                  descripcion: 'Registrar una persona desaparecida',
                  alPresionar: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaFormularioRegistro(),
                      ),
                    );
                  },
                ),
                const SizedBox(height: 25),
                _crearOpcion(
                  icono: Icons.camera_alt_outlined,
                  titulo: 'Avistamiento',
                  descripcion: 'Buscar posibles coincidencias mediante una fotografÃ­a',
                  alPresionar: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const PantallaFotografia(
                          esAvistamiento: true,
                        ),
                      ),
                    );
                  },
                ),
                const Spacer(),
                const Text(
                  'Sistema de acceso exclusivo para personal autorizado',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 12,
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _crearOpcion({
    required IconData icono,
    required String titulo,
    required String descripcion,
    required VoidCallback alPresionar,
  }) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        onPressed: alPresionar,
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          foregroundColor: const Color(0xFF17354F),
          padding: const EdgeInsets.symmetric(
            vertical: 25,
            horizontal: 15,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(18),
          ),
        ),
        child: Column(
          children: [
            Icon(icono, size: 45),
            const SizedBox(height: 12),
            Text(
              titulo,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              descripcion,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 13),
            ),
          ],
        ),
      ),
    );
  }
}


class PantallaFormularioRegistro extends StatefulWidget {
  const PantallaFormularioRegistro({super.key});

  @override
  State<PantallaFormularioRegistro> createState() =>
      _PantallaFormularioRegistroState();
}

class _PantallaFormularioRegistroState
    extends State<PantallaFormularioRegistro> {
  final nombreController = TextEditingController();
  final edadController = TextEditingController();

  // Folio provisional para diseÃ±ar la pantalla.
  // La versiÃ³n definitiva se generarÃ¡ de forma Ãºnica
  // al conectar el sistema con la base de datos.
  final String folioProvisional = 'Pendiente de generar';

  @override
  void dispose() {
    nombreController.dispose();
    edadController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: const Text('Nuevo registro'),
        backgroundColor: const Color(0xFF17354F),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Center(
                child: Text(
                  'RIRI',
                  style: TextStyle(
                    fontSize: 40,
                    letterSpacing: 8,
                    color: Color(0xFF17354F),
                  ),
                ),
              ),

              const SizedBox(height: 30),

              const Text(
                'Registro de persona desaparecida',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17354F),
                ),
              ),

              const SizedBox(height: 12),

              const Text(
                'Ingresa los datos de la persona.',
                style: TextStyle(color: Colors.black54),
              ),

              const SizedBox(height: 30),

              TextFormField(
                initialValue: folioProvisional,
                readOnly: true,
                decoration: const InputDecoration(
                  labelText: 'Folio',
                  prefixIcon: Icon(Icons.badge_outlined),
                  border: OutlineInputBorder(),
                  helperText: 'RIRI lo generarÃ¡ automÃ¡ticamente',
                ),
              ),

              const SizedBox(height: 22),

              TextField(
                controller: nombreController,
                decoration: const InputDecoration(
                  labelText: 'Nombre completo',
                  prefixIcon: Icon(Icons.person_outline),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 22),

              TextField(
                controller: edadController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: 'Edad (aÃ±os)',
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 35),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: () {
                    final nombre = nombreController.text.trim();
                    final edad = int.tryParse(
                      edadController.text.trim(),
                    );

                    if (nombre.isEmpty ||
                        edad == null ||
                        edad < 0 ||
                        edad > 120) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text(
                            'Ingresa un nombre y una edad vÃ¡lida.',
                          ),
                        ),
                      );
                      return;
                    }

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PantallaFotografia(
                          nombre: nombreController.text.trim(),
                          edad: int.parse(edadController.text.trim()),
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF17354F),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PantallaFotografia extends StatefulWidget {
  final bool esAvistamiento;
  final String? nombre;
  final int? edad;

  const PantallaFotografia({
    super.key,
    this.esAvistamiento = false,
    this.nombre,
    this.edad,
  });
  @override
  State<PantallaFotografia> createState() =>
      _PantallaFotografiaState();
}

class _PantallaFotografiaState extends State<PantallaFotografia> {
  final ImagePicker selector = ImagePicker();
  File? fotografia;

  Future<void> enviarAvistamiento() async {
    if (fotografia == null) return;

    try {
      final solicitud = http.MultipartRequest(
        'POST',
        Uri.parse('$urlApiRiri/api/avistamientos/buscar'),
      );
      solicitud.headers['x-api-key'] = 'CONFIGURAR_API_KEY';
      solicitud.files.add(
        await http.MultipartFile.fromPath(
          'file',
          fotografia!.path,
        ),
      );

      final respuesta = await solicitud.send().timeout(
        const Duration(seconds: 30),
      );

      if (!mounted) return;

      if (respuesta.statusCode == 200) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Avistamiento procesado correctamente'),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error del servidor: ${respuesta.statusCode}',
            ),
          ),
        );
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No se pudo conectar con el servidor de RIRI',
          ),
        ),
      );
    }
  }

  Future<void> enviarDesaparecido() async {
    if (fotografia == null ||
        widget.nombre == null ||
        widget.edad == null) {
      return;
    }

    try {
      final solicitud = http.MultipartRequest(
        'POST',
        Uri.parse('$urlApiRiri/api/desaparecidos/registrar'),
      );
      solicitud.headers['x-api-key'] = 'CONFIGURAR_API_KEY';

      solicitud.fields['nombre'] = widget.nombre!;
      solicitud.fields['edad'] = widget.edad!.toString();

      solicitud.files.add(
        await http.MultipartFile.fromPath(
          'file',
          fotografia!.path,
        ),
      );
      final respuesta = await solicitud.send().timeout(
        const Duration(seconds: 30),
      );
      final detalleRespuesta = await respuesta.stream.bytesToString();
      debugPrint('CODIGO HTTP: ${respuesta.statusCode}');
      debugPrint('RESPUESTA API: $detalleRespuesta');
      debugPrint('Respuesta del registro: $detalleRespuesta');

      if (!mounted) return;

      if (respuesta.statusCode >= 200 &&
          respuesta.statusCode < 300) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'El servidor respondiÃ³ al registro',
            ),
          ),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text(
              'Error del servidor: ${respuesta.statusCode}',
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('ERROR REAL AL REGISTRAR: $e');

      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            'No se pudo conectar con el servidor de RIRI',
          ),
        ),
      );
    }
  }

  Future<void> seleccionarFoto(ImageSource origen) async {
    try {
      final XFile? imagen = await selector.pickImage(
        source: origen,
        imageQuality: 85,
      );

      if (imagen != null && mounted) {
        setState(() {
          fotografia = File(imagen.path);
        });
      }
    } catch (e) {
      if (!mounted) return;

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('No se pudo obtener la fotografÃ­a.'),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(
        title: Text(
          widget.esAvistamiento
              ? 'FotografÃ­a de avistamiento'
              : 'FotografÃ­a de persona desaparecida',
        ),
        backgroundColor: const Color(0xFF17354F),
        foregroundColor: Colors.white,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            children: [
              const SizedBox(height: 20),
              const Text(
                'RIRI',
                style: TextStyle(
                  fontSize: 42,
                  letterSpacing: 8,
                  color: Color(0xFF17354F),
                ),
              ),
              const SizedBox(height: 25),
              const Text(
                'FotografÃ­a de la persona',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF17354F),
                ),
              ),
              const SizedBox(height: 12),
              const Text(
                'Selecciona una fotografÃ­a donde el rostro sea visible.',
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),

              Container(
                width: double.infinity,
                height: 260,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  border: Border.all(
                    color: const Color(0xFF91B6D4),
                    width: 2,
                  ),
                ),
                child: fotografia == null
                    ? const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.add_a_photo_outlined,
                      size: 65,
                      color: Color(0xFF91B6D4),
                    ),
                    SizedBox(height: 12),
                    Text('Ninguna fotografÃ­a seleccionada'),
                  ],
                )
                    : ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: Image.file(
                    fotografia!,
                    fit: BoxFit.contain,
                  ),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    seleccionarFoto(ImageSource.gallery);
                  },
                  icon: const Icon(Icons.photo_library_outlined),
                  label: const Text('Seleccionar de galerÃ­a'),
                ),
              ),

              const SizedBox(height: 15),

              SizedBox(
                width: double.infinity,
                child: ElevatedButton.icon(
                  onPressed: () {
                    seleccionarFoto(ImageSource.camera);
                  },
                  icon: const Icon(Icons.camera_alt_outlined),
                  label: const Text('Tomar fotografÃ­a'),
                ),
              ),

              const SizedBox(height: 30),

              SizedBox(
                width: double.infinity,
                height: 55,
                child: ElevatedButton(
                  onPressed: fotografia == null
                      ? null
                      : () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PantallaAnalisisBiometrico(
                          esAvistamiento: widget.esAvistamiento,
                          fotografia: fotografia!,
                          nombre: widget.nombre,
                          edad: widget.edad,
                        ),
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF17354F),
                    foregroundColor: Colors.white,
                  ),
                  child: const Text(
                    'Continuar',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PantallaAnalisisBiometrico extends StatefulWidget {
  final bool esAvistamiento;
  final File fotografia;
  final String? nombre;
  final int? edad;

  const PantallaAnalisisBiometrico({
    super.key,
    required this.fotografia,
    this.esAvistamiento = false,
    this.nombre,
    this.edad,
  });

  @override
  State<PantallaAnalisisBiometrico> createState() =>
      _PantallaAnalisisBiometricoState();
}

class _PantallaAnalisisBiometricoState
    extends State<PantallaAnalisisBiometrico> {
  String? error;
  bool procesando = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) => procesar());
  }

  Future<void> procesar() async {
    if (!mounted) return;

    setState(() {
      procesando = true;
      error = null;
    });

    try {
      final ruta = widget.esAvistamiento
          ? '/api/avistamientos/buscar'
          : '/api/desaparecidos/registrar';

      final solicitud = http.MultipartRequest(
        'POST',
        Uri.parse('$urlApiRiri$ruta'),
      );
      solicitud.headers['x-api-key'] = 'CONFIGURAR_API_KEY';

      // Si no es avistamiento, agregamos nombre y edad al formulario multipart
      if (!widget.esAvistamiento) {
        if (widget.nombre == null || widget.edad == null) {
          throw Exception('Faltan el nombre o la edad para registrar.');
        }
        solicitud.fields['nombre'] = widget.nombre!;
        solicitud.fields['edad'] = widget.edad!.toString();
      }

      // Adjuntamos la fotografÃ­a usando la clave 'file' que espera FastAPI
      solicitud.files.add(
        await http.MultipartFile.fromPath('file', widget.fotografia.path),
      );

      final respuesta = await http.Response.fromStream(
        await solicitud.send().timeout(const Duration(seconds: 60)),
      );

      if (respuesta.statusCode < 200 || respuesta.statusCode >= 300) {
        throw Exception('Error HTTP ${respuesta.statusCode}: ${respuesta.body}');
      }

      final datos = jsonDecode(respuesta.body);

      if (!mounted) return;

      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => PantallaResultados(
            datos: datos,
            esAvistamiento: widget.esAvistamiento,
          ),
        ),
      );
    } catch (e) {
      if (!mounted) return;

      setState(() {
        error = e.toString();
        procesando = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('AnÃ¡lisis biomÃ©trico'),
          backgroundColor: const Color(0xFF17354F), foregroundColor: Colors.white),
      body: Container(
        width: double.infinity, height: double.infinity,
        decoration: const BoxDecoration(gradient: LinearGradient(
          begin: Alignment.topCenter, end: Alignment.bottomCenter,
          colors: [Color(0xFF17354F), Color(0xFF91B6D4), Color(0xFF17354F)],
        )),
        child: Center(child: SingleChildScrollView(child: Padding(
          padding: const EdgeInsets.all(28),
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            const Text('RIRI', style: TextStyle(fontSize: 65,
                fontWeight: FontWeight.w300, letterSpacing: 12, color: Colors.white)),
            const SizedBox(height: 30),
            if (procesando) ...[
              const CircularProgressIndicator(color: Colors.white),
              const SizedBox(height: 30),
              Text(widget.esAvistamiento
                  ? 'Consultando coincidencias en la base de datos...'
                  : 'Registrando persona desaparecida...',
                  textAlign: TextAlign.center,
                  style: const TextStyle(color: Colors.white, fontSize: 18)),
            ] else ...[
              const Icon(Icons.error_outline, color: Colors.white, size: 55),
              const SizedBox(height: 18),
              const Text('No se pudo completar la operaciÃ³n',
                  style: TextStyle(color: Colors.white, fontSize: 19)),
              const SizedBox(height: 12),
              SelectableText(error ?? 'Error desconocido',
                  style: const TextStyle(color: Colors.white), textAlign: TextAlign.center),
              const SizedBox(height: 20),
              ElevatedButton(onPressed: procesar, child: const Text('Reintentar')),
            ],
          ]),
        ))),
      ),
    );
  }
}

class PantallaResultados extends StatelessWidget {
  final dynamic datos;
  final bool esAvistamiento;
  const PantallaResultados({super.key, required this.datos,
    required this.esAvistamiento});

  dynamic campo(dynamic objeto, List<String> claves) {
    if (objeto is! Map) return null;
    for (final clave in claves) {
      if (objeto.containsKey(clave) && objeto[clave] != null) return objeto[clave];
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    final lista = datos is List ? datos :
    campo(datos, ['coincidencias', 'resultados', 'matches', 'coincidences']);
    final coincidencias = lista is List ? lista :
    (datos is Map && campo(datos, ['nombre', 'nombre_completo', 'similaridad',
      'similitud', 'similarity']) != null ? [datos] : <dynamic>[]);
    return Scaffold(
      backgroundColor: const Color(0xFFF2F5F8),
      appBar: AppBar(title: const Text('Resultados de RIRI'),
          backgroundColor: const Color(0xFF17354F), foregroundColor: Colors.white),
      body: SafeArea(child: ListView(padding: const EdgeInsets.all(24), children: [
        const Center(child: Text('RIRI', style: TextStyle(fontSize: 42,
            letterSpacing: 8, color: Color(0xFF17354F)))),
        const SizedBox(height: 20),
        Text(esAvistamiento ? 'Resultados del anÃ¡lisis biomÃ©trico'
            : 'Resultado del registro', textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 23, fontWeight: FontWeight.bold,
                color: Color(0xFF17354F))),
        const SizedBox(height: 24),
        if (coincidencias.isEmpty)
          Card(child: Padding(padding: const EdgeInsets.all(20), child: Text(
            esAvistamiento ? 'El servidor no devolviÃ³ coincidencias en un formato reconocido.'
                : 'Respuesta recibida del servidor.',
            textAlign: TextAlign.center,
          ))),
        for (final item in coincidencias)
          Card(child: Padding(padding: const EdgeInsets.all(20),
              child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                const Text('Posible coincidencia', style: TextStyle(fontSize: 20,
                    fontWeight: FontWeight.bold)),
                const SizedBox(height: 12),
                Text('Nombre: ${campo(item, ['nombre', 'nombre_completo', 'name']) ?? 'No proporcionado'}'),
                Text('Folio: ${campo(item, ['folio', 'id', 'desaparecido_id']) ?? 'No proporcionado'}'),
                Text('Administrador: ${campo(item, ['administrador', 'registrado_por', 'admin', 'usuario_registro']) ?? 'No proporcionado'}'),
                Builder(builder: (_) {
                  final valor = campo(item, ['similitud', 'similaridad', 'similarity',
                    'porcentaje', 'confidence', 'score']);
                  final numero = valor is num ? valor.toDouble() :
                  double.tryParse(valor?.toString().replaceAll('%', '') ?? '');
                  final porcentaje = numero == null ? null :
                  (numero >= 0 && numero <= 1 ? numero * 100 : numero);
                  return Padding(padding: const EdgeInsets.only(top: 12), child:
                  Text('Similitud reportada: ${porcentaje == null ? 'No proporcionada' : '${porcentaje.toStringAsFixed(1)}%'}',
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)));
                }),
              ]))),
        const SizedBox(height: 18),
        const Text('La similitud facial no confirma una identidad. Se requiere verificaciÃ³n por personal autorizado.',
            textAlign: TextAlign.center),
        const SizedBox(height: 20),
        ExpansionTile(title: const Text('Respuesta tÃ©cnica de la API'),
            children: [Padding(padding: const EdgeInsets.all(12),
                child: SelectableText(const JsonEncoder.withIndent('  ').convert(datos)))]),
        const SizedBox(height: 20),
        ElevatedButton(onPressed: () => Navigator.popUntil(context, (r) => r.isFirst),
            child: const Text('Volver al inicio')),
      ])),
    );
  }
}

