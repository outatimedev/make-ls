# make-ls

A simple command-line tool to list all targets in a Makefile with their descriptions.

## Features

- Works in any directory containing a Makefile
- Automatically finds Makefile (searches for "Makefile", "makefile", or "GNUmakefile")
- Displays an error message if no Makefile is found
- Lists all targets with their descriptions (if available)

## Installation

You can install this script using curl:

```bash
curl -sSL https://raw.githubusercontent.com/yourusername/make-ls/main/install.sh | bash
```

Or, you can clone the repository and run the installation script:

```bash
git clone https://github.com/yourusername/make-ls.git
cd make-ls
./install.sh
```

## Usage

After installation, you can use the script by running:

```bash
makels
```

Run this command in any directory containing a Makefile. If no Makefile is found, an error message will be displayed.

## Integration with your Makefile

While `makels` can be run directly from the command line, you can also add it as a target in your Makefile for convenience:

```makefile
.PHONY: ls
ls: ## List all targets
	@makels
```

Now you can run `make ls` to list all targets in your Makefile.

