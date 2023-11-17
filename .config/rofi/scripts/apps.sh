rofi_command="rofi"

# Links
terminal="💻 Terminal"
files="📂 Archivos"
editor="📝 Editor"
browser="🧭 Navegador"
#music="🎵 Música"
settings="⚙ Configuración"

# Error msg
msg() {
    rofi -e "$1"
}
