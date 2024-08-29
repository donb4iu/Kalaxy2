# Private CoPilot

![alt text](image-4.png)

## References

- [Building Private Copilot for Development Teams with Llama3](https://pub.towardsai.net/building-private-copilot-for-development-teams-with-llama3-c749bf19c235)

- [Introduction](https://docs.continue.dev/intro)

## Setup    

```
{
  "models": [
    {
      "title": "codegemma 9b",
      "model": "codegemma",
      "apiBase": "http://192.168.2.39:11434",
      "provider": "ollama"
    },
    {
      "title": "deepseek-coder 6.7b",
      "model": "deepseek-coder:6.7b",
      "apiBase": "http://192.168.2.39:11434",
      "provider": "ollama"
    },
    {
      "title": "codellama 7b",
      "model": "codellama",
      "apiBase": "http://192.168.2.39:11434",
      "provider": "ollama"
    },
    {
      "title": "starcoder2 7b",
      "model": "starcoder2:7b",
      "apiBase": "http://192.168.2.39:11434",
      "provider": "ollama"
    },
    {
      "title": "llama 3.1 8b",
      "model": "llama3.1",
      "apiBase": "http://192.168.2.39:11434",
      "provider": "ollama"
    }
  ],
  "customCommands": [
    {
      "name": "test",
      "prompt": "{{{ input }}}\n\nWrite a comprehensive set of unit tests for the selected code. It should setup, run tests that check for correctness including important edge cases, and teardown. Ensure that the tests are complete and sophisticated. Give the tests just as chat output, don't edit any file.",
      "description": "Write unit tests for highlighted code"
    }
  ],
  "tabAutocompleteModel": {
    "title": "Starcoder2 7b",
    "provider": "ollama",
    "model": "starcoder2:7b",
    "apiBase": "http://192.168.2.39:11434"
  },
  "embeddingsProvider": {
      "provider": "ollama",
      "model": "nomic-embed-text",
      "apiBase": "http://192.168.2.39:11434" 
    },
  "contextProviders": [
    {
      "name": "code",
      "params": {}
    },
    {
      "name": "docs",
      "params": {}
    },
    {
      "name": "diff",
      "params": {}
    },
    {
      "name": "terminal",
      "params": {}
    },
    {
      "name": "problems",
      "params": {}
    },
    {
      "name": "folder",
      "params": {}
    },
    {
      "name": "codebase",
      "params": {}
    }
  ],
  "slashCommands": [
    {
      "name": "edit",
      "description": "Edit selected code"
    },
    {
      "name": "comment",
      "description": "Write comments for the selected code"
    },
    {
      "name": "share",
      "description": "Export the current chat session to markdown"
    },
    {
      "name": "cmd",
      "description": "Generate a shell command"
    },
    {
      "name": "commit",
      "description": "Generate a git commit message"
    }
  ]
}
```