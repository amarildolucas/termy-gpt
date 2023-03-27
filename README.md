# Termy GPT

Your terminal AI assistant supported by [OpenAI API](https://platform.openai.com/docs/api-reference/making-requests).

## Authenticate

Termy uses the [OpenAI API](https://platform.openai.com/docs/api-reference/authentication) which means that you will need to get your API keys for authentication from the API Keys page from OpenAI to run commands.

To use your credentials in a terminal, you can paste the command below into your terminal to export your API key as an environment key `OPENAI_API_KEY`.

```bash
export OPENAI_API_KEY=PASTE_YOUR_API_KEY_HERE
```

## What you can do with commands

Currently `termy` support the following tasks:

- [x] **[Completions](https://platform.openai.com/docs/api-reference/completions):** creates predicted completion for the provided prompt and parameters.
- [x] **[Chat](https://platform.openai.com/docs/api-reference/chat):** Create chat completion responses.
- [x] **[Models](https://platform.openai.com/docs/api-reference/models):** Lists the currently available models or retrieves a model instance.

**Note:** Run `$ termy --help` to learn more about commands.

```
OVERVIEW: Your terminal AI assistant.

USAGE: termy <subcommand>

OPTIONS:
  --version               Show the version.
  -h, --help              Show help information.

SUBCOMMANDS:
  models                  List the currently available models and provide basic information about each one such as the owner and
                          availability.
  create-completions      Given a prompt, the model will return one or more predicted completions.
  chat                    Given a chat conversation, the model will return a chat completion response.

  See 'termy help <subcommand>' for detailed help.
```

## Creating completions

The command `$ termy create-completions` creates a completion for the provided prompt and parameters. 

**Note:** Run `$ termy create-completions --help` in your terminal to learn more about the command.

```bash
OVERVIEW: Given a prompt, the model will return one or more predicted completions.

USAGE: termy create-completions <prompt> [--model <model>] [--max-tokens <max-tokens>] [--temperature <temperature>]

ARGUMENTS:
  <prompt>                The prompt(s) to generate completions for, encoded as a string.

OPTIONS:
  --model <model>         ID of the model to use. You can use the `termy models` command to see all available models.
  -m, --max-tokens <max-tokens>
                          The maximum number of tokens to generate in the completion. The token count of your prompt plus max-tokens cannot
                          exceed the model\'s context length. Most models have a context length of 2048 tokens (except for the newest models,
                          which support 4096).
  -t, --temperature <temperature>
                          What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while
                          lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but
                          not both.
  --version               Show the version.
  -h, --help              Show help information.
```

## Generating chat responses

The command `$ termy chat` return a chat completion response. 

**Note:** Run `$ termy chat --help` in your terminal to learn more about the command.

```bash
OVERVIEW: Given a chat conversation, the model will return a chat completion response.

USAGE: termy chat <message> [--model <model>] [--max-tokens <max-tokens>] [--temperature <temperature>]

ARGUMENTS:
  <message>               The messages to generate chat completions for, in the chat format.

OPTIONS:
  --model <model>         ID of the model to use. You can use the `termy models` command to see all available models.
  -m, --max-tokens <max-tokens>
                          The maximum number of tokens to generate in the completion. The token count of your prompt plus max-tokens cannot
                          exceed the model\'s context length. Most models have a context length of 2048 tokens (except for the newest models,
                          which support 4096).
  -t, --temperature <temperature>
                          What sampling temperature to use, between 0 and 2. Higher values like 0.8 will make the output more random, while
                          lower values like 0.2 will make it more focused and deterministic. We generally recommend altering this or top_p but
                          not both.
  --version               Show the version.
  -h, --help              Show help information.
```

## Work with models

The command `$ termy models` lists the currently available models, and provides basic information about each one. When you provide the `--identifier` argument you can retrieve a specific model instance to use or override the default models in all termy commands that accept the `--model` argument.

**Note:** Run `$ termy models --help` in your terminal to learn more about the command.

```bash
OVERVIEW: Lists the currently available models, and provides basic information about each one such as the owner and availability.

USAGE: termy models [--identifier <identifier>]

OPTIONS:
  -i, --identifier <identifier>
                          Retrieves a model instance, providing basic information about the model such as the owner.
  --version               Show the version.
  -h, --help              Show help information.
```

## Installation

> **Note:** Termy is currently in development and for now we only support macOS and default Swift installation.  

To proceed with the installation on your machine run the following commands after you have cloned or downloaded the project.

First run the command below with the release configuration:
```bash
swift build --configuration release
```

Copy the build result from `.build/release/termy` to the `/usr/local/bin` with the following command:
```bash
cp -f .build/release/termy/usr/local/bin/termy
```

That's it! 

[Want to contribute?](mailto:hi@amarildo.codes) Open issues, fork the project, and submit new PRs.
