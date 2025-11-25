# Zen Dotfiles

## Installation

- Git clone the repository to your local machine.

```bash
git clone https://github.com/yellhtetaung/zen-dotfiles.git ~/.config/zen
```

- Add the following lines to your `~/.zprofile` or `~/.zshrc` (if you are using bash, then `~/.bash_profile` or `~/.bashrc`) config file

```bash
source "$HOME/.config/zen/init.sh"
```

- Restart the terminal or run this command to apply this changes.

```bash
source ~/.zprofile
```

## Features

- Customized Zsh configuration with Oh My Zsh plugins and themes.
- Aliases for common commands and Git operations.
- Custom prompt with Git branch and status information.
- Custom functions for enhanced productivity.

## Common Aliases

| Command | Description                        |
| :------ | :--------------------------------- |
| ..      | Go to parent directory             |
| ...     | Go to grandparent directory        |
| ls      | `ls` comment with folder color     |
| la      | `ls -a` comment with folder color  |
| ll      | `ls -l` comment with folder color  |
| lsa     | `ls -al` comment with folder color |
| reload  | Reload the dotfiles configuration  |

## Git Aliases

| Command    | Description                                |
| :--------- | :----------------------------------------- |
| g          | git                                        |
| gp         | git push                                   |
| gpl        | git pull                                   |
| gc         | git commit                                 |
| ga         | git add                                    |
| gaa        | git add -A                                 |
| gst        | git status                                 |
| gb         | git branch                                 |
| gl         | git log --oneline --graph --decorate --all |
| gco        | git checkout                               |
| gcb        | git checkout -b                            |
| podinstall | Install pod dependencies                   |

## React Native Aliases

| Command      | Description                                      |
| :----------- | :----------------------------------------------- |
| rnstart      | Start the react native project                   |
| rnios        | Run the react native project on iOS simulator    |
| rnandroid    | Run the react native project on Android emulator |
| rninfo       | Show react native project information            |
| rndoctor     | Run react native doctor command                  |
| rnclean      | Clean the react native project                   |
| rnasset      | Generate react native assets                     |
| rnpodinstall | Install react native pod dependencies            |
| podinstall   | Install pod dependencies                         |

### Usage of podinstall

- Install iOS pod dependencies without cleaning and not change the new architecture flag.

```bash
podinstall
```

- Install iOS pod dependencies with cleaning and not change the new architecture flag.

```bash
podinstall --mode=clean
```

- Install iOS pod dependencies with cleaning and change the new architecture flag to true.

```bash
podinstall --mode=clean --arch=true
```

- Install iOS pod dependencies with cleaning and change the new architecture flag to false.

```bash
podinstall --mode=clean --arch=false
```


## Contributing

Contributions are welcome! If you have any suggestions, improvements, or bug fixes, please open an issue or submit a pull request.

## License

This project is licensed under the [MIT License](LICENSE).
