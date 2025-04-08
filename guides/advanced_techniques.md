# Advanced Techniques

This guide covers advanced strategies for maximizing the effectiveness of AI coding assistants in your development workflow.

## Effective Prompting Strategies

### Chain-of-Thought Prompting

Guide the AI through complex reasoning by encouraging step-by-step thinking:

```
Let's think through how to implement a concurrent rate limiter that works across multiple processes:

1. First, we need a shared storage mechanism
2. Then, we need atomic operations for managing counts
3. Next, we need to handle cleanup of expired entries
4. Finally, we need a client interface

For step 1, what would be the best shared storage option?
```

### System Design Prompting

When designing complex systems, structure your prompts with explicit constraints and requirements:

```
I need to design a distributed task processing system with these requirements:
- Must handle 10,000+ tasks per minute
- Tasks can take between 100ms and 30 seconds to complete
- Must be horizontally scalable
- Must provide at-least-once delivery guarantee
- Failed tasks should be retried with exponential backoff
- Must track task status and history

Please provide a system architecture diagram and describe the key components.
```

### Code Refinement Iterations

Iteratively improve code through multiple refinement steps:

```
# Step 1: Initial Implementation
Let's create a basic implementation of a caching decorator in Python.

# Step 2: Add Time-Based Expiration
Now let's enhance it with time-based cache expiration.

# Step 3: Add LRU Eviction
Let's add LRU eviction when the cache reaches a maximum size.

# Step 4: Make Thread-Safe
Finally, let's make the implementation thread-safe.
```

### Multi-File Project Understanding

Help the AI understand relationships between multiple files:

```
I'm working on a project with these key files:
1. src/models/user.py: User data model with authentication methods
2. src/repositories/user_repository.py: Database access for user data
3. src/services/auth_service.py: Authentication business logic
4. src/api/auth_routes.py: API endpoints for authentication

I need to implement a password reset feature. This will span all these files.
Let's start by understanding what changes we need to make to each file.
```

## Model Specialization Techniques

### Context Hyper-Optimization

For complex projects, optimize your context aggressively:

```json
{
  "rooCode.contextOptimization": {
    "enabled": true,
    "priorityFiles": [
      "src/core/**/*.py",
      "README.md",
      "ARCHITECTURE.md"
    ],
    "includeDependencies": true,
    "dependencyResolutionStrategy": "smart",
    "codeContextRatio": 0.7,
    "documentationContextRatio": 0.3
  }
}
```

### Custom Model Presets

Create task-specific model presets to quickly switch between optimized configurations:

```json
{
  "rooCode.modelPresets": {
    "architecture": {
      "model": "claude-3.7-sonnet",
      "parameters": {
        "temperature": 0.2,
        "thinking": true,
        "contextOptimization": "documentation-heavy"
      }
    },
    "implementation": {
      "model": "gemini-2.5-pro",
      "parameters": {
        "temperature": 0.7,
        "contextOptimization": "code-heavy"
      }
    },
    "debugging": {
      "model": "claude-3.7-sonnet",
      "parameters": {
        "temperature": 0.1,
        "thinking": true,
        "contextOptimization": "focus-current"
      }
    },
    "documentation": {
      "model": "gemini-2.5-pro",
      "parameters": {
        "temperature": 0.6,
        "contextOptimization": "balanced"
      }
    }
  }
}
```

Switch between presets using:
```
Roo Code: Apply Model Preset > [preset-name]
```

### Thinking-Mode Optimization

For Claude 3.7 Sonnet, customize the thinking process:

```json
{
  "rooCode.models.claude-3.7-sonnet.thinking": {
    "enabled": true,
    "depth": "comprehensive",
    "style": "structured",
    "algorithmicReasoning": true,
    "exploreAlternatives": true,
    "maxThinkingTokens": 2000
  }
}
```

### Project-Specific Conditioning

For large projects, create a project conditioning file:

```markdown
# Project Conditioning

## Architecture Overview
This is a microservices-based e-commerce platform with these key services:
- UserService: Handles user authentication and profiles
- ProductService: Manages product catalog and inventory
- OrderService: Processes orders and payments
- NotificationService: Handles customer communications

## Coding Standards
- Python code follows PEP 8 with 100 character line limit
- TypeScript uses ESLint with Airbnb config
- All functions have docstrings and type annotations
- Test coverage minimum is 80%

## Database Schema
User records include:
- id: UUID primary key
- email: String, unique
- passwordHash: String
- profile: Embedded document with personal details
- roles: Array of role references

## Key Implementation Patterns
- Repository pattern for data access
- CQRS for complex domains
- Outbox pattern for reliable events
- Circuit breaker for external services
```

Apply this conditioning:
```
Roo Code: Load Project Conditioning
```

## Integration with Development Workflow

### Git Hooks Integration

Configure Roo Code to work with git hooks for automated assistance:

```json
{
  "rooCode.gitIntegration": {
    "enabled": true,
    "prCommitMessage": {
      "enabled": true,
      "template": "feat(${scope}): ${summary}\n\n${details}"
    },
    "prDescription": {
      "enabled": true,
      "template": "## Changes\n${changes}\n\n## Testing\n${testing}\n\n## Screenshots\n${screenshots}"
    },
    "codeReview": {
      "enabled": true,
      "suggestImprovements": true,
      "checkSecurity": true,
      "reviewDepth": "detailed"
    }
  }
}
```

Create a pre-commit hook to get AI suggestions before committing:

```bash
#!/bin/bash
# .git/hooks/pre-commit

# Get the list of files being committed
FILES=$(git diff --cached --name-only --diff-filter=ACM)

# Only run on certain file types
CODE_FILES=$(echo "$FILES" | grep -E '\.(py|js|ts|java|go)$')

if [ -n "$CODE_FILES" ]; then
  # Ask Roo Code for a quick review
  echo "$CODE_FILES" | xargs code --roo-code-review
  
  # Ask if user wants to proceed
  read -p "Proceed with commit? [Y/n] " -n 1 -r
  echo
  if [[ $REPLY =~ ^[Nn]$ ]]
  then
    exit 1
  fi
fi

exit 0
```

### CI/CD Pipeline Integration

Incorporate AI assistance in your CI/CD pipeline:

```yaml
# .github/workflows/ai-review.yml
name: AI Code Review

on:
  pull_request:
    types: [opened, synchronize]

jobs:
  ai-review:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v3
        with:
          fetch-depth: 0
      
      - name: Set up Python
        uses: actions/setup-python@v4
        with:
          python-version: '3.10'
      
      - name: Install Roo Code CLI
        run: pip install roo-code-cli
      
      - name: Get changed files
        id: changed-files
        uses: tj-actions/changed-files@v35
      
      - name: Run AI Code Review
        env:
          GEMINI_API_KEY: ${{ secrets.GEMINI_API_KEY }}
        run: |
          roo-code-cli review \
            --model gemini-2.5-pro \
            --files "${{ steps.changed-files.outputs.all_changed_files }}" \
            --output-format markdown \
            --checks style,security,performance,maintainability \
            > review.md
      
      - name: Comment PR
        uses: actions/github-script@v6
        with:
          github-token: ${{ secrets.GITHUB_TOKEN }}
          script: |
            const fs = require('fs');
            const review = fs.readFileSync('review.md', 'utf8');
            github.rest.issues.createComment({
              issue_number: context.issue.number,
              owner: context.repo.owner,
              repo: context.repo.repo,
              body: review
            });
```

### Project Planning Automation

Create a VS Code task for AI-assisted project planning:

```json
// .vscode/tasks.json
{
  "version": "2.0.0",
  "tasks": [
    {
      "label": "AI: Generate Project Structure",
      "type": "shell",
      "command": "code --roo-code-exec \"Generate a project structure for a ${input:projectType} application with ${input:features} features. Include folder structure, key files, and brief descriptions.\"",
      "problemMatcher": []
    },
    {
      "label": "AI: Create Component",
      "type": "shell",
      "command": "code --roo-code-exec \"Create a ${input:componentType} component named ${input:componentName} with ${input:componentFeatures} functionality. Generate all necessary files.\"",
      "problemMatcher": []
    }
  ],
  "inputs": [
    {
      "id": "projectType",
      "description": "Project type:",
      "default": "FastAPI",
      "type": "promptString"
    },
    {
      "id": "features",
      "description": "Key features:",
      "default": "authentication, data processing, API",
      "type": "promptString"
    },
    {
      "id": "componentType",
      "description": "Component type:",
      "default": "React",
      "type": "promptString"
    },
    {
      "id": "componentName",
      "description": "Component name:",
      "default": "UserProfile",
      "type": "promptString"
    },
    {
      "id": "componentFeatures",
      "description": "Component features:",
      "default": "data fetching, form handling, validation",
      "type": "promptString"
    }
  ]
}
```

## Advanced Memory Management

### Memory Vector Database Integration

For extremely large projects, set up dedicated vector storage:

```json
{
  "rooCode.memoryBank.advanced": {
    "vectorDatabase": {
      "enabled": true,
      "type": "qdrant",
      "connectionString": "http://localhost:6333",
      "collection": "project_memory",
      "dimensions": 1536,
      "similarityMetric": "cosine"
    },
    "embeddings": {
      "model": "gemini-embedding-1536",
      "batchSize": 10,
      "cacheEmbeddings": true
    },
    "retrieval": {
      "topK": 15,
      "minScore": 0.75,
      "reranking": true
    }
  }
}
```

### Advanced Context Pruning Strategies

Configure sophisticated memory pruning to maintain optimal context:

```json
{
  "rooCode.memoryBank.pruning": {
    "strategy": "smart",
    "protectedTypes": ["architecture", "schema", "keyPatterns"],
    "ageDecayFactor": 0.85,
    "usageBoostFactor": 1.2,
    "relevanceThreshold": 0.65,
    "recentEditBoost": 1.5,
    "semanticClustering": true,
    "maxRedundancy": 0.2
  }
}
```

### Cross-Project Knowledge Transfer

Enable knowledge sharing between related projects:

```json
{
  "rooCode.memoryBank.crossProject": {
    "enabled": true,
    "projects": [
      {
        "name": "core-library",
        "path": "~/projects/core-library",
        "sharePatterns": ["src/api/**/*.ts", "docs/API.md"],
        "importanceWeight": 0.8
      },
      {
        "name": "shared-components",
        "path": "~/projects/shared-components",
        "sharePatterns": ["src/components/**/*.tsx", "README.md"],
        "importanceWeight": 0.7
      }
    ],
    "shareGlobalPatterns": true,
    "knowledgeBaseLimit": 50
  }
}
```

## Automation and Scripting

### Custom VS Code Commands

Create custom Roo Code commands for frequent tasks:

```json
// settings.json
{
  "rooCode.customCommands": [
    {
      "name": "Generate CRUD Endpoints",
      "command": "generateCrud",
      "prompt": "Generate CRUD endpoints for the ${entity} model in ${language} using ${framework}.",
      "variables": {
        "entity": {
          "type": "input",
          "description": "Entity name"
        },
        "language": {
          "type": "select",
          "options": ["Python", "TypeScript", "Go", "Java"],
          "default": "Python"
        },
        "framework": {
          "type": "select",
          "options": ["FastAPI", "Express", "Spring Boot", "Echo"],
          "default": "FastAPI"
        }
      },
      "shortcut": "ctrl+shift+g c"
    },
    {
      "name": "Document Current File",
      "command": "documentFile",
      "prompt": "Generate comprehensive documentation for this file in ${style} style.",
      "variables": {
        "style": {
          "type": "select",
          "options": ["Google", "NumPy", "JSDoc", "GoDoc"],
          "default": "Google"
        }
      },
      "contextStrategy": "current-file",
      "shortcut": "ctrl+shift+g d"
    }
  ]
}
```

### Roo Code Scripting

Create advanced automation scripts using the Roo Code API:

```javascript
// scripts/generate_api_layer.js
const vscode = require('vscode');
const rooCode = vscode.extensions.getExtension('roovetgit.roo-code').exports;
const fs = require('fs');
const path = require('path');

async function generateApiLayer(schemaPath, outputDir) {
  // Read the schema file
  const schema = JSON.parse(fs.readFileSync(schemaPath, 'utf8'));
  
  // Create output directory if it doesn't exist
  if (!fs.existsSync(outputDir)) {
    fs.mkdirSync(outputDir, { recursive: true });
  }
  
  // Generate code for each entity in the schema
  for (const entity of schema.entities) {
    const prompt = `
    Generate a complete API controller for the ${entity.name} entity with these fields:
    ${JSON.stringify(entity.fields, null, 2)}
    
    The controller should implement these endpoints:
    - GET /${entity.name.toLowerCase()} - List all
    - GET /${entity.name.toLowerCase()}/{id} - Get by ID
    - POST /${entity.name.toLowerCase()} - Create
    - PUT /${entity.name.toLowerCase()}/{id} - Update
    - DELETE /${entity.name.toLowerCase()}/{id} - Delete
    
    Use FastAPI and follow our project's coding standards.
    `;
    
    // Use Roo Code to generate the controller
    const response = await rooCode.execute({
      model: 'gemini-2.5-pro',
      prompt: prompt,
      temperature: 0.3,
      maxTokens: 4096
    });
    
    // Save the generated code
    const outputPath = path.join(outputDir, `${entity.name.toLowerCase()}_controller.py`);
    fs.writeFileSync(outputPath, response.text);
    
    console.log(`Generated controller for ${entity.name}`);
  }
}

// Export the function for use in VS Code commands
module.exports = { generateApiLayer };
```

Register as a VS Code command:

```json
// package.json contribution point
{
  "commands": [
    {
      "command": "rooCode.generateApiLayer",
      "title": "Roo Code: Generate API Layer from Schema"
    }
  ]
}
```

### Batch Processing

Process multiple files with AI assistance:

```javascript
// scripts/batch_update_docs.js
const vscode = require('vscode');
const rooCode = vscode.extensions.getExtension('roovetgit.roo-code').exports;
const fs = require('fs');
const path = require('path');
const glob = require('glob');

async function batchUpdateDocs(pattern, style) {
  // Find all matching files
  const files = glob.sync(pattern);
  
  console.log(`Found ${files.length} files to process`);
  
  for (const file of files) {
    try {
      // Read file content
      const content = fs.readFileSync(file, 'utf8');
      
      // Skip files that already have good documentation
      if (hasAdequateDocumentation(content)) {
        console.log(`Skipping ${file} - already documented`);
        continue;
      }
      
      console.log(`Processing ${file}...`);
      
      // Generate documentation
      const prompt = `
      Add thorough documentation to this file following ${style} style guide.
      Add docstrings for all functions, classes, and methods.
      Preserve all existing code functionality.
      
      Original file:
      
      ${content}
      `;
      
      const response = await rooCode.execute({
        model: 'gemini-2.5-pro',
        prompt: prompt,
        temperature: 0.3,
        maxTokens: 8192
      });
      
      // Write updated content
      fs.writeFileSync(file, response.text);
      
      console.log(`Updated documentation for ${file}`);
    } catch (error) {
      console.error(`Error processing ${file}:`, error);
    }
  }
}

function hasAdequateDocumentation(content) {
  // Simplistic check - count docstring-like patterns
  const docstringCount = (content.match(/"""/g) || []).length / 2;
  const functionCount = (content.match(/def /g) || []).length;
  const classCount = (content.match(/class /g) || []).length;
  
  // If we have at least 70% of functions/classes documented
  return docstringCount >= (functionCount + classCount) * 0.7;
}

module.exports = { batchUpdateDocs };
```

## Performance and Scaling Techniques

### Response Caching Strategy

Implement intelligent caching for repeated prompts:

```json
{
  "rooCode.caching": {
    "enabled": true,
    "strategy": "semantic",
    "similarityThreshold": 0.92,
    "maxCacheEntries": 1000,
    "ttl": 86400,
    "persistCache": true,
    "cachePath": "~/.roocode/cache",
    "excludePatterns": [
      "password",
      "secret",
      "token"
    ]
  }
}
```

### Request Batching and Prioritization

Optimize API usage with request batching:

```json
{
  "rooCode.requestOptimization": {
    "batchRequests": true,
    "maxBatchSize": 5,
    "maxBatchDelay": 200,
    "prioritization": {
      "enabled": true,
      "userInteraction": "highest",
      "inlineCompletion": "high",
      "backgroundAnalysis": "normal",
      "documentGeneration": "low"
    },
    "concurrencyLimit": 3
  }
}
```

### Multi-Model Fallback System

Configure intelligent fallbacks between models:

```json
{
  "rooCode.modelFallback": {
    "enabled": true,
    "timeout": 10000,
    "retryAttempts": 2,
    "fallbackChain": ["gemini-2.5-pro", "claude-3.7-sonnet", "github-copilot"],
    "errorCategories": {
      "timeout": {
        "strategy": "retry-then-fallback",
        "message": "Request timed out, trying alternative model..."
      },
      "rateLimited": {
        "strategy": "immediate-fallback",
        "message": "Rate limited, switching to alternative model..."
      },
      "contentFiltered": {
        "strategy": "prompt-modification-then-fallback",
        "message": "Content filtered, adjusting request..."
      }
    }
  }
}
```

## Next Steps

- Explore creating your own custom system instructions in [System Instructions](../examples/system_instructions/)
- Learn about model benchmarking in [Model Comparison](../reference/model_comparison.md)
- Set up a standardized project workflow with [Makefile Commands](../reference/makefile_commands.md)

---

*This guide covers advanced features that may change with updates. Check documentation for the latest capabilities.*
