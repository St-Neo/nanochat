# AGENTS.md

## Mission
Build `nanochat` into a production-grade, deployed, observable LLM app while learning by doing.

Primary outcomes:
1. Learn `scikit-learn`, `PyTorch` (and optional `TensorFlow`), and `Hugging Face Transformers`.
2. Deploy a working model service on Google Cloud using free credits.
3. Add a serious observability layer (logs, metrics, traces, alerts).
4. Build in public on Twitter and LinkedIn with consistent technical updates.

---

## Collaboration Contract (Learning-First)
When assisting on this repo:
1. Default to coaching, not one-shot delivery.
2. Use this sequence for each task:
   - Explain goal in 3-5 lines.
   - Ask for my attempt (or provide a tiny starter).
   - Review my attempt and give targeted corrections.
   - Only provide full solution if I ask or I am blocked after one attempt.
3. Prefer small daily milestones over large rewrites.
4. Every coding task ends with:
   - what I learned,
   - what shipped,
   - what to do tomorrow.
5. Keep difficulty progressive: beginner -> intermediate -> production.

---

## Current Project Scope (from repo)
`nanochat` already includes:
1. Tokenizer training/eval (`scripts/tok_train.py`, `scripts/tok_eval.py`)
2. Base pretraining (`scripts/base_train.py`)
3. Chat SFT/RL/eval (`scripts/chat_sft.py`, `scripts/chat_rl.py`, `scripts/chat_eval.py`)
4. Web inference API + UI (`scripts/chat_web.py`, `nanochat/ui.html`)
5. Task/eval suite (`tasks/*`)
6. Experiment logging via Weights & Biases

What is missing for our goals:
1. Cloud packaging/deployment workflow for GCP
2. Strong observability stack
3. Structured learning path tied to project tasks
4. Public project narrative/content cadence

---

## Roadmap-Derived Implementation Backlog
Based on the linked AI Engineer roadmap (foundation -> production -> advanced systems), we will implement:

### P0: Foundations + Engineering Discipline
1. Add a reproducible local dev setup script.
2. Add a lightweight architecture doc for training vs serving paths.
3. Add unit/integration tests for serving endpoints (`/health`, `/stats`, `/chat/completions`).
4. Add experiment templates (baseline run config + result log format).

### P1: Core ML Learning Tracks
1. `scikit-learn` baseline text classifier pipeline (TF-IDF + Logistic Regression/SVM).
2. PyTorch fundamentals track with custom training loop notebook/script.
3. Optional TensorFlow parity mini-project (single model training + compare ergonomics).
4. Hugging Face Transformers:
   - inference pipeline,
   - fine-tuning small model,
   - optional LoRA/PEFT path.

### P2: Production + GCP
1. Dockerize serving app.
2. Add Cloud Build config and Artifact Registry push flow.
3. Deploy CPU service to Cloud Run (cheap always-on endpoint).
4. Deploy GPU-backed service to Compute Engine for full model.
5. Add deployment scripts and rollback checklist.

### P3: Observability Layer
1. Structured JSON logs with request IDs.
2. Prometheus metrics:
   - latency,
   - request rate,
   - error rate,
   - tokens/sec,
   - queue depth.
3. OpenTelemetry tracing for request lifecycle.
4. Grafana dashboards + alert rules.
5. Cost and resource visibility (GPU/CPU/RAM/utilization).

### P4: Advanced "Cool Stuff"
1. Scaling experiments (depth/aspect ratio/head_dim sweeps).
2. Bigger model attempts within budget (depth increase + checkpoint strategy).
3. Quantization for cheaper serving.
4. RAG layer (embeddings + vector DB + citations).
5. System design artifacts (high-level architecture, SLOs, failure modes).
6. Optional Spark/big-data batch pipeline for dataset preparation.

---

## 60-Day Day-by-Day Plan

### Weeks 1-2 (Days 1-14): Foundations + Repo Mastery
1. Day 1: Environment setup, run tests, run one tiny training command. Post setup screenshot + goal statement.
2. Day 2: Read `README.md`, map code structure, create personal architecture notes. Post "How nanochat is structured".
3. Day 3: Run tokenizer eval; explain vocab/compression tradeoffs. Post one chart.
4. Day 4: Run small CPU pretrain (`depth=4`) and capture logs. Post first training curve.
5. Day 5: Launch `chat_web.py` locally and test API endpoints. Post short demo clip.
6. Day 6: Add/extend one test in `tests/` and open a small PR/commit. Post what test coverage taught you.
7. Day 7: Weekly recap and blockers list. LinkedIn long-form reflection.
8. Day 8: Start `scikit-learn` text baseline (dataset + preprocessing). Post dataset choice and why.
9. Day 9: Train Logistic Regression baseline; record metrics. Post metric table.
10. Day 10: Try SVM/RandomForest baseline; compare to Day 9. Post comparison thread.
11. Day 11: Error analysis on worst predictions; write insights. Post 3 failure examples.
12. Day 12: Wrap sklearn baseline in tiny FastAPI endpoint. Post API snippet.
13. Day 13: Add basic tests for sklearn endpoint. Post "from notebook to API" lesson.
14. Day 14: Week 2 recap and next-week plan. LinkedIn carousel-style progress summary.

### Weeks 3-4 (Days 15-28): PyTorch + Transformers
15. Day 15: PyTorch tensor/autograd exercises. Post one concise "autograd mental model" note.
16. Day 16: Build MLP training loop from scratch. Post loss curve.
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
28. Day 28: Week 4 recap + milestone demo recording.

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
42. Day 42: Mid-program capstone demo (train -> deploy -> observe). LinkedIn long post + Twitter thread.

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
56. Day 56: Draft AI system design doc (SLOs, failure modes, mitigations).
57. Day 57: Hardening day: retries, timeouts, circuit-breaker ideas.
58. Day 58: Final load/cost test and reliability pass.
59. Day 59: Portfolio polish: README, architecture diagrams, demo video.
60. Day 60: Final launch post on Twitter + LinkedIn with full retrospective.

---

## Daily Social Posting Template (Twitter + LinkedIn)
Use this simple structure daily:
1. What I built today (1 sentence)
2. One metric/result (number, screenshot, or short chart)
3. One thing that failed (and fix plan)
4. Next step for tomorrow

Weekly cadence:
1. Mon-Fri: short build updates
2. Sat: technical thread (deeper breakdown)
3. Sun: weekly retrospective (wins, losses, next bets)

---

## Definition of Done (per day)
A day is complete only if all are true:
1. Code or experiment artifact exists (commit/notebook/report/dashboard).
2. Learnings are written in plain language.
3. A public post is published.
4. Next day is pre-planned in one sentence.

---

## First 5 Immediate Actions (start now)
1. Run `python -m pytest` and `python -m scripts.chat_web` locally.
2. Create a `daily-log/` folder with `day-01.md`.
3. Implement one tiny improvement to observability (`/health` or request timing).
4. Draft Day 1 Twitter and LinkedIn posts.
5. Schedule Day 2 code-reading session (`gpt.py`, `base_train.py`, `chat_web.py`).
