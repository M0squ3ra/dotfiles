# dotfiles

## Empezar desde cero

```
git init --bare $HOME/.dotfiles
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
config config --local status.showUntrackedFiles no
echo "alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'" >> $HOME/.bashrc
```

## Añadir archivos:

```
config status
config add .vimrc
config commit -m "Add vimrc"
```

## Instala tus archivos ocultos en un sistema nuevo (o migra a esta configuración)

### Antes de la instalación, comprueba que has confirmado el alias en tu .bashrc o .zsh:

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### Comprueba también que tu repositorio de origen ignora la carpeta en la que lo clonarás, para que no crees problemas de recursividad:

```
echo ".dotfiles" >> .gitignore
```

### Ahora clona tus archivos ocultos en un repositorio bare en una carpeta "dot" de tu $HOME:

```
git clone --bare <git-repo-url> $HOME/.dotfiles
```

### Define el alias en el alcance del shell actual:

```
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
```

### Extrae el contenido real del repositorio base en tu $HOME:

```
config checkout
```

### El paso anterior puede fallar con un mensaje como este:

```
error: The following untracked working tree files would be overwritten by checkout:
    .bashrc
    .gitignore
Please move or remove them before you can switch branches.
Aborting
```

Esto se debe a que es posible que tu carpeta $HOME ya tenga algunos archivos de configuración de stock que Git sobrescribiría. La solución es sencilla: haz una copia de seguridad de los archivos si te importan y elimínalos si te dan igual. Te doy un atajo para mover todos los archivos incorrectos automáticamente a una carpeta de respaldo:

```
mkdir -p .config-backup && \
config checkout 2>&1 | egrep "\s+\." | awk {'print $1'} | \
xargs -I{} mv {} .config-backup/{}
```

### Vuelve a ejecutar la extracción si has tenido problemas:

```
config checkout
```

### Establece la marca showUntrackedFiles en no en este repositorio (local):

```
config config --local status.showUntrackedFiles no
```

### Descargar submodulos

```
config submodule update --init
```

### Crear symlink a oh-my-zsh custom
```
rm -r $HOME/.oh-my-zsh/custom && ln -s $HOME/oh-my-zsh-custom .oh-my-zsh/custom
```

Todo listo, a partir de ahora puedes escribir comandos config para añadir y actualizar tus archivos ocultos:
