# Observability Guide
## Three Pillars
### 1. Metrics (Quantitative)
- Prometheus, Datadog, CloudWatch
- Time-series numerical data
- System health indicators
- USE Method: Utilization, Saturation, Errors

### 2. Logs (Events)
- ELK Stack, Loki, Splunk
- Structured logging (JSON)
- Centralized aggregation
- Correlation IDs for tracing

### 3. Traces (Distributed)
- Jaeger, Zipkin, AWS X-Ray
- Request flow visualization
- Latency analysis
- Service dependency mapping

## OpenTelemetry
```python
from opentelemetry import trace
from opentelemetry.sdk.trace import TracerProvider

trace.set_tracer_provider(TracerProvider())
tracer = trace.get_tracer(__name__)

with tracer.start_as_current_span("my-operation") as span:
    span.set_attribute("key", "value")
    # Your code here
```

## Key Metrics (RED Method)
- Rate: Requests per second
- Errors: Failed request rate
- Duration: Request latency

## SLI/SLO/SLA
- SLI: Service Level Indicator (measurement)
- SLO: Service Level Objective (target)
- SLA: Service Level Agreement (contract)
