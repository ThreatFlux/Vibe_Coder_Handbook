# Model Context Protocol (MCP) Servers

This guide explains how to extend your AI assistant's capabilities using Model Context Protocol (MCP) servers with Roo Code.

## What are MCP Servers?

Model Context Protocol (MCP) servers provide specialized functionality that AI models can access during conversations. These servers act as tools that enable models to:

- Search the web
- Access filesystem data
- Interact with external APIs
- Break down complex problems
- Store and retrieve information
- Perform specialized operations

By connecting MCP servers to your AI assistant, you dramatically expand what it can accomplish, turning it from a conversational AI into a capable agent that can take actions in the real world.

## Key MCP Servers for Development

### Brave Search

Enables web search capabilities, allowing your AI assistant to retrieve current information.

**Key Features:**
- Web search for general information
- Local search for places and businesses
- Content filtering and relevance ranking
- Customizable search parameters

### Filesystem

Provides access to your local filesystem, allowing your AI assistant to read, write, and manipulate files and directories.

**Key Features:**
- Read files and directories
- Write or edit files
- Create directories
- Search for files
- Move files
- Get file metadata

### GitHub

Connects your AI assistant to GitHub repositories for code management and collaboration.

**Key Features:**
- Create or update files in repositories
- Create branches, issues, and pull requests
- Search repositories and code
- Review code changes
- Manage repository content

### Sequential Thinking

Enables step-by-step problem solving, allowing your AI assistant to break down complex problems.

**Key Features:**
- Structured thought process
- Revision of previous thoughts
- Multiple thought branches
- Hypothesis generation and verification
- Complex problem decomposition

### Puppeteer

Provides web browsing and automation capabilities.

**Key Features:**
- Navigate to web pages
- Extract information from websites
- Take screenshots
- Fill out forms
- Interact with web elements

### Fetch

Enables retrieval of web resources for analysis and processing.

**Key Features:**
- Fetch HTML, text, or other content from URLs
- Extract specific content from pages
- Process retrieved information

### Time

Provides access to accurate time information and time conversion.

**Key Features:**
- Get current time in specific timezones
- Convert time between timezones
- Timestamp operations

### Kubernetes

Allows interaction with Kubernetes clusters for container orchestration.

**Key Features:**
- Manage Kubernetes resources
- Create and delete deployments, pods, and services
- Query cluster status
- Deploy applications to Kubernetes

### Memory

Provides persistent memory capabilities for long-term retention of information.

**Key Features:**
- Store information between sessions
- Retrieve previously stored information
- Organize and categorize stored data

## Setting Up MCP Servers with Roo Code

Roo Code supports MCP servers through a configuration file that specifies how to connect to and use these servers.

### Configuration File Structure

Create a `.roocode-mcp.json` file in your project root or user directory:

```json
{
  "mcpServers": {
    "server-name": {
      "command": "command-to-run-server",
      "args": ["array", "of", "arguments"],
      "env": {
        "ENV_VAR": "value"
      },
      "disabled": false,
      "autoApprove": ["function_name"],
      "alwaysAllow": ["function_name"]
    }
  }
}
```

**Key Configuration Options:**
- `command`: The command to run the MCP server
- `args`: Arguments to pass to the command
- `env`: Environment variables to set
- `disabled`: Whether the server is disabled
- `autoApprove`: Functions that can be used with automatic approval
- `alwaysAllow`: Functions that can be used without approval

### Comprehensive MCP Configuration Example

Here's a comprehensive configuration example that sets up multiple MCP servers:

```json
{
  "mcpServers": {
    "brave-search": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "-e",
        "BRAVE_API_KEY",
        "mcp/brave-search"
      ],
      "env": {
        "BRAVE_API_KEY": "your_brave_api_key_here"
      },
      "autoApprove": [
        "brave_web_search",
        "brave_local_search"
      ],
      "alwaysAllow": [
        "brave_web_search"
      ]
    },
    "filesystem": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-filesystem",
        "/path/to/allowed/directory"
      ],
      "disabled": false,
      "alwaysAllow": [
        "read_file",
        "read_multiple_files",
        "write_file",
        "edit_file",
        "create_directory",
        "list_directory",
        "directory_tree",
        "move_file",
        "search_files",
        "get_file_info",
        "list_allowed_directories"
      ]
    },
    "puppeteer": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "--init",
        "-e",
        "DOCKER_CONTAINER=true",
        "mcp/puppeteer"
      ],
      "disabled": false,
      "alwaysAllow": [
        "puppeteer_navigate"
      ]
    },
    "github": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-github"
      ],
      "env": {
        "GITHUB_PERSONAL_ACCESS_TOKEN": "your_github_token_here"
      },
      "disabled": false,
      "alwaysAllow": [
        "create_or_update_file"
      ]
    },
    "kubernetes": {
      "command": "npx",
      "args": [
        "mcp-server-kubernetes"
      ],
      "disabled": false,
      "alwaysAllow": []
    },
    "fetch": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "mcp/fetch"
      ],
      "disabled": false,
      "alwaysAllow": [
        "fetch"
      ]
    },
    "sequential-thinking": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-sequential-thinking"
      ],
      "disabled": false,
      "alwaysAllow": [
        "sequentialthinking"
      ]
    },
    "memory": {
      "command": "npx",
      "args": [
        "-y",
        "@modelcontextprotocol/server-memory"
      ],
      "disabled": false,
      "alwaysAllow": []
    },
    "time": {
      "command": "docker",
      "args": [
        "run",
        "-i",
        "--rm",
        "mcp/time"
      ],
      "disabled": false,
      "alwaysAllow": [
        "get_current_time"
      ]
    }
  }
}
```

### Installation Requirements

To use MCP servers, you'll need:

1. **Docker** - For running containerized MCP servers
2. **Node.js and npm** - For running JavaScript-based MCP servers
3. **API Keys** - For services like Brave Search and GitHub

Install required packages:

```bash
# Install MCP server packages
npm install -g @modelcontextprotocol/server-filesystem
npm install -g @modelcontextprotocol/server-github
npm install -g @modelcontextprotocol/server-sequential-thinking
npm install -g @modelcontextprotocol/server-memory
```

Pull Docker images for containerized servers:

```bash
docker pull mcp/brave-search
docker pull mcp/puppeteer
docker pull mcp/fetch
docker pull mcp/time
```

## Configuring Roo Code to Use MCP Servers

1. Place your `.roocode-mcp.json` file in your project root directory or your user home directory
2. Configure Roo Code to use MCP servers:
   - Open VS Code
   - Open Roo Code settings
   - Enable the "Use MCP Servers" option
   - Specify the path to your MCP configuration file if not in the default locations

## Using MCP Servers in Conversations

Once configured, your AI assistant can use MCP servers in conversations. Here are some examples:

### Web Search Example

```
User: What's the current situation with climate change?

[AI uses Brave Search to retrieve current information]
```

### File System Example

```
User: Create a new Python file called app.py with a Flask server

[AI uses Filesystem MCP to create the file]
```

### Sequential Thinking Example

```
User: Help me understand quantum computing

[AI uses Sequential Thinking to break down the complex topic]
```

### GitHub Example

```
User: Add a README.md file to my repository

[AI uses GitHub MCP to create the file in your repository]
```

## Security Considerations

When using MCP servers, keep these security considerations in mind:

1. **Access Control**: Use `autoApprove` and `alwaysAllow` carefully to control what functions can be used
2. **API Keys**: Store API keys securely and use environment variables where possible
3. **Filesystem Access**: Limit filesystem access to specific directories
4. **Token Permissions**: Use limited-scope tokens for services like GitHub

## Best Practices

1. **Start Simple**: Begin with one or two MCP servers before adding more
2. **Use Docker**: Containerize MCP servers when possible for isolation
3. **Monitor Usage**: Keep an eye on API usage and costs for services like Brave Search
4. **Test Thoroughly**: Test MCP servers in a safe environment before using in production
5. **Update Regularly**: Keep MCP servers and configurations updated

## Troubleshooting

Common issues and solutions:

1. **MCP Server Not Starting**: Check command and arguments, ensure required software is installed
2. **Authentication Failures**: Verify API keys and tokens are correct and have necessary permissions
3. **Permission Errors**: Check filesystem permissions and directory access
4. **Rate Limiting**: Add rate limiting configurations or adjust your usage patterns
5. **Docker Issues**: Ensure Docker is running and has appropriate permissions

## Next Steps

After setting up MCP servers:

1. Explore [Advanced Techniques](advanced_techniques.md) for more sophisticated usage
2. Learn about [Memory Management](memory_management.md) for context persistence
3. Set up [VS Code Integration](vs_code_integration.md) for better developer experience

---

For more information about MCP servers, visit the [Model Context Protocol documentation](https://github.com/modelcontextprotocol).
