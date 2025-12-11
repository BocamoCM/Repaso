# Configuración de Redirección HTTP → HTTPS en Apache (Ubuntu) con certificado local

Este documento resume cómo configurar Apache para que redirija todo el tráfico HTTP a HTTPS usando un certificado autofirmado (snakeoil) en un entorno local.

---

## 1️⃣ VirtualHost HTTP (Redirección)

**Archivo:**
```
/etc/apache2/sites-available/000-default.conf
```

**Contenido:**
```apache
<VirtualHost *:80>
    ServerName f1.com
    ServerAlias www.f1.com

    Redirect permanent / https://f1.com/

    DocumentRoot /var/www/html
</VirtualHost>
```

- Redirige todo el tráfico HTTP hacia HTTPS.
- Apache escucha en puerto 80.

---

## 2️⃣ VirtualHost HTTPS

**Archivo:**
```
/etc/apache2/sites-available/f1-ssl.conf
```

**Contenido:**
```apache
<VirtualHost *:443>
    ServerName f1.com
    ServerAlias www.f1.com

    DocumentRoot /var/www/html

    SSLEngine on
    SSLCertificateFile      /etc/ssl/certs/ssl-cert-snakeoil.pem
    SSLCertificateKeyFile   /etc/ssl/private/ssl-cert-snakeoil.key

    ErrorLog ${APACHE_LOG_DIR}/error.log
    CustomLog ${APACHE_LOG_DIR}/access.log combined
</VirtualHost>
```

- Apache escucha en puerto 443.
- Se utiliza un certificado autofirmado (snakeoil) para HTTPS.

---

## 3️⃣ Certificado SSL Autofirmado (Snakeoil)

**Certificado:**
```
/etc/ssl/certs/ssl-cert-snakeoil.pem
```

**Clave privada:**
```
/etc/ssl/private/ssl-cert-snakeoil.key
```

---

## 4️⃣ DocumentRoot

**Carpeta donde se encuentra tu web local:**
```
/var/www/html
```

- Aquí van tus archivos `index.html`, `index.php`, etc.

---

## 5️⃣ Hosts local en Windows

**Archivo:**
```
C:\Windows\System32\drivers\etc\hosts
```

**Contenido:**
```
IP_DEL_SERVIDOR_UBUNTU   f1.com
IP_DEL_SERVIDOR_UBUNTU   www.f1.com
```

- Esto asegura que `f1.com` apunta a tu servidor local y no a la web oficial.
- Después de editar el archivo, limpiar la caché DNS:
```cmd
ipconfig /flushdns
```

---

## 6️⃣ Comandos importantes de Apache

```bash
# Activar módulo SSL
sudo a2enmod ssl

# Activar sitios
sudo a2ensite 000-default.conf
sudo a2ensite f1-ssl.conf

# Reiniciar Apache
sudo systemctl restart apache2

# Verificar configuración
sudo apache2ctl configtest
```

**Notas:**
- `a2enmod ssl` → activa SSL en Apache.
- `a2ensite` → activa los VirtualHost configurados.
- `configtest` → verifica sintaxis de Apache antes de reiniciar.

---

## 7️⃣ Pruebas

**Desde Windows o cualquier máquina en la misma red:**
```cmd
ping f1.com
```

**Acceder al navegador:**
- `http://f1.com` → debe redirigir automáticamente a `https://f1.com`
- Aceptar la advertencia de certificado autofirmado en el navegador

---

## ✅ Resumen del flujo

1. Usuario accede a `http://f1.com` (puerto 80)
2. Apache redirige a `https://f1.com` (puerto 443)
3. Se establece conexión SSL con certificado snakeoil
4. Se sirve el contenido desde `/var/www/html`
