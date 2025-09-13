

# 📌 Taller 1 - Flutter

Este proyecto es un ejemplo completo que combina varios **widgets fundamentales de Flutter**, incluyendo imágenes locales y de red, manejo de estado con `setState`, y widgets interactivos como `InkWell`, `ListView`, `GridView` y `Stack`.

---

## 🎯 Objetivos

* Mostrar cómo **estructurar una app básica en Flutter**.
* Usar **`Image.asset` y `Image.network`** para cargar imágenes locales y de Internet.
* Aplicar **`InkWell` y `GestureDetector`** para detectar interacciones.
* Manejar estados con **`setState`** para actualizar la interfaz.
* Combinar diferentes widgets requeridos: `Row`, `Column`, `Stack`, `ListView`, `GridView`, `Container` y botones (`ElevatedButton`, `OutlinedButton`, etc.).

---

## ⚙️ 1. Configuración inicial

### a) Crear proyecto

```bash
flutter create taller1_flutter
cd taller1_flutter
```

### b) Agregar imagen local

Crea una carpeta `assets/` en la raíz del proyecto y coloca dentro la imagen que usarás, por ejemplo:

```
assets/
 └── unnamed.jpg
```

### c) Registrar `assets` en `pubspec.yaml`

Abre `pubspec.yaml` y agrega:

```yaml
flutter:
  assets:
    - assets/unnamed.jpg
```

Ejecuta:

```bash
flutter pub get
```

---

## 🖼️ 2. Uso de imágenes

En este proyecto se utilizan **dos tipos de imágenes**:

* **`Image.network`** → carga imágenes desde Internet:

```dart
Image.network(
  "https://storage.googleapis.com/cms-storage-bucket/6e19fee6b47b36ca613f.png",
  width: 100,
  height: 60,
  fit: BoxFit.contain,
)
```

* **`Image.asset`** → carga imágenes locales:

```dart
Image.asset(
  "assets/unnamed.jpg",
  width: 100,
  height: 60,
  fit: BoxFit.cover,
)
```

Ambas están envueltas en **`InkWell`** para detectar toques con efecto ripple y mostrar un `SnackBar`.

---

## 🛠️ 3. Manejo de estado con `setState`

La clase `_HomePageState` incluye tres estados importantes:

1. **Título dinámico (`_title`)** → cambia entre *"Hola, Flutter"* y *"¡Título cambiado!"*.
2. **Caja de color (`_cajaRoja`)** → alterna entre **rojo y verde**.
3. **Visibilidad del Grid (`_mostrarGrid`)** → muestra u oculta el `GridView`.

Ejemplo de uso:

```dart
void _cambiarTitulo() {
  setState(() {
    _title = _title == "Hola, Flutter" ? "¡Título cambiado!" : "Hola, Flutter";
  });

  ScaffoldMessenger.of(context).showSnackBar(
    const SnackBar(content: Text("Título actualizado")),
  );
}
```

---

## 🧩 4. Widgets principales usados

* **`Row` y `Column`** → organización de layout.
* **`InkWell`** → efecto ripple en imágenes.
* **`ElevatedButton`, `ElevatedButton.icon`, `OutlinedButton`** → botones interactivos.
* **`Stack`** → superposición de texto sobre imagen.
* **`ListView`** → lista de elementos con `ListTile`.
* **`GridView.count`** → cuadrícula interactiva de 4 celdas.
* **`Container`** → caja con borde y color dinámico.

---

## 🚀 5. Ejecución

1. Conecta un emulador o dispositivo físico.
2. Ejecuta:

```bash
flutter run
```

---

## 📚 6. Resumen del proyecto

Este taller demuestra:

✅ Cómo manejar estado dinámico con `setState`.
✅ Uso de imágenes locales y en red.
✅ Widgets interactivos (`InkWell`, `ListTile`, `GridView`).
✅ Layout avanzado (`Stack`, `Container`, `Column`, `Row`).
✅ Botones variados (`ElevatedButton`, `OutlinedButton`).


---
