# Hello Go MCP

A Go-based MCP (Model Context Protocol) server implementation.

## Benchmarks

### API Benchmark (oha)

Endpoint: `http://localhost:7881/api/hello?name=Asdf`

**Configuration:**
- Concurrent connections: 125
- Total requests: 1000

**Results:**
| Metric | Value |
|--------|-------|
| Success rate | 100.00% |
| Total time | 0.0200 secs |
| Requests/sec | 49,956.82 |
| Average latency | 1.4 ms |
| Fastest | 0.0 ms |
| Slowest | 12.8 ms |

**Response Time Distribution:**
| Percentile | Latency |
|------------|---------|
| p50 | 0.4 ms |
| p75 | 0.9 ms |
| p90 | 2.5 ms |
| p95 | 11.8 ms |
| p99 | 12.5 ms |
| p99.9 | 12.8 ms |

**Status Codes:** 100% HTTP 200

---

### MCP Benchmark (Native)

Endpoint: `http://localhost:7881/mcp`

**Configuration:**
- Transport: Streamable HTTP (SSE is deprecated)
- Method: Initialize once, call hello repeatedly
- Concurrent users: 125
- Requests per user: 10,000
- Total requests: 1,250,000
- Tool: hello

**Results:**
| Metric | Value |
|--------|-------|
| Total requests | 1,250,000 |
| Success rate | 100% |
| Elapsed time | 55,702.21 ms (~55.7 secs) |
| Throughput | 22,440.76 req/s |
| Average latency | 5.52 ms |

---

## Running Benchmarks

```bash
# API benchmark using oha
make api-bench

# Full MCP benchmark
make benchmark
```

### Benchmark Options

For the MCP benchmark, you can customize:

```bash
make benchmark SERVER_URL=http://localhost:7881/mcp USERS=125 REQUESTS=10000 TOOL=hello
```

| Option | Default | Description |
|--------|---------|-------------|
| SERVER_URL | http://localhost:7881/mcp | MCP server endpoint |
| USERS | 125 | Number of concurrent users |
| REQUESTS | 10000 | Requests per user |
| TOOL | hello | Tool to invoke |
