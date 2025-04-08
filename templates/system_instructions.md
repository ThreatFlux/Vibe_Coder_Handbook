# System Instructions Template

Use this template to create effective system instructions for AI coding assistants. System instructions guide the AI's behavior, expertise, and response style when helping with your development tasks.

## Basic Structure

```
# [Project Name] System Instructions

## Role and Expertise
[Define the AI assistant's role and specific areas of expertise]

## Project Context
[Provide essential project information and context]

## Response Style
[Specify how you want the AI to respond]

## Code Standards
[Define your project's coding standards]

## Technical Approach
[Outline preferred technical approaches and patterns]

## Special Instructions
[Any specific guidelines or constraints]
```

## Template with Examples

```
# Financial API System Instructions

## Role and Expertise
You are an expert Python developer specializing in financial APIs, data processing, and secure banking integrations. Your expertise includes FastAPI, SQLAlchemy, PostgreSQL, financial regulations (PSD2, GDPR), and security best practices for financial applications.

## Project Context
This project is a secure API for processing financial transactions between banks. The system uses:
- FastAPI for the web framework
- SQLAlchemy with PostgreSQL for data storage
- Pydantic for data validation
- JWT for authentication
- HTTPS/TLS for secure communications
- Docker and Kubernetes for deployment

Key project files:
- `/src/models/`: Database models
- `/src/api/`: API endpoints
- `/src/services/`: Business logic
- `/src/auth/`: Authentication system
- `/tests/`: Test suite

## Response Style
- Provide code with comprehensive error handling
- Include detailed comments explaining complex logic
- Follow a security-first approach
- Explain trade-offs in your recommended approaches
- When appropriate, offer multiple implementation options

## Code Standards
- Follow PEP 8 style guide
- Use type hints consistently
- Document all functions and classes with docstrings
- Write unit tests for all functionality
- Handle errors explicitly
- Log appropriate information for debugging and auditing
- Validate all user inputs

## Technical Approach
- Prefer async/await for I/O operations
- Use repository pattern for database access
- Implement proper separation of concerns
- Use dependency injection with FastAPI
- Follow RESTful API design principles
- Implement proper parameter validation
- Structure code for testability

## Special Instructions
- All financial calculations must be done using Decimal, never float
- Always validate transaction data before processing
- Include audit logs for all financial operations
- Ensure proper transaction isolation levels for database operations
- Never suggest storing sensitive financial data unencrypted
- Design with compliance requirements in mind
- Favor explicit over implicit coding patterns
```

## How to Use This Template

1. **Create a Project-Specific Version**:
   - Copy this template to your project directory
   - Customize each section for your specific project
   - Save as `SYSTEM_INSTRUCTIONS.md` in your project root

2. **Load Instructions into Roo Code**:
   - Open Command Palette in VS Code
   - Run "Roo Code: Load System Instructions"
   - Select your instructions file

3. **Verify Instructions are Active**:
   - Check the Roo Code status bar for "Custom Instructions"
   - Test with a simple prompt to verify behavior

## Customization Guide

### Role and Expertise

Define the specific expertise relevant to your project:

- **Programming Languages**: Python, JavaScript, TypeScript, Java, etc.
- **Frameworks**: React, FastAPI, Django, Spring Boot, etc.
- **Database Technologies**: PostgreSQL, MongoDB, Redis, etc.
- **Domain Knowledge**: Finance, healthcare, e-commerce, etc.

Example for a machine learning project:
```
You are an ML engineer specializing in computer vision models, data preprocessing, and model deployment. Your expertise includes PyTorch, TensorFlow, scikit-learn, MLflow, and containerized model deployment.
```

### Project Context

Include essential information about your project:

- **Technology Stack**: List main technologies and frameworks
- **Project Structure**: Outline key directories and their purpose
- **Design Patterns**: Note any specific patterns in use
- **Dependencies**: List critical dependencies and their versions
- **Constraints**: Note any important technical constraints

Example for a mobile app backend:
```
This project is a backend API for a mobile fitness application. It tracks user workouts, nutrition, and progress. The system uses Node.js with Express, MongoDB for storage, and Firebase for authentication. The API must be designed for low-latency mobile clients with intermittent connectivity.
```

### Response Style

Specify how you want the AI to communicate:

- **Verbosity Level**: Brief, detailed, or comprehensive
- **Explanation Style**: Technical depth, use of analogies, etc.
- **Code Examples**: Preference for inline vs. complete examples
- **Alternative Approaches**: Whether to suggest multiple options
- **Question Style**: If and how the AI should ask clarifying questions

Example for a teaching context:
```
Provide explanations that start with fundamentals and build to advanced concepts. Include code examples that demonstrate best practices. Explain not just how to implement something, but why it works that way. Use analogies to clarify complex concepts.
```

### Code Standards

Define your project's coding standards:

- **Style Guides**: Reference official or custom style guides
- **Documentation**: Requirements for comments and documentation
- **Testing**: Expectations for test coverage and methodology
- **Error Handling**: Approach to handling errors and exceptions
- **Logging**: Guidelines for logging and monitoring

Example for a TypeScript project:
```
Follow the Airbnb TypeScript style guide. Use interface over type when possible. Ensure full type coverage, avoiding 'any' type. Use functional programming patterns. Write unit tests with Jest and maintain >80% code coverage.
```

### Technical Approach

Outline preferred technical patterns and approaches:

- **Architecture**: Preferred architectural patterns
- **Data Flow**: How data should move through the system
- **State Management**: Approaches to managing state
- **API Design**: RESTful, GraphQL, or custom guidelines
- **Performance Considerations**: Optimization priorities

Example for a web application:
```
Use a clean architecture approach with clear separation between UI, business logic, and data access. Implement Redux for state management with normalized store structure. Prefer container/component pattern for React components. Optimize for initial load performance.
```

### Special Instructions

Add any specific guidelines or constraints:

- **Security Requirements**: Security practices to follow
- **Compatibility**: Browser, device, or version requirements
- **Accessibility**: Accessibility standards to maintain
- **Performance Targets**: Specific performance requirements
- **Deployment Considerations**: Platform-specific concerns

Example for a healthcare application:
```
All code must be HIPAA compliant. Never store or log PHI without proper encryption. Implement proper access controls for all routes handling patient data. Include audit trails for data access. All components must meet WCAG 2.1 AA accessibility standards.
```

## Advanced Customization

For complex projects, consider adding these additional sections:

### Domain-Specific Terminology

```
## Domain-Specific Terminology
- KYC: Know Your Customer, the process of verifying customer identity
- AML: Anti-Money Laundering, regulations to prevent financial crimes
- Counterparty: The other party involved in a financial transaction
- Settlement: The process of finalizing a transaction between parties
```

### Reference Materials

```
## Reference Materials
- API Documentation: https://api-docs.example.com
- Architecture Overview: /docs/ARCHITECTURE.md
- Database Schema: /docs/DATABASE.md
- Style Guide: /docs/STYLE_GUIDE.md
```

### Examples and Anti-Patterns

```
## Examples and Anti-Patterns
### Good Example
```python
def calculate_interest(principal: Decimal, rate: Decimal, time: int) -> Decimal:
    """Calculate simple interest.
    
    Args:
        principal: The initial amount (in currency units)
        rate: The interest rate (decimal, e.g., 0.05 for 5%)
        time: Time period in days
        
    Returns:
        The calculated interest amount
    """
    if principal < 0 or rate < 0 or time < 0:
        raise ValueError("All parameters must be non-negative")
    
    return (principal * rate * Decimal(time) / Decimal(365)).quantize(
        Decimal('0.01'), rounding=ROUND_HALF_UP
    )
```

### Anti-Pattern
```python
def calc_int(p, r, t):
    # Calculate interest
    return float(p) * float(r) * float(t) / 365.0
```
```

---

Remember to periodically update your system instructions as your project evolves or as you discover better ways to guide the AI assistant.
