# plan.md

## 60-Day Day-by-Day Plan

### Weeks 1-2 (Days 1-14): Foundations + Repo Mastery
1. Day 1: Environment setup, run tests, run one tiny training command. Post setup screenshot + goal statement.
2. Day 2: Read `README.md`, map code structure, create personal architecture notes. Post "How nanochat is structured".
3. Day 3: Run tokenizer eval; explain vocab/compression tradeoffs. Post one chart.
4. Day 4: Run small CPU pretrain (`depth=4`) and capture logs; create a glossary for `epoch`, `step/iteration`, `batch`, and `gradient accumulation`.
5. Day 5: Launch `chat_web.py` locally and test API endpoints. Post short demo clip.
6. Day 6: Add/extend one test in `tests/` and open a small PR/commit. Post what test coverage taught you.
7. Day 7: Weekly recap and blockers list. LinkedIn long-form reflection.
8. Day 8: Start `scikit-learn` text baseline (dataset + preprocessing). Post dataset choice and why.
9. Day 9: Train Logistic Regression baseline; record metrics. Post metric table.
10. Day 10: Try SVM/RandomForest baseline; compare to Day 9. Post comparison thread.
11. Day 11: Error analysis on worst predictions; write insights. Post 3 failure examples.
12. Day 12: Wrap sklearn baseline in tiny FastAPI endpoint. Post API snippet.
13. Day 13: Add basic tests for sklearn endpoint. Post "from notebook to API" lesson.
14. Day 14: Buffer/catch-up day + Week 2 recap and next-week plan. LinkedIn carousel-style progress summary.

### Weeks 3-4 (Days 15-28): PyTorch + Transformers
15. Day 15: PyTorch tensor/autograd exercises. Post one concise "autograd mental model" note.
16. Day 16: Build MLP training loop from scratch using explicit epoch/step tracking. Post loss curve.
17. Day 17: Add validation loop + early stopping. Post overfitting example.
18. Day 18: Implement a minimal attention block in isolated script. Post simplified diagram.
19. Day 19: Trace a forward pass in `nanochat/gpt.py`. Post "what each tensor means".
20. Day 20: Run tiny nanochat training tweak (one hyperparameter change). Post before/after.
21. Day 21: Weekly recap + what confused you most. LinkedIn deep-dive.
22. Day 22: Hugging Face tokenizer + pipeline usage on a small NLP task. Post quick demo.
23. Day 23: Fine-tune a small transformer model with Trainer API. Post training artifact.
24. Day 24: Evaluate fine-tuned model and compare to sklearn baseline. Post winner + tradeoffs.
25. Day 25: Optional LoRA/PEFT fine-tuning run. Post "why PEFT matters".
26. Day 26: Add model registry style foldering/version tags locally. Post reproducibility checklist.
27. Day 27: Integrate HF model as optional endpoint in service. Post architecture update.
28. Day 28: Buffer/catch-up day + Week 4 recap + milestone demo recording.

### Weeks 5-6 (Days 29-42): GCP Deployment + Observability
29. Day 29: Create Dockerfile for chat service. Post image build success.
30. Day 30: Add `.env` config strategy and startup scripts. Post env management tips.
31. Day 31: Set up GCP project, billing budget alerts, and IAM basics. Post cost-control checklist.
32. Day 32: Push image to Artifact Registry with Cloud Build. Post CI/CD screenshot.
33. Day 33: Deploy CPU endpoint on Cloud Run. Post public endpoint health check.
34. Day 34: Provision GPU VM for full model serving. Post infra diagram.
35. Day 35: Add deploy + rollback script (`deploy.sh`/`rollback.sh`). Post safe-release checklist.
36. Day 36: Add structured JSON logging in FastAPI service. Post sample log event.
37. Day 37: Add Prometheus metrics instrumentation. Post latency dashboard screenshot.
38. Day 38: Add OpenTelemetry tracing for request path. Post one trace breakdown.
39. Day 39: Build Grafana dashboard panels (RPS, p95, errors, tokens/sec). Post dashboard tour.
40. Day 40: Configure alert rules (high error rate/high latency). Post alert policy notes.
41. Day 41: Run load tests and identify bottlenecks. Post "one bottleneck, one fix".
42. Day 42: Buffer/catch-up day + mid-program capstone demo (train -> deploy -> observe). LinkedIn long post + Twitter thread.

### Weeks 7-8+ (Days 43-60): Advanced Systems + Scaling
43. Day 43: RAG basics: chunking + embedding pipeline.
44. Day 44: Add vector store (FAISS/Chroma) and retrieval endpoint.
45. Day 45: Integrate retrieval into chat flow with citations.
46. Day 46: Evaluate RAG answer quality with a small benchmark set.
47. Day 47: Add guardrails (prompt injection checks/basic filtering).
48. Day 48: Improve retrieval latency and caching.
49. Day 49: Publish RAG architecture post (diagram + lessons).
50. Day 50: Run scaling experiment (depth sweep d4/d8/d12 or similar).
51. Day 51: Analyze cost vs quality vs latency of scaling results.
52. Day 52: Test quantized inference path for cheaper serving.
53. Day 53: Add experiment report template and automate report generation.
54. Day 54: Optional TensorFlow mini-project for framework contrast.
55. Day 55: Big-data day: run a small Spark preprocessing job.
56. Day 56: Buffer/catch-up day + draft AI system design doc (SLOs, failure modes, mitigations).
57. Day 57: Hardening day: retries, timeouts, circuit-breaker ideas.
58. Day 58: Final load/cost test and reliability pass.
59. Day 59: Portfolio polish: README, architecture diagrams, demo video.
60. Day 60: Final launch post on Twitter + LinkedIn with full retrospective.

## Social Posting Cadence (Twitter + LinkedIn)
1. Daily post format:
   - What I built today (1 sentence)
   - One metric/result (number, screenshot, or short chart)
   - One thing that failed (and fix plan)
   - Next step for tomorrow
2. Weekly cadence:
   - Mon-Fri: short build updates
   - Sat: technical thread (deeper breakdown)
   - Sun: weekly retrospective (wins, losses, next bets)
