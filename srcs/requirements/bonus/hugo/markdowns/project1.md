---
title: "Minishell"
date: 2023-09-09T16:21:26Z
draft: false
cover:
  image: "https://imgs.search.brave.com/1ftr9jeGNxGTOjlaESBEbeP-LwlEuG9V1KRVZ5pq4pU/rs:fit:860:0:0/g:ce/aHR0cHM6Ly93d3cu/Z2l0a3Jha2VuLmNv/bS93cC1jb250ZW50/L3VwbG9hZHMvMjAy/Mi8wMi9DTEktc3Rh/bmRzLWZvckhlcm8u/cG5n"
  alt: "shell picture"
ShowToc: true
ShowPostNavLinks: true

editPost:
    URL: "https://github.com/SpicyI/Minishell"
    Text: "Suggest Changes" # edit text
    # appendFilePath: true # to append file path to Edit link
socialIcons: # optional
        - name: "custom"
          url: "https://github.com/SpicyI/Minishell"
---

# Minishell:

Minishell is a simplified Unix shell implementation, built as a programming project. It provides a command-line interface that allows users to interact with the operating system by executing commands.

This project aims to recreate a subset of the functionalities found in a traditional Unix shell. It serves as an exercise in systems programming and provides an opportunity to understand the inner workings of a shell environment.


# Objective:

Objective: To create a simplified shell or command-line interpreter, similar to the Unix/Linux shell (e.g., Bash).

# Key Concepts and Learning Objectives:

- **Processes** and Forking: Students learn about creating processes using the fork() system call. They must understand how to create child processes, which execute shell commands, and how the parent process manages them.
- **System Calls**: This project involves using essential system calls such as fork(), execve(), wait(), pipe(), and dup2(). Students learn how these calls work and how to use them effectively.
- **Command Parsing**: Parsing user input and breaking it down into commands and arguments is a critical part of building a shell. Students must implement a parser to handle command-line arguments and redirection.
- **Built-in Commands**: In addition to external commands, students implement a set of built-in commands, such as cd, echo, and env, which are executed by the shell directly without invoking external programs.
- **Redirection and Piping**: Students learn how to handle I/O redirection (e.g., <, >, >>) and piping (e.g., |) between commands.
- **Environment Variables**: Managing environment variables (e.g., PATH, HOME, USER) is an essential part of the shell. Students must implement functions to get, set, and manage environment variables.
- **Signal Handling**: Understanding and handling signals (e.g., Ctrl+C, Ctrl+D) is crucial for a shell. Students must ensure the shell can manage signals gracefully.
- **Error Handling**: Effective error handling is essential to provide informative feedback to users when things go wrong.
- **Shell Prompt**: Students often create a customized shell prompt that displays information like the current directory, username, hostname, etc.
- **User Interaction**: The shell should provide a command-line interface where users can interact with the system, execute commands, and navigate directories.
- **Challenges**: Building a shell is a complex task that requires a deep understanding of system programming concepts, including process management, file descriptors, and system calls. Handling edge cases and ensuring proper error handling can be challenging.
- **Useful Skills**: This project helps students develop skills in C programming, system calls, process management, input/output handling, and error handling. It also deepens their understanding of how a shell works internally.
- **Project Extensions**: Some students take this project further by implementing additional features like job control, scripting support, and more advanced redirection options.


## Features

- Command Parsing: Minishell parses user input to identify and interpret commands, arguments, and options.
- Process Management: It handles process creation, execution, and termination, allowing users to run commands and external programs.
- Built-in Commands: The shell supports a set of built-in commands, such as `cd` for changing directories and `exit` for terminating the shell.
- Redirection and Pipes: Minishell supports input/output redirection, allowing users to redirect input and output streams. It also enables the piping of commands, allowing the output of one command to serve as input to another.
- Environment Variables: The shell supports the creation and management of environment variables.
- Signal Handling: Minishell handles signals such as `Ctrl-C` and `Ctrl-\` to terminate or suspend the shell.

## Installation

1. Clone the repo
   ```sh
   git clone https://github.com/SpicyI/minishell.git
    ```
2. Make sure to install the readline library
   ```sh
   brew install readline
   ```
   and set the path to the library in the Makefile
   ```sh
    LD_FLAGS = -L/Users/$(USER)/.brew/opt/readline/lib -lreadline
    INC_FLAGS = -I/Users/$(USER)/.brew/opt/readline/include
    ```
3. Run make


## Conclusion

This project serves as an educational tool to deepen understanding of fundamental operating system concepts, process management, and command-line interfaces. By implementing a subset of shell functionalities, users can gain hands-on experience and enhance their programming skills in a system-level environment.

Please note that while Minishell aims to replicate some features of a real shell, it may not support the entire range of complex features found in production-level shells like Bash or Zsh.
