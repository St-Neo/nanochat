# concepts_roadmap.md

## Purpose
This file explains the concepts you will learn while executing the roadmap, where each concept is practiced, and what to read/watch before implementation.

## Direct Answer: Will You Learn `Epochs`?
Yes.
1. Day 4 introduces the vocabulary: `epoch`, `step/iteration`, `batch`, `micro-batch`, `gradient accumulation`.
2. Day 16 uses explicit epoch counters in a PyTorch training loop.
3. Day 23 reinforces this during Hugging Face fine-tuning.

Important nuance:
1. In many LLM pretraining pipelines (including nanochat), you often track `steps/iterations` and `tokens` more than epochs, because data can be streamed and huge.
2. You will learn both conventions and when each one is appropriate.

---

## Prerequisite Resource Map
These IDs match `daily_step_by_step.md`.

1. `R1` nanochat README
2. `R2` scikit-learn tutorial
3. `R3` PyTorch 60-min blitz
4. `R4` Hugging Face NLP course
5. `R5` FastAPI tutorial
6. `R6` Docker get started
7. `R7` Cloud Run quickstart
8. `R8` GCP budget alerts
9. `R9` Prometheus Python client
10. `R10` OpenTelemetry Python
11. `R11` Grafana docs
12. `R12` FAISS docs
13. `R13` PEFT docs
14. `R14` W&B docs
15. `R15` Cloud Monitoring docs

---

## Concept Map By Category

### 1) ML Foundations
1. Problem framing and task definition
   - Learn: classification objective, labels, constraints, success metrics.
   - Days: 8, 9, 10, 11
   - Read first: `R2`
2. Dataset splitting (`train/val/test`)
   - Learn: data leakage prevention and reproducibility via seeds.
   - Days: 8, 11
   - Read first: `R2`
3. Feature engineering for text
   - Learn: TF-IDF and sparse features.
   - Days: 9, 10
   - Read first: `R2`
4. Baseline-first methodology
   - Learn: why simple models should be your first benchmark.
   - Days: 9, 10, 24
   - Read first: `R2`, `R4`
5. Evaluation metrics
   - Learn: accuracy, precision, recall, F1, confusion matrix.
   - Days: 9, 10, 11, 24
   - Read first: `R2`
6. Error analysis
   - Learn: failure categories and targeted improvements.
   - Days: 11, 46
   - Read first: `R2`

### 2) Training Vocabulary and Optimization Fundamentals
1. `Epoch`
   - Learn: one full pass over finite training data.
   - Days: 4, 16, 23
   - Read first: `R3`, `R4`
2. `Step` / `Iteration`
   - Learn: one optimizer update; often primary LLM training unit.
   - Days: 4, 16, 20, 50
   - Read first: `R1`, `R3`
3. `Batch` and `Micro-batch`
   - Learn: memory-performance tradeoffs.
   - Days: 4, 16
   - Read first: `R3`
4. `Gradient accumulation`
   - Learn: emulate larger batch when GPU memory is limited.
   - Days: 4, 20
   - Read first: `R1`, `R3`
5. Learning rate and schedules
   - Learn: warmup, decay, sensitivity to scale.
   - Days: 20, 50, 51
   - Read first: `R1`, `R14`
6. Optimizers (SGD/AdamW/Muon context)
   - Learn: parameter updates, momentum intuition, optimizer selection.
   - Days: 15, 16, 20
   - Read first: `R3`, `R1`
7. Overfitting and generalization
   - Learn: validation behavior and regularization decisions.
   - Days: 17, 24
   - Read first: `R3`, `R4`

### 3) PyTorch and Deep Learning Core
1. Tensor operations
   - Learn: shapes, broadcasting, device handling.
   - Days: 15, 18, 19
   - Read first: `R3`
2. Autograd and backpropagation
   - Learn: gradients, computation graph, `backward()`.
   - Days: 15, 16
   - Read first: `R3`
3. Building training loops
   - Learn: forward pass, loss, backward pass, optimizer step.
   - Days: 16, 17
   - Read first: `R3`
4. Validation loops and early stopping
   - Learn: stopping criteria and generalization checks.
   - Days: 17
   - Read first: `R3`
5. Attention mechanics
   - Learn: Q/K/V, scaled dot-product attention, shape reasoning.
   - Days: 18, 19
   - Read first: `R3`, `R1`
6. Experiment discipline
   - Learn: one-variable-at-a-time experiments.
   - Days: 20, 50, 51
   - Read first: `R14`

### 4) LLM and Transformers Concepts
1. Tokenization and vocabulary
   - Learn: BPE, vocab size impacts, compression tradeoffs.
   - Days: 3, 22
   - Read first: `R1`, `R4`
2. Context length and sequence modeling
   - Learn: max sequence length and inference constraints.
   - Days: 4, 19
   - Read first: `R1`
3. Transformer architecture
   - Learn: blocks, heads, embeddings, residual pathways.
   - Days: 18, 19
   - Read first: `R1`, `R4`
4. Pretraining vs SFT vs RL
   - Learn: stage goals and data differences.
   - Days: 2, 4, 23, 25
   - Read first: `R1`, `R4`, `R13`
5. Inference controls
   - Learn: temperature, top-k, max tokens.
   - Days: 5, 22, 27
   - Read first: `R1`, `R4`
6. Fine-tuning with Trainer
   - Learn: modern transfer learning workflow.
   - Days: 23, 24
   - Read first: `R4`
7. LoRA/PEFT
   - Learn: parameter-efficient adaptation.
   - Days: 25
   - Read first: `R13`
8. Scaling laws and compute tradeoffs
   - Learn: params vs tokens vs FLOPs.
   - Days: 20, 50, 51
   - Read first: `R1`, `R14`
9. Quantization
   - Learn: quality/latency/cost tradeoffs at inference.
   - Days: 52
   - Read first: vendor/framework quantization docs

### 5) API, Backend, and Productization
1. FastAPI endpoint design
   - Learn: request models, validation, routing.
   - Days: 5, 12, 27
   - Read first: `R5`
2. Testing service behavior
   - Learn: endpoint reliability and regression protection.
   - Days: 6, 13
   - Read first: pytest docs + `R5`
3. Config management
   - Learn: `.env` and environment-specific config.
   - Days: 30
   - Read first: `R5`

### 6) Cloud, Deployment, and DevOps
1. Containerization
   - Learn: Dockerfile, image build/run cycle.
   - Days: 29
   - Read first: `R6`
2. Artifact management and CI/CD
   - Learn: Cloud Build + Artifact Registry path.
   - Days: 32
   - Read first: `R7`
3. Managed deployment (Cloud Run)
   - Learn: stateless CPU deployment, cold start behavior.
   - Days: 33
   - Read first: `R7`
4. GPU serving on VM
   - Learn: infra provisioning, runtime setup, operational checks.
   - Days: 34
   - Read first: GCP Compute Engine GPU docs
5. Release safety
   - Learn: deploy scripts, rollback checklist.
   - Days: 35
   - Read first: deployment best-practice docs
6. Cloud cost governance
   - Learn: budgets, alerts, and spend control.
   - Days: 31, weekly Sunday reviews
   - Read first: `R8`

### 7) Observability and Reliability
1. Structured logging
   - Learn: JSON logs and request IDs.
   - Days: 36
   - Read first: Python logging docs
2. Metrics
   - Learn: latency, throughput, error rate, queue depth.
   - Days: 37
   - Read first: `R9`
3. Tracing
   - Learn: distributed spans across request path.
   - Days: 38
   - Read first: `R10`
4. Dashboards
   - Learn: panel design for operational decisions.
   - Days: 39
   - Read first: `R11`
5. Alerting
   - Learn: threshold and notification strategy.
   - Days: 40
   - Read first: `R15`
6. Load testing and performance tuning
   - Learn: bottleneck identification and targeted optimization.
   - Days: 41, 58
   - Read first: k6/Locust docs
7. Resilience patterns
   - Learn: timeout, retry, failure handling.
   - Days: 57
   - Read first: reliability pattern references

### 8) Advanced Applied AI
1. RAG architecture
   - Learn: chunking, embeddings, retrieval, citation grounding.
   - Days: 43, 44, 45
   - Read first: `R4`, `R12`
2. RAG evaluation
   - Learn: retrieval quality and grounded answer scoring.
   - Days: 46
   - Read first: eval resources used in your stack
3. Guardrails and abuse resistance
   - Learn: prompt injection basics and safer fallbacks.
   - Days: 47
   - Read first: security guidance for LLM apps
4. Caching strategy
   - Learn: speed/cost improvements with cache design.
   - Days: 48
   - Read first: API caching references

### 9) Professional Engineering Skills
1. Technical writing
   - Learn: concise status reports and design notes.
   - Days: every day via `daily-log`
2. Build-in-public habit
   - Learn: communicating metrics, failures, and next steps.
   - Days: every day (Twitter + LinkedIn)
3. Retrospectives and prioritization
   - Learn: planning with constraints and recovery from slip.
   - Days: 7, 14, 21, 28, 42, 56, 60
4. Portfolio packaging
   - Learn: converting project work into career assets.
   - Days: 59, 60

---

## Gaps Found And Plan Updates Applied
The plan has been updated to close gaps:
1. Added explicit `epoch/step/batch/gradient accumulation` checkpoint on Day 4.
2. Added explicit epoch-vs-step training instrumentation on Day 16.
3. Added buffer/catch-up checkpoints on Day 14, Day 28, Day 42, and Day 56.

These updates are already reflected in:
1. `plan.md`
2. `daily_step_by_step.md`

---

## How To Use This During Execution
1. Before each day: read the day entry in `daily_step_by_step.md`.
2. During implementation: keep this file open and check off concepts encountered.
3. After each day: write 3 lines in `daily-log/day-XX.md`:
   - Concept learned
   - Evidence (command/run/result)
   - One open question
