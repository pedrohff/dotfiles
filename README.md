# Dotfiles

This is a project to automate the setup of a new linux machine, installing tools, aliases and other bash utilitaries.

This way I can also version my .bashrc related files.

## Usage

Clone the project with
```bash
git clone https://github.com/pedrohff/dotfiles.git ~/dotfiles
```

And run the installer
```bash
sudo chmod +x ~/dotfiles/install
~/dotfiles/install
```

## What's in here?

Here lies settings for my development environments. I did not plan yet if this is hosting stuff only for Linux environments, or if it's going to have MacOS settings as well.

A short list on software I tend to use on the OS and the reasoning behind it:

### Zsh

Zsh as a substitute to Bash is not a big deal for me. I just use it to make easier to install some UI changes to my terminal that I have used for the past 5+ years, it's convenient and transparent to me, alongside with Starship it makes my terminals looks nice in any platform I set it up.

#### Oh My Zsh

Install script:
```sh
sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"
```

#### Zsh Syntax Highlighting

Install script:  
```sh
sudo apt install zsh-syntax-highlighting
```

#### Starship

Install Starship:  
```sh
curl -sS https://starship.rs/install.sh | sh
```
