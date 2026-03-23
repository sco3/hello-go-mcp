# Hello Go MCP

A Go-based MCP (Model Context Protocol) server implementation.

## Benchmarks

### Side-by-Side Comparison

| Metric | MCP Benchmark | oha API Benchmark |
|--------|---------------|-------------------|
| **Endpoint** | `http://localhost:7881/mcp` | `http://localhost:7881/api/hello?name=Asdf` |
| **Total requests** | 1,250,000 | 1,000 |
| **Concurrent connections/users** | 125 | 125 |
| **Success rate** | 100% | 100.00% |
| **Throughput (req/sec)** | 22,440.76 | 49,956.82 |
| **Average latency** | 5.52 ms | 1.4 ms |
| **Total time** | 55,702.21 ms (~55.7 secs) | 0.0200 secs |

**Latency Distribution:**

| Percentile | MCP Benchmark | oha API Benchmark |
|------------|---------------|-------------------|
| p50 | — | 0.4 ms |
| p75 | — | 0.9 ms |
| p90 | — | 2.5 ms |
| p95 | — | 11.8 ms |
| p99 | — | 12.5 ms |
| p99.9 | — | 12.8 ms |
| Fastest | — | 0.0 ms |
| Slowest | — | 12.8 ms |

---

### MCP Benchmark (Native)

**Configuration:**
- Transport: Streamable HTTP (SSE is deprecated)
- Method: Initialize once, call hello repeatedly
- Tool: hello

---

### API Benchmark (oha)

**Status Codes:** 100% HTTP 200

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
