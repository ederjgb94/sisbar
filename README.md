# SISBAR - Punto de Venta para Tiendas de Abarrotes

<div align="center">

![Flutter](https://img.shields.io/badge/Flutter-3.6+-02569B?logo=flutter&logoColor=white)
![Dart](https://img.shields.io/badge/Dart-3.0+-0175C2?logo=dart&logoColor=white)
![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS%20%7C%20Web%20%7C%20Desktop-4CAF50)
![License](https://img.shields.io/badge/License-MIT-yellow.svg)

**Sistema de Punto de Venta (POS) moderno y ligero, diseñado específicamente para tiendas de abarrotes y misceláneas mexicanas.**

</div>

---

## 📸 Vista Previa

SISBAR transforma cualquier tablet o computadora en una caja registradora inteligente, permitiendo a los tenderos escanear productos, gestionar el carrito de compras y cobrar a clientes de forma rápida e intuitiva.

> **Nota:** Capturas de pantalla próximamente.

---

## 🚀 Características Principales

| Módulo | Descripción |
|--------|-------------|
| **🛒 Carrito de Compras (MyCart)** | Interfaz principal de venta con gestión de productos, cantidades y totales en tiempo real |
| **📷 Escáner de Códigos de Barras** | Escaneo por cámara con `mobile_scanner` (EAN, UPC, Code 128, QR, etc.) con retroalimentación de sonido |
| **⌨️ Lectores USB / Bluetooth** | Soporte nativo para pistolas lectoras que funcionan como teclado (HID) |
| **🧮 Calculadora** | Calculadora integrada para operaciones rápidas sin salir de la app |
| **📦 Repositorio de Productos** | Base de datos local con productos comunes de abarrotes en México (lista expandible) |
| **🔊 Retroalimentación Auditiva** | Sonido de confirmación al escanear para agilizar el flujo de venta |
| **💰 Cobro Rápido** | Visualización clara del total a pagar con acciones de cobro y cancelación |

---

## 🛠️ Arquitectura y Stack Tecnológico

```
lib/
├── app/
│   ├── core/          # Valores constantes, strings, tema
│   ├── data/
│   │   ├── models/      # Product, Sale
│   │   ├── repositories/# ProductRepository (datos locales)
│   │   ├── services/    # CameraService, ProductService
│   │   ├── factories/   # ProductFactory (datos de prueba)
│   │   └── providers/   # DBProvider, CameraProvider
│   ├── modules/
│   │   ├── mycart/      # Punto de venta principal
│   │   ├── home/        # Dashboard / Inicio
│   │   ├── calculator/  # Calculadora
│   │   └── test/        # Módulo de pruebas
│   ├── routes/          # GetX Routing (AppPages)
│   └── widgets/         # Componentes reutilizables
└── main.dart
```

| Tecnología | Uso |
|------------|-----|
| **Flutter** | Framework UI multiplataforma |
| **GetX** | Gestión de estado, navegación e inyección de dependencias |
| **mobile_scanner** | Escaneo de códigos de barras y QR por cámara |
| **Google Fonts (Rubik)** | Tipografía moderna y consistente |
| **audioplayers** | Retroalimentación de sonido al escanear |
| **delayed_display** | Animaciones de entrada en widgets |
| **Faker** | Generación de datos de prueba en modo debug |

---

## 📦 Instalación

### Requisitos Previos

- Flutter SDK `^3.6.1`
- Dart SDK compatible
- Android Studio / Xcode / VS Code
- Dispositivo con cámara (para escaneo) o lector de códigos de barras USB/Bluetooth

### Pasos

```bash
# 1. Clonar el repositorio
git clone https://github.com/ebravo-dev/sisbar.git
cd sisbar

# 2. Instalar dependencias
flutter pub get

# 3. Ejecutar en modo debug
flutter run

# 4. Para generar APK de producción
flutter build apk --release
```

### Permisos Necesarios

Asegúrate de otorgar permisos de **cámara** y **internet** en tu dispositivo.

---

## 📱 Flujo de Uso

1. **Pantalla Principal (MyCart):** Al abrir la app, el carrito está listo para recibir productos.
2. **Agregar Productos:**
   - **Por cámara:** Presiona el botón de cámara y apunta al código de barras.
   - **Por lector USB:** Simplemente escanea con tu pistola lectora; la app detecta la entrada automáticamente.
   - **Manual:** Busca en el repositorio de productos locales.
3. **Gestionar Cantidades:** Selecciona un producto del carrito y usa los botones flotantes para aumentar o disminuir la cantidad.
4. **Cambiar Precio:** Toca el precio de un producto para ajustarlo sobre la marcha (ideal para ventas al mayoreo o promociones).
5. **Cobrar:** Revisa el total, presiona el botón de cobro y completa la venta.
6. **Cancelar:** Usa el botón rojo para limpiar el carrito y cancelar la venta actual.

---

## 🗺️ Roadmap

- [ ] Integración con base de datos local (SQLite / Hive) para persistencia
- [ ] Sincronización en la nube (Firebase / Supabase)
- [ ] Gestión de inventario y alertas de stock bajo
- [ ] Generación de tickets de venta (impresora térmica)
- [ ] Envío de tickets por WhatsApp / correo electrónico
- [ ] Reportes de ventas diarias, semanales y mensuales
- [ ] Módulo de administración de usuarios (cajero, administrador)
- [ ] Soporte para múltiples monedas y métodos de pago
- [ ] Modo offline con sincronización posterior

---

## 🤝 Contribución

¡Las contribuciones son bienvenidas! Si tienes ideas para mejorar SISBAR o encontraste un bug:

1. Haz un **Fork** del repositorio
2. Crea una rama para tu funcionalidad (`git checkout -b feature/nueva-funcionalidad`)
3. Realiza tus cambios y haz commit (`git commit -m 'Agrega nueva funcionalidad'`)
4. Sube los cambios (`git push origin feature/nueva-funcionalidad`)
5. Abre un **Pull Request**

---

## 📄 Licencia

Este proyecto está bajo la licencia **MIT**. Consulta el archivo [`LICENSE`](LICENSE) para más detalles.

---

## 👥 Contacto

**Eder J. Bravo** - [@ebravo-dev](https://github.com/ebravo-dev) - [ederjgb94@gmail.com](mailto:ederjgb94@gmail.com)

**Ana H. Lara** - [analara.stay@gmail.com](mailto:analara.stay@gmail.com)

---

<div align="center">

**⭐ Si este proyecto te es útil, ¡no olvides darle una estrella! ⭐**

</div>
