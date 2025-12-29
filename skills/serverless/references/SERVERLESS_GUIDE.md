# Serverless Architecture Guide
## Core Concepts
- Function as a Service (FaaS)
- Event-driven execution
- Pay-per-execution pricing
- Auto-scaling to zero

## Major Platforms
| Platform | Provider | Runtime Support |
|----------|----------|-----------------|
| Lambda | AWS | Node, Python, Go, Java, .NET |
| Functions | Azure | Node, Python, C#, Java |
| Cloud Functions | GCP | Node, Python, Go, Java |
| Workers | Cloudflare | JavaScript, WASM |

## AWS Lambda Example
```python
import json

def handler(event, context):
    body = json.loads(event.get('body', '{}'))
    return {
        'statusCode': 200,
        'headers': {'Content-Type': 'application/json'},
        'body': json.dumps({'message': 'Success', 'data': body})
    }
```

## Best Practices
- Keep functions small and focused
- Use environment variables for config
- Implement proper error handling
- Set appropriate timeouts
- Use cold start optimization techniques

## Event Sources
- API Gateway (HTTP)
- S3 (object events)
- DynamoDB (streams)
- SQS/SNS (messaging)
- CloudWatch (scheduled)
