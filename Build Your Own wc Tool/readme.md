````markdown
# Build Your Own `wc` Tool

This project involves creating a custom version of the Unix command-line tool `wc` (word count). The goal is to develop a tool, `ccwc`, that counts lines, words, characters, and bytes in a file, or reads from standard input if no file is specified.

## Overview

The Unix command-line tools exemplify good software engineering practices by:

- **Writing simple parts connected by clean interfaces**: Each tool performs a specific task and provides a simple command-line interface (CLI) that handles text input from files or streams.
- **Designing programs to be connected to other programs**: Tools are designed to work together, creating powerful compositions for text data processing pipelines.

This project follows these philosophies, creating a tool that can be combined with others to process text data effectively.

## Functional Requirements

The `ccwc` tool should support the following functionalities, similar to `wc`:

- **`-c`**: Count the number of bytes in a file.
- **`-l`**: Count the number of lines in a file.
- **`-w`**: Count the number of words in a file.
- **`-m`**: Count the number of characters in a file.
- **Default**: If no options are provided, output counts for lines, words, and bytes.

## Steps

### Step Zero: Setup

- Set up your development environment with your preferred IDE/editor.
- Download the sample text file and save it as `test.txt`.

### Step One: Byte Count

Write `ccwc` to handle the `-c` option, which outputs the number of bytes in a file.

Example:

```bash
ccwc -c test.txt
# Output: 342190 test.txt
```
````

### Step Two: Line Count

Extend `ccwc` to support the `-l` option, which outputs the number of lines in a file.

Example:

```bash
ccwc -l test.txt
# Output: 7145 test.txt
```

### Step Three: Word Count

Further extend `ccwc` to handle the `-w` option, which outputs the number of words in a file.

Example:

```bash
ccwc -w test.txt
# Output: 58164 test.txt
```

### Step Four: Character Count

Add support for the `-m` option to count characters in a file. Compare your results with the `wc` tool for consistency.

Example:

```bash
ccwc -m test.txt
# Output: 339292 test.txt
```

### Step Five: Default Option

If no options are provided, `ccwc` should output the counts for lines, words, and bytes.

Example:

```bash
ccwc test.txt
# Output: 7145 58164 342190 test.txt
```

### Final Step: Standard Input

Support reading from standard input if no filename is specified.

Example:

```bash
cat test.txt | ccwc -l
# Output: 7145
```

## Usage

- **File input**: `./ccwc.sh [options] <file>`
- **Standard input**: `cat <file> | ./ccwc.sh [options]`



## Tags

- `unix`
- `beginner`
- `cli`


