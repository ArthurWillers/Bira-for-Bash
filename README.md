# Bira-for-Bash
An adaptation of the "bira" theme from Oh My Zsh for Bash.

## Features

- Clean and informative two-line prompt
- Displays user@hostname with distinct colors (red for root, green for regular users)
- Shows the full path of the current working directory
- Automatically detects and displays the current Git branch
- Automatically detects and displays the active Conda environment

## Prerequisites

- **Bash**: Version 4.0 or higher is recommended
- **Git**

## Installation

Follow these steps to install the theme.

### 1. Clone the Repository

First, clone this repository into a directory in your home folder. We suggest using `~/.bash_themes` for organization.

```bash
# Create the directory if it doesn't exist
mkdir -p ~/.bash_themes

# Clone the repository into the created directory
git clone https://github.com/ArthurWillers/Bira-for-Bash.git ~/.bash_themes/bira-bash
```

**Note**: The theme will be cloned into a folder named `bira-bash` to keep things tidy.

### 2. Load the Theme in Your .bashrc

Open your `~/.bashrc` file with your favorite text editor (e.g., nano, vim, or gedit).

```bash
nano ~/.bashrc
```

Add the following line to the end of the file:

```bash
# Load the Bira for Bash theme
if [ -f ~/.bash_themes/bira-bash/bira.bash ]; then
    source ~/.bash_themes/bira-bash/bira.bash
fi
```

*Using an if statement prevents your shell from throwing an error if the theme file is ever accidentally moved or deleted.*

### 3. Apply the Changes

To see the new theme, either close and reopen your terminal or run the following command to reload your shell's configuration:

```bash
source ~/.bashrc
```

That's it! Your new prompt should now be active.

### Using as Root

If you want to use this theme as the root user, you'll need to repeat the same installation steps in `/root`:

1. Copy the theme files to `/root/.bash_themes/bira.bash`
2. Add the source lines to `/root/.bashrc`
3. Reload the root shell configuration with `source /root/.bashrc`

## Uninstallation

1. Open your `~/.bashrc` file and remove the lines you added during installation
2. Save the file
3. Remove the theme's directory:

```bash
rm -rf ~/.bash_themes/bira-bash
```

4. Reload your shell configuration with `source ~/.bashrc` or restart your terminal

## Contributing

Contributions are welcome! Whether it's bug fixes, new features, or improvements to the documentation, feel free to:

- Open an issue to report bugs or suggest enhancements
- Submit pull requests with your improvements
- Share feedback and suggestions

All contributions help make this project better for everyone.

## Acknowledgements

This theme is an adaptation inspired by the "bira" theme from the incredible [Oh My Zsh](https://ohmyz.sh/) project.

## License

This project is licensed under the MIT License. See the LICENSE file for details.
