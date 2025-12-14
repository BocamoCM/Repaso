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
