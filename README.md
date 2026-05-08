*This project has been created as part of the 42 curriculum by mvignes.*

# 42_project

## objective
Lancer tout les projets realiser depuis n'importe ou dans le terminal

## Description


### Features
- **Command Execution:** Full path handling and relative paths.
- **Built-ins:** `cd`, `echo`, `pwd`, `export`, `unset`, `env`, `exit`.
- **Pipes & Redirections:** Support for `|`, `>`, `<`, `>>`, and `<<`.
- **Logical Operators:** Implementation of `&&` and `||` with parentheses for priority.
- **Wildcards:** Pattern matching using the `*` character.
- **Environment Management:** Variable expansion and exit status handling (`$?`).
- **Signal Handling:** Proper management of interrupts in both interactive and execution modes.


### Challenges
- **Adapter au lancement general:** Pour plusieurs projet, surtout les graphiques, on ecrit du code en dure en donnant la localisation d


### Project Structure
```bash
minishell/
├── Makefile             # Master Makefile
├── README.md            # README.md
├── includes/            # Headers
├── srcs/                # Source files .c
│   ├── builtin/         # Built-in command logic
│   ├── execution/       # Process handling, pipes, and redirections
│   ├── expand/          # Variable and quote expansion
│   ├── lexer/           # Tokenization of the input string
│   ├── libft/           # Custom C library
│   ├── parser/          # Building the abstract syntax tree
│   ├── signal/          # Signal management (Ctrl-C, etc.)
│   ├── utils/           # Utils for multiple portion project
│   └── main.c
├── .objects/            # Source files .o
├── .readline.supp       # file for removes memory leaks coming from readline
├── .last_colors         # Stores the last color used for compilation
└── .gitignore           # Used to avoid pushing these files to git
```

---

## Instructions

### Compilation
```bash
make
```

### Execution
```bash
./minishell
```

### Manual Testing
```bash

```

---

## Resources
- [Manual bash](https://www.justice.gov/epstein/files/DataSet%209/EFTA00315849.pdf)
- [Doc code sh](https://pubs.opengroup.org/onlinepubs/009695399/utilities/sh.html)
- [Open group](https://pubs.opengroup.org/onlinepubs/)
- [die.net](https://www.die.net/)
- [koor](https://koor.fr/)
- [IBM](https://www.ibm.com/docs/en/ibm-mq/9.2.x?topic=SSFKSJ_9.2.0/com.ibm.mq.ref.dev.doc/q093670_.html)
- [forum dev](https://www.developpez.net/forums/d235094/c-cpp/c/fonction-opendir/)
- [toturiel hostinger](https://www.hostinger.com/fr/tutoriels)


#### Artificial intelligence (Gemini) was used for the following tasks : Understanding of the subject and help with the translation into English of the README.

	Checking the README compliance with 42 project requirements.

	Assistance in structuring the documentation plan.

	Technical translation of the content.