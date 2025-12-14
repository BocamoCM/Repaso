$respuesta_correcta = "Pepe"
$intentos = 5

Start-Process '.\images (1).jfif'
while ($intentos -gt 0) {
    $nombre_usuario = Read-Host "¿Cuál es el nombre del personaje en la imagen?"

    if ($respuesta_correcta -eq $nombre_usuario) {
        Write-Host "Respuesta Correcta"
        break
    } else {
        $intentos--
        Write-Host "Incorrecto. Te quedan $intentos intentos."
    }
}

if ($intentos -eq 0) {
    Write-Host "Has perdido"
}

-----
# PowerShell Cheat Sheet 🧠⚡

Guía rápida de PowerShell con ejemplos prácticos y sencillos.

---

## 📌 Básico

```powershell
# Mostrar texto
Write-Host "Hola PowerShell"

# Limpiar pantalla
Clear-Host

# Obtener ayuda
Get-Help Get-Process
Get-Help Get-Process -Examples
```

---

## 📁 Archivos y Carpetas

```powershell
# Listar archivos y carpetas
Get-ChildItem
Get-ChildItem C:\Users

# Crear carpeta
New-Item -ItemType Directory -Name "NuevaCarpeta"

# Crear archivo
New-Item -ItemType File -Name "archivo.txt"

# Copiar archivo
Copy-Item archivo.txt copia.txt

# Mover archivo
Move-Item copia.txt C:\Temp

# Eliminar archivo o carpeta
Remove-Item archivo.txt
```

---

## 📍 Navegación

```powershell
# Ver ubicación actual
Get-Location

# Cambiar de directorio
Set-Location C:\Users

# Volver atrás
Set-Location ..
```

---

## 🧮 Variables y Operadores

```powershell
$nombre = "Ana"
$edad = 30

# Mostrar variables
Write-Host "Nombre:" $nombre

# Operaciones
$a = 10
$b = 3
$a + $b
$a - $b
$a * $b
$a / $b
```

---

## 🔀 Condicionales

```powershell
$numero = 8

if ($numero -gt 5) {
    Write-Host "Mayor que 5"
} elseif ($numero -eq 5) {
    Write-Host "Es 5"
} else {
    Write-Host "Menor que 5"
}
```

---

## 🔁 Bucles

### foreach

```powershell
$lista = 1,2,3,4
foreach ($i in $lista) {
    Write-Host $i
}
```

### for

```powershell
for ($i = 1; $i -le 5; $i++) {
    Write-Host $i
}
```

### while

```powershell
$i = 1
while ($i -le 3) {
    Write-Host $i
    $i++
}
```

---

## 📄 Archivos (Lectura / Escritura)

```powershell
# Escribir en archivo
"Hola Mundo" | Out-File archivo.txt

# Añadir contenido
"Otra línea" | Add-Content archivo.txt

# Leer archivo
Get-Content archivo.txt
```

---

## 🧩 Funciones

```powershell
function Sumar {
    param ($a, $b)
    return $a + $b
}

Sumar 3 4
```

---

## ⚙️ Procesos y Servicios

```powershell
# Ver procesos
Get-Process

# Filtrar proceso
Get-Process | Where-Object {$_.CPU -gt 100}

# Detener proceso
# Stop-Process -Name notepad

# Ver servicios
Get-Service

# Iniciar servicio
# Start-Service -Name wuauserv
```

---

## 🔍 Filtros y Pipes

```powershell
# Pipe
Get-ChildItem | Where-Object {$_.Extension -eq ".txt"}

# Seleccionar propiedades
Get-Process | Select-Object Name, CPU
```

---

## 🌐 Red

```powershell
# Ver IP
Get-NetIPAddress

# Probar conexión
Test-Connection google.com
```

---

## 🛠️ Scripts

```powershell
# Ejecutar script
.\script.ps1

# Permitir scripts (Administrador)
Set-ExecutionPolicy RemoteSigned
```

---

## 📚 Tips Útiles

```powershell
# Autocompletar
TAB

# Historial de comandos
Get-History

# Alias
Get-Alias ls
```

---

✅ **Tip final:** PowerShell trabaja con **objetos**, no solo texto. Usa `Get-Member` para explorarlos:

```powershell
Get-Process | Get-Member
```

---

# 🧪 Ejercicios Prácticos de PowerShell (15–20)

Resuelve estos ejercicios creando scripts `.ps1` o ejecutándolos en la consola.

---

## 🟢 Nivel Básico

### 1️⃣ Mostrar mensaje

Muestra en pantalla el texto: `Bienvenido a PowerShell`.

---

### 2️⃣ Variables

Crea una variable `$nombre` con tu nombre y muéstrala en pantalla.

---

### 3️⃣ Operaciones

Declara dos números y muestra su suma, resta y multiplicación.

---

### 4️⃣ Directorio actual

Muestra la ruta en la que te encuentras actualmente.

---

### 5️⃣ Listar archivos

Lista todos los archivos y carpetas del directorio actual.

---

## 🟡 Nivel Medio

### 6️⃣ Crear carpeta con condicional

Comprueba si existe una carpeta llamada `Logs`. Si no existe, créala.

---

### 7️⃣ Crear múltiples carpetas

Usando un bucle, crea las carpetas: `Enero`, `Febrero`, `Marzo`.

---

### 8️⃣ Crear archivo solo si no existe

Crea un archivo `datos.txt` solo si no existe previamente.

---

### 9️⃣ Escribir en archivo

Escribe la fecha y hora actual dentro de `datos.txt`.

---

### 🔟 Leer archivo

Lee el contenido de `datos.txt` y muéstralo en pantalla.

---

## 🟠 Nivel Medio–Avanzado

### 1️⃣1️⃣ Condicional numérico

Pide un número y muestra si es mayor, menor o igual a 10.

---

### 1️⃣2️⃣ Contar archivos

Cuenta cuántos archivos `.txt` hay en una carpeta.

---

### 1️⃣3️⃣ Filtrar procesos

Muestra solo los procesos que usen más de 100 MB de memoria.

---

### 1️⃣4️⃣ Bucle con condición

Muestra los números del 1 al 20, pero solo los pares.

---

### 1️⃣5️⃣ Función personalizada

Crea una función que reciba dos números y devuelva el mayor.

---

## 🔴 Nivel Avanzado

### 1️⃣6️⃣ Script de carpetas por usuario

Crea una carpeta con el nombre del usuario actual del sistema.

---

### 1️⃣7️⃣ Backup simple

Copia todos los archivos `.txt` de una carpeta a otra llamada `Backup`.

---

### 1️⃣8️⃣ Limpiar carpeta

Elimina todos los archivos `.log` de una carpeta específica.

---

### 1️⃣9️⃣ Registro de ejecución

Cada vez que se ejecute el script, guarda la fecha y el usuario en `log.txt`.

---

### 2️⃣0️⃣ Menú interactivo

Crea un menú que permita:

1. Crear carpeta
2. Listar archivos
3. Salir

---

💡 **Consejo:** usa estos comandos como apoyo:

```powershell
Test-Path
New-Item
Get-Date
$env:USERNAME
Read-Host
```

---

---

# ✅ Soluciones de los Ejercicios

> Puedes copiar cada bloque y ejecutarlo directamente en PowerShell o guardarlo como `.ps1`.

---

## 🟢 Nivel Básico

### 1️⃣ Mostrar mensaje

```powershell
Write-Host "Bienvenido a PowerShell"
```

---

### 2️⃣ Variables

```powershell
$nombre = "TuNombre"
Write-Host "Hola" $nombre
```

---

### 3️⃣ Operaciones

```powershell
$a = 10
$b = 5
$a + $b
$a - $b
$a * $b
```

---

### 4️⃣ Directorio actual

```powershell
Get-Location
```

---

### 5️⃣ Listar archivos

```powershell
Get-ChildItem
```

---

## 🟡 Nivel Medio

### 6️⃣ Crear carpeta con condicional

```powershell
if (-not (Test-Path "Logs")) {
    New-Item -ItemType Directory -Name "Logs"
}
```

---

### 7️⃣ Crear múltiples carpetas

```powershell
$meses = "Enero", "Febrero", "Marzo"
foreach ($mes in $meses) {
    New-Item -ItemType Directory -Name $mes -ErrorAction SilentlyContinue
}
```

---

### 8️⃣ Crear archivo solo si no existe

```powershell
if (-not (Test-Path "datos.txt")) {
    New-Item datos.txt
}
```

---

### 9️⃣ Escribir en archivo

```powershell
Get-Date | Out-File datos.txt
```

---

### 🔟 Leer archivo

```powershell
Get-Content datos.txt
```

---

## 🟠 Nivel Medio–Avanzado

### 1️⃣1️⃣ Condicional numérico

```powershell
$numero = Read-Host "Introduce un número"
$numero = [int]$numero

if ($numero -gt 10) {
    Write-Host "Mayor que 10"
} elseif ($numero -eq 10) {
    Write-Host "Igual a 10"
} else {
    Write-Host "Menor que 10"
}
```

---

### 1️⃣2️⃣ Contar archivos .txt

```powershell
(Get-ChildItem -Filter *.txt).Count
```

---

### 1️⃣3️⃣ Filtrar procesos

```powershell
Get-Process | Where-Object { $_.WorkingSet -gt 100MB }
```

---

### 1️⃣4️⃣ Bucle pares

```powershell
for ($i = 1; $i -le 20; $i++) {
    if ($i % 2 -eq 0) {
        Write-Host $i
    }
}
```

---

### 1️⃣5️⃣ Función mayor

```powershell
function Mayor {
    param ($a, $b)
    if ($a -gt $b) { $a } else { $b }
}

Mayor 5 9
```

---

## 🔴 Nivel Avanzado

### 1️⃣6️⃣ Carpeta por usuario

```powershell
$usuario = $env:USERNAME
New-Item -ItemType Directory -Name $usuario -ErrorAction SilentlyContinue
```

---

### 1️⃣7️⃣ Backup simple

```powershell
New-Item -ItemType Directory -Name Backup -ErrorAction SilentlyContinue
Copy-Item *.txt Backup
```

---

### 1️⃣8️⃣ Limpiar carpeta .log

```powershell
Remove-Item *.log -ErrorAction SilentlyContinue
```

---

### 1️⃣9️⃣ Registro de ejecución

```powershell
"$(Get-Date) - $env:USERNAME" | Add-Content log.txt
```

---

### 2️⃣0️⃣ Menú interactivo

```powershell
$opcion = 0
while ($opcion -ne 3) {
    Write-Host "1. Crear carpeta"
    Write-Host "2. Listar archivos"
    Write-Host "3. Salir"

    $opcion = Read-Host "Selecciona una opción"

    switch ($opcion) {
        1 {
            $nombre = Read-Host "Nombre de la carpeta"
            New-Item -ItemType Directory -Name $nombre -ErrorAction SilentlyContinue
        }
        2 { Get-ChildItem }
        3 { Write-Host "Saliendo..." }
    }
}
```

---

🎉 **Enhorabuena**: si entiendes estos ejercicios, ya tienes una base sólida en PowerShell.

¿Quieres ahora **retos**, **scripts reales de sysadmin**, o una **chuleta avanzada**? 🚀
