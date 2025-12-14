Nivel Básico
1️⃣ Mostrar mensaje

Muestra en pantalla el texto: Bienvenido a PowerShell.
Write-Host "Bienvenido a PowerShell."

2️ Variables

Crea una variable $nombre con tu nombre y muéstrala en pantalla.
$nombre = "TuNombre"
Write-Host "Hola, $nombre"

3️⃣ Operaciones

Declara dos números y muestra su suma, resta y multiplicación.
$num1 = 10
$num2 = 5
#El operador $() permite evaluar expresiones dentro de cadenas


Write-Host  ($num1 + $num2)
Write-Host "Resta: $($num1 - $num2)"
Write-Host "Multiplicación: $($num1 * $num2)"

4️⃣ Directorio actual

Muestra la ruta en la que te encuentras actualmente.
Write-Host "Directorio actual: $(Get-Location)"

5️⃣ Listar archivos

Lista todos los archivos y carpetas del directorio actual.
Get-ChildItem

🟡 Nivel Medio
6️⃣ Crear carpeta con condicional
#type es el tipo de ítem a crear, en este caso una carpeta (Directory)
Create-Item -ItemType Directory -Path "Logs" 

Comprueba si existe una carpeta llamada Logs. Si no existe, créala.


# test-path verifica si la ruta existe, devuelve true o false
if (not Test-Path -Path "Logs") {
    New-Item -ItemType Directory -Path "Logs"

} else {
    Write-Host "La carpeta 'Logs' ya existe."
}

7️⃣ Crear múltiples carpetas

Usando un bucle, crea las carpetas: Enero, Febrero, Marzo.

$meses = ("Enero", "Febrero", "Marzo")
foreach ($mes in $meses) {
    New-Item -ItemType Directory -Path $mes
}



8️⃣ Crear archivo solo si no existe
if (not Test-Path -Path "datos.txt") {
    New-Item -ItemType File -Path "datos.txt"
    Write-Host "Archivo 'datos.txt' creado."
} else {
    Write-Host "El archivo 'datos.txt' ya existe."
}

Crea un archivo datos.txt solo si no existe previamente.

9️⃣ Escribir en archivo

Escribe la fecha y hora actual dentro de datos.txt.
$fechaHora = Get-Date
Add-Content -Path "datos.txt" -Value $fechaHora

"Hola Mundo" | Out-File archivo.txt

🔟 Leer archivo

Lee el contenido de datos.txt y muéstralo en pantalla.
Get-Content -Path "datos.txt"

🟠 Nivel Medio–Avanzado
1️⃣1️⃣ Condicional numérico

Pide un número y muestra si es mayor, menor o igual a 10.
$num = Read-Host "Ingresa un número"
if ($num -gt 10) {
    Write-Host "El número es mayor que 10."
} elseif ($num -lt 10) {
    Write-Host "El número es menor que 10."
} else {
    Write-Host "El número es igual a 10."
}

1️⃣2️⃣ Contar archivos

Cuenta cuántos archivos .txt hay en una carpeta.
$txtFiles = Get-ChildItem -Path . -Filter *.txt
$txtCount = $txtFiles.Count


1️⃣3️⃣ Filtrar procesos

Muestra solo los procesos que usen más de 100 MB de memoria.
Get-Process | Where-Object { $_.WorkingSet -gt 100MB } | Select-Object Name, WorkingSet

1️⃣4️⃣ Bucle con condición

Muestra los números del 1 al 20, pero solo los pares.
for ($i = 1; $i -le 20; $i++) {
    if ($i % 2 -eq 0) {
        Write-Host $i
    }
}

1️⃣5️⃣ Función personalizada

Crea una función que reciba dos números y devuelva el mayor.
function Obtener-Mayor($num1, $num2) {
    if ($num1 -gt $num2) {
        return $num1
    } else {
        return $num2
    }
}
$mayor = Obtener-Mayor 10 20
Write-Host "El número mayor es: $mayor"

🔴 Nivel Avanzado
1️⃣6️⃣ Script de carpetas por usuario

Crea una carpeta con el nombre del usuario actual del sistema.
$usuario = $env:USERNAME
$carpetaUsuario = ".\$usuario"

    New-Item -ItemType Directory -Path $carpetaUsuario
    Write-Host "Carpeta '$usuario' creada."



1️⃣7️⃣ Backup simple

Copia todos los archivos .txt de una carpeta a otra llamada Backup.
$origen = "."
$destino = ".\Backup"

 Copy-Item -Path $_.FullName -Destination $destino

1️⃣8️⃣ Limpiar carpeta

Elimina todos los archivos .log de una carpeta específica.
$carpeta = "."
    Get-ChildItem -Path $carpeta -Filter *.log | Remove-Item

1️⃣9️⃣ Registro de ejecución

Cada vez que se ejecute el script, guarda la fecha y el usuario en log.txt.
$usuario = $env:USERNAME
$fechaHora = Get-Date
$logEntry = "El usuario $usuario ejecutó el script el $fechaHora"
Add-Content -Path "log.txt" -Value $logEntry

2️⃣0️⃣ Menú interactivo

Crea un menú que permita:
$opcion = $null
while ($opcion -ne "4") {
    Write-Host "Menú:"
    Write-Host "1. Crear carpeta"
    Write-Host "2. Listar archivos"
    Write-Host "3. Salir"
    $opcion = Read-Host "Selecciona una opción (1-3)"

    switch ($opcion) {
        "1" {
            $nombreCarpeta = Read-Host "Ingresa el nombre de la carpeta a crear"
            New-Item -ItemType Directory -Path $nombreCarpeta
            Write-Host "Carpeta '$nombreCarpeta' creada."
        }
        "2" {
            Get-ChildItem
        }
        "3" {
            Write-Host "Saliendo del menú."
        }
        default {
            Write-Host "Opción no válida. Intenta de nuevo."
        }
    }
    
}

Crear carpeta

Listar archivos

Salir
