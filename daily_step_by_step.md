# daily_step_by_step.md

## Date Anchor And Time Budget
- Current date pulled from environment: `Sunday, 2026-02-08`
- Plan start date: `Monday, 2026-02-09`
- Plan end date: `Thursday, 2026-04-09` (60 calendar days)
- Weekday budget (Mon-Fri): `2-3 hours/day`
- Weekend budget (Sat-Sun): `4-5 hours/day` (or `2 hours` catch-up if needed)

## Daily Session Template (Use Every Day)
1. `25-35 min` Read/Watch
2. `90-120 min` Implement
3. `20-30 min` Validate + notes
4. `15-20 min` Twitter + LinkedIn post

## Read/Watch Resource Pack
- `R1` nanochat repo README: `https://github.com/karpathy/nanochat/blob/master/README.md`
- `R2` scikit-learn basic tutorial: `https://scikit-learn.org/stable/tutorial/basic/tutorial.html`
- `R3` PyTorch 60-min blitz: `https://pytorch.org/tutorials/beginner/deep_learning_60min_blitz.html`
- `R4` Hugging Face NLP course: `https://huggingface.co/learn/nlp-course/chapter1/1`
- `R5` FastAPI tutorial: `https://fastapi.tiangolo.com/tutorial/`
- `R6` Docker get started: `https://docs.docker.com/get-started/`
- `R7` Cloud Run quickstart: `https://cloud.google.com/run/docs/quickstarts/build-and-deploy/deploy-python-service`
- `R8` Google Cloud budget alerts: `https://cloud.google.com/billing/docs/how-to/budgets`
- `R9` Prometheus Python client: `https://prometheus.github.io/client_python/`
- `R10` OpenTelemetry Python docs: `https://opentelemetry.io/docs/languages/python/`
- `R11` Grafana docs: `https://grafana.com/docs/grafana/latest/`
- `R12` FAISS docs: `https://faiss.ai/`
- `R13` PEFT docs: `https://huggingface.co/docs/peft/index`
- `R14` Weights & Biases docs: `https://docs.wandb.ai/`
- `R15` Google Cloud Monitoring docs: `https://cloud.google.com/monitoring/docs`

## Day-By-Day Execution

### Day 1 - 2026-02-09 (Mon) - 2-3h
- Read/Watch: `R1` (Getting started + file structure)
- Step-by-step:
1. Run `python -m pytest`.
2. Run a tiny train command on CPU.
3. Save logs in `daily-log/day-01.md`.
- Learn: local setup, test loop, repo entry points.
- Affirmation: I make steady progress through consistent execution.

### Day 2 - 2026-02-10 (Tue) - 2-3h
- Read/Watch: `R1` (scripts overview), skim `scripts/base_train.py`
- Step-by-step:
1. Map train/eval/chat pipeline in one diagram.
2. Write 10-line summary of each top-level folder.
3. Capture unknowns for later.
- Learn: system boundaries and control flow.
- Affirmation: Clarity grows every time I inspect the system deeply.

### Day 3 - 2026-02-11 (Wed) - 2-3h
- Read/Watch: tokenizer sections in `R1`
- Step-by-step:
1. Run tokenizer eval script.
2. Record compression metrics.
3. Write one paragraph on tokenization tradeoffs.
- Learn: tokenizer quality and measurement.
- Affirmation: I turn data into understanding.

### Day 4 - 2026-02-12 (Thu) - 2-3h
- Read/Watch: `scripts/base_train.py` arg parsing and training loop
- Step-by-step:
1. Run CPU mini pretrain with tiny settings.
2. Track step time and memory.
3. Create a short glossary in notes: `epoch`, `step/iteration`, `batch`, `micro-batch`, `gradient accumulation`.
4. Save metrics in `daily-log/day-04.md`.
- Learn: training loop mechanics, epoch/step vocabulary, and constraints.
- Affirmation: Small experiments build real intuition.

### Day 5 - 2026-02-13 (Fri) - 2-3h
- Read/Watch: `scripts/chat_web.py` + `R5` basics
- Step-by-step:
1. Launch web server locally.
2. Hit `/health` and `/stats`.
3. Document request/response behavior.
- Learn: serving path and API contracts.
- Affirmation: I learn fastest by shipping and observing.

### Day 6 - 2026-02-14 (Sat) - 4-5h
- Read/Watch: `tests/*` and pytest docs quickstart
- Step-by-step:
1. Add or improve one endpoint test.
2. Run full test suite.
3. Write what failed and why.
- Learn: confidence through tests.
- Affirmation: Quality is my force multiplier.

### Day 7 - 2026-02-15 (Sun) - 4-5h
- Read/Watch: `R14` experiment tracking basics
- Step-by-step:
1. Weekly retrospective: wins, blockers, next week goals.
2. Clean notes and create issue list.
3. Publish weekly LinkedIn summary.
- Learn: reflection-driven improvement.
- Affirmation: Review is how I convert effort into progress.

### Day 8 - 2026-02-16 (Mon) - 2-3h
- Read/Watch: `R2` section on loading and splitting data
- Step-by-step:
1. Pick text dataset for sklearn baseline.
2. Create preprocessing notebook/script.
3. Save train/val/test split with seed.
- Learn: reproducible data prep.
- Affirmation: Strong foundations make later speed possible.

### Day 9 - 2026-02-17 (Tue) - 2-3h
- Read/Watch: `R2` TF-IDF + linear models
- Step-by-step:
1. Train TF-IDF + Logistic Regression baseline.
2. Record accuracy/F1.
3. Save confusion matrix.
- Learn: fast classical NLP baselines.
- Affirmation: I build baselines before chasing complexity.

### Day 10 - 2026-02-18 (Wed) - 2-3h
- Read/Watch: `R2` SVM model docs
- Step-by-step:
1. Train SVM (or LinearSVC) baseline.
2. Compare against Day 9 metrics.
3. Write one decision note.
- Learn: model comparison discipline.
- Affirmation: Evidence guides my choices.

### Day 11 - 2026-02-19 (Thu) - 2-3h
- Read/Watch: sklearn model evaluation guide
- Step-by-step:
1. Analyze 20 worst predictions.
2. Categorize failure types.
3. Define next preprocessing tweak.
- Learn: error analysis process.
- Affirmation: Every mistake is labeled training data for me.

### Day 12 - 2026-02-20 (Fri) - 2-3h
- Read/Watch: `R5` request models and routing
- Step-by-step:
1. Wrap sklearn model in tiny FastAPI endpoint.
2. Add input validation.
3. Test with curl/Postman.
- Learn: moving from notebook to service.
- Affirmation: I can productionize what I prototype.

### Day 13 - 2026-02-21 (Sat) - 4-5h
- Read/Watch: pytest fixtures + FastAPI testing
- Step-by-step:
1. Add tests for sklearn endpoint.
2. Add one failure-case test.
3. Capture open technical debt list.
- Learn: reliable API behavior.
- Affirmation: I build with rigor, not luck.

### Day 14 - 2026-02-22 (Sun) - 4-5h
- Read/Watch: weekly notes, no new heavy material
- Step-by-step:
1. Buffer/catch-up first: close unfinished tasks from Days 8-13.
2. Week 2 recap and plan Week 3.
3. Refactor notes into a single changelog.
4. Publish weekly social update.
- Learn: planning, backlog control, and narrative clarity.
- Affirmation: Consistency compounds into mastery.

### Day 15 - 2026-02-23 (Mon) - 2-3h
- Read/Watch: `R3` tensor/autograd basics
- Step-by-step:
1. Write small tensor exercises.
2. Verify gradients manually for one example.
3. Log key autograd observations.
- Learn: core gradient intuition.
- Affirmation: I understand the math by implementing it.

### Day 16 - 2026-02-24 (Tue) - 2-3h
- Read/Watch: `R3` training loop basics
- Step-by-step:
1. Build an MLP classifier in PyTorch.
2. Implement train loop manually with explicit epoch counter.
3. Log per-step and per-epoch loss.
4. Plot training loss.
- Learn: end-to-end neural training loop and epoch-vs-step mechanics.
- Affirmation: I can build neural systems from first principles.

### Day 17 - 2026-02-25 (Wed) - 2-3h
- Read/Watch: validation and regularization section in `R3`
- Step-by-step:
1. Add validation pass.
2. Add early stopping.
3. Compare train vs val behavior.
- Learn: overfitting detection and control.
- Affirmation: I optimize for generalization, not vanity metrics.

### Day 18 - 2026-02-26 (Thu) - 2-3h
- Read/Watch: basic attention tutorial (paper/blog of choice)
- Step-by-step:
1. Implement minimal scaled dot-product attention.
2. Run on dummy tensors.
3. Inspect shapes and outputs.
- Learn: attention mechanics in code.
- Affirmation: Complex ideas become simple when I test them.

### Day 19 - 2026-02-27 (Fri) - 2-3h
- Read/Watch: `nanochat/gpt.py` forward pass
- Step-by-step:
1. Trace one forward path with comments.
2. Note tensor shapes across blocks.
3. Write a 1-page summary.
- Learn: how nanochat GPT module is structured.
- Affirmation: I earn confidence by reading real code closely.

### Day 20 - 2026-02-28 (Sat) - 4-5h
- Read/Watch: `dev/LOG.md` experiment sections
- Step-by-step:
1. Pick one hyperparameter tweak.
2. Run tiny experiment.
3. Compare against baseline.
- Learn: controlled experimentation.
- Affirmation: I improve systems through disciplined iteration.

### Day 21 - 2026-03-01 (Sun) - 4-5h
- Read/Watch: week notes + `R14` logging best practices
- Step-by-step:
1. Weekly recap and metric review.
2. Create Week 4 targets.
3. Publish deep-dive LinkedIn post.
- Learn: communicating technical progress.
- Affirmation: I turn hard work into visible momentum.

### Day 22 - 2026-03-02 (Mon) - 2-3h
- Read/Watch: `R4` chapters on tokenizers and pipelines
- Step-by-step:
1. Run Hugging Face inference pipeline.
2. Test with 20 prompts.
3. Log latency + output quality notes.
- Learn: quick transformer inference workflow.
- Affirmation: I ship practical experiments quickly.

### Day 23 - 2026-03-03 (Tue) - 2-3h
- Read/Watch: `R4` Trainer API basics
- Step-by-step:
1. Fine-tune a small transformer on your dataset.
2. Track train/val metrics.
3. Save model artifacts with version tag.
- Learn: modern fine-tuning flow.
- Affirmation: I can adapt pretrained models with intent.

### Day 24 - 2026-03-04 (Wed) - 2-3h
- Read/Watch: evaluation chapter in `R4`
- Step-by-step:
1. Evaluate HF model.
2. Compare against sklearn baseline.
3. Write tradeoff note (quality vs speed vs cost).
- Learn: benchmark-based decision making.
- Affirmation: I choose tools based on outcomes, not hype.

### Day 25 - 2026-03-05 (Thu) - 2-3h
- Read/Watch: `R13` intro (PEFT/LoRA)
- Step-by-step:
1. Run one small LoRA fine-tuning pass.
2. Compare train time and memory with full FT.
3. Save findings in notes.
- Learn: efficient fine-tuning strategy.
- Affirmation: I get leverage from efficient methods.

### Day 26 - 2026-03-06 (Fri) - 2-3h
- Read/Watch: model versioning best practices (short blog/doc)
- Step-by-step:
1. Define model naming/version policy.
2. Create artifacts folder structure.
3. Add README for reproducibility steps.
- Learn: reproducible ML workflow.
- Affirmation: Organization gives me long-term speed.

### Day 27 - 2026-03-07 (Sat) - 4-5h
- Read/Watch: `R5` dependency injection + API design
- Step-by-step:
1. Add optional HF endpoint in service.
2. Add switch/config to pick backend.
3. Test both paths.
- Learn: multi-backend serving design.
- Affirmation: I can integrate new capabilities without chaos.

### Day 28 - 2026-03-08 (Sun) - 4-5h
- Read/Watch: week notes
- Step-by-step:
1. Buffer/catch-up first: close unfinished tasks from Days 22-27.
2. Week 4 demo recording.
3. Consolidate architecture and benchmark notes.
4. Post milestone summary.
- Learn: packaging technical progress and schedule resilience.
- Affirmation: My work is becoming a strong public portfolio.

### Day 29 - 2026-03-09 (Mon) - 2-3h
- Read/Watch: `R6` Docker basics
- Step-by-step:
1. Create initial Dockerfile.
2. Build image locally.
3. Run container and hit health endpoint.
- Learn: containerized deployment fundamentals.
- Affirmation: I make my software portable and reliable.

### Day 30 - 2026-03-10 (Tue) - 2-3h
- Read/Watch: `.env` handling in FastAPI + `python-dotenv`
- Step-by-step:
1. Move configs to env variables.
2. Add `.env.example`.
3. Document startup commands.
- Learn: clean runtime configuration management.
- Affirmation: I reduce fragility by designing for operations.

### Day 31 - 2026-03-11 (Wed) - 2-3h
- Read/Watch: `R8` (budgets + alerts) and IAM basics
- Step-by-step:
1. Create GCP budget and alert thresholds.
2. Set minimal IAM roles.
3. Record cost guardrails.
- Learn: cloud cost and access hygiene.
- Affirmation: I protect my progress with smart constraints.

### Day 32 - 2026-03-12 (Thu) - 2-3h
- Read/Watch: `R7` build/deploy quickstart
- Step-by-step:
1. Configure Artifact Registry.
2. Push container via Cloud Build.
3. Verify image availability.
- Learn: CI/CD path to cloud artifact storage.
- Affirmation: I turn local work into deployable assets.

### Day 33 - 2026-03-13 (Fri) - 2-3h
- Read/Watch: `R7` Cloud Run service config
- Step-by-step:
1. Deploy CPU endpoint to Cloud Run.
2. Validate `/health` and a sample request.
3. Capture latency and cold-start notes.
- Learn: managed serving with low operational load.
- Affirmation: I can deliver value even with tight constraints.

### Day 34 - 2026-03-14 (Sat) - 4-5h
- Read/Watch: Compute Engine GPU setup docs
- Step-by-step:
1. Provision GPU VM.
2. Set up runtime and model files.
3. Run service and test externally.
- Learn: GPU infrastructure setup flow.
- Affirmation: I can handle infra complexity calmly.

### Day 35 - 2026-03-15 (Sun) - 4-5h
- Read/Watch: release and rollback best practices
- Step-by-step:
1. Write `deploy` and `rollback` scripts.
2. Test rollback once.
3. Document release checklist.
- Learn: safe deployment discipline.
- Affirmation: I build for reliability, not heroics.

### Day 36 - 2026-03-16 (Mon) - 2-3h
- Read/Watch: structured logging in Python/FastAPI
- Step-by-step:
1. Add JSON logger with request IDs.
2. Include model name/version in logs.
3. Validate log readability.
- Learn: operationally useful logging.
- Affirmation: Good visibility makes me faster and calmer.

### Day 37 - 2026-03-17 (Tue) - 2-3h
- Read/Watch: `R9` metrics instrumentation
- Step-by-step:
1. Add request count, latency, error metrics.
2. Add queue depth and token throughput metrics.
3. Expose metrics endpoint.
- Learn: service observability metrics.
- Affirmation: I measure what matters.

### Day 38 - 2026-03-18 (Wed) - 2-3h
- Read/Watch: `R10` tracing basics
- Step-by-step:
1. Add OpenTelemetry spans to request lifecycle.
2. Include model inference span details.
3. Verify traces in backend.
- Learn: end-to-end request tracing.
- Affirmation: I can see the system, so I can improve it.

### Day 39 - 2026-03-19 (Thu) - 2-3h
- Read/Watch: `R11` dashboard basics
- Step-by-step:
1. Build Grafana dashboard with core panels.
2. Add p95 latency and error rate panels.
3. Save dashboard JSON/export.
- Learn: visualization for operations.
- Affirmation: I convert telemetry into decisions.

### Day 40 - 2026-03-20 (Fri) - 2-3h
- Read/Watch: `R15` alerting concepts
- Step-by-step:
1. Create alert policies for latency and errors.
2. Configure notification channel.
3. Trigger a test alert.
- Learn: proactive incident detection.
- Affirmation: I prevent surprises through preparation.

### Day 41 - 2026-03-21 (Sat) - 4-5h
- Read/Watch: basic load testing guide (k6/Locust docs)
- Step-by-step:
1. Run controlled load test.
2. Identify one bottleneck.
3. Apply one optimization and re-test.
- Learn: performance tuning loop.
- Affirmation: I improve performance with evidence, not guesses.

### Day 42 - 2026-03-22 (Sun) - 4-5h
- Read/Watch: week notes
- Step-by-step:
1. Buffer/catch-up first: close unfinished tasks from Days 36-41.
2. Build capstone demo (train -> deploy -> observe).
3. Record 5-8 minute walkthrough.
4. Publish long-form recap.
- Learn: narrative, product thinking, and recovery planning.
- Affirmation: I can present technical work with confidence.

### Day 43 - 2026-03-23 (Mon) - 2-3h
- Read/Watch: RAG fundamentals (HF docs/blog)
- Step-by-step:
1. Define use case for retrieval.
2. Create chunking strategy.
3. Generate embeddings for sample docs.
- Learn: retrieval pipeline basics.
- Affirmation: I can extend models with grounded context.

### Day 44 - 2026-03-24 (Tue) - 2-3h
- Read/Watch: `R12` quickstart
- Step-by-step:
1. Build vector index (FAISS/Chroma).
2. Add retrieval function.
3. Validate top-k relevance manually.
- Learn: vector search setup.
- Affirmation: I make complex systems practical.

### Day 45 - 2026-03-25 (Wed) - 2-3h
- Read/Watch: prompt templating for RAG
- Step-by-step:
1. Integrate retrieved context into chat prompt.
2. Return citations in response.
3. Test on 10 QA examples.
- Learn: end-to-end RAG response flow.
- Affirmation: I build useful AI, not just clever AI.

### Day 46 - 2026-03-26 (Thu) - 2-3h
- Read/Watch: evaluation patterns for RAG
- Step-by-step:
1. Create mini RAG eval set.
2. Score answer correctness and citation quality.
3. Log failure cases.
- Learn: RAG quality measurement.
- Affirmation: I trust metrics more than intuition alone.

### Day 47 - 2026-03-27 (Fri) - 2-3h
- Read/Watch: prompt injection and basic safeguards
- Step-by-step:
1. Add simple input guardrails.
2. Add safe fallback responses.
3. Create 5 adversarial tests.
- Learn: safety and robustness basics.
- Affirmation: I build responsibly and intentionally.

### Day 48 - 2026-03-28 (Sat) - 4-5h
- Read/Watch: caching strategies in APIs
- Step-by-step:
1. Add retrieval/result cache.
2. Benchmark latency before/after.
3. Note cache hit-rate assumptions.
- Learn: practical latency optimization.
- Affirmation: I engineer for both quality and speed.

### Day 49 - 2026-03-29 (Sun) - 4-5h
- Read/Watch: architecture writing examples
- Step-by-step:
1. Draw RAG architecture diagram.
2. Write design tradeoffs.
3. Publish technical thread/post.
- Learn: system communication skills.
- Affirmation: I can explain difficult systems simply.

### Day 50 - 2026-03-30 (Mon) - 2-3h
- Read/Watch: `dev/LOG.md` scaling-related sections
- Step-by-step:
1. Plan depth sweep experiment.
2. Define fixed metrics and constraints.
3. Start first run.
- Learn: fair experiment setup.
- Affirmation: I optimize with structure and patience.

### Day 51 - 2026-03-31 (Tue) - 2-3h
- Read/Watch: scaling law summaries
- Step-by-step:
1. Run second configuration.
2. Compare quality/cost/latency.
3. Write one recommendation.
- Learn: tradeoff analysis for model scaling.
- Affirmation: I make decisions that balance ambition and reality.

### Day 52 - 2026-04-01 (Wed) - 2-3h
- Read/Watch: quantization overview docs
- Step-by-step:
1. Try one quantized inference path.
2. Benchmark latency and quality.
3. Record deployment implications.
- Learn: cost-efficient inference strategies.
- Affirmation: I can reduce cost without losing direction.

### Day 53 - 2026-04-02 (Thu) - 2-3h
- Read/Watch: reporting templates and experiment logging
- Step-by-step:
1. Create experiment report template.
2. Auto-populate key fields from run outputs.
3. Commit template + example.
- Learn: repeatable reporting workflow.
- Affirmation: I build systems that support my future self.

### Day 54 - 2026-04-03 (Fri) - 2-3h
- Read/Watch: TensorFlow quickstart (optional comparison)
- Step-by-step:
1. Train one tiny TensorFlow model.
2. Compare ergonomics to PyTorch notes.
3. Decide whether TF stays in your stack.
- Learn: framework comparison mindset.
- Affirmation: I choose tools by fit, not by trend.

### Day 55 - 2026-04-04 (Sat) - 4-5h
- Read/Watch: Spark intro (if doing data pipeline)
- Step-by-step:
1. Run one small Spark preprocessing job.
2. Export cleaned sample dataset.
3. Document when Spark is worth it.
- Learn: big-data preprocessing basics.
- Affirmation: I can scale data workflows thoughtfully.

### Day 56 - 2026-04-05 (Sun) - 4-5h
- Read/Watch: system design docs/examples
- Step-by-step:
1. Buffer/catch-up first: close unfinished tasks from Days 50-55.
2. Draft AI system design doc.
3. Define SLOs, failure modes, mitigations.
4. Share draft for feedback.
- Learn: production architecture thinking and scope management.
- Affirmation: I design systems with long-term reliability in mind.

### Day 57 - 2026-04-06 (Mon) - 2-3h
- Read/Watch: retry/timeout/circuit-breaker patterns
- Step-by-step:
1. Add request timeout strategy.
2. Add retry policy for safe operations.
3. Add one resilience test.
- Learn: reliability engineering basics.
- Affirmation: I reduce risk through intentional safeguards.

### Day 58 - 2026-04-07 (Tue) - 2-3h
- Read/Watch: load/perf test notes from prior weeks
- Step-by-step:
1. Run final load and cost test.
2. Check alerts and dashboard behavior.
3. Produce final performance summary.
- Learn: readiness validation.
- Affirmation: I verify before I claim success.

### Day 59 - 2026-04-08 (Wed) - 2-3h
- Read/Watch: portfolio project README examples
- Step-by-step:
1. Polish repo README and diagrams.
2. Add demo video links.
3. Add setup and quickstart clarity improvements.
- Learn: developer experience and portfolio packaging.
- Affirmation: I present my work with precision and pride.

### Day 60 - 2026-04-09 (Thu) - 2-3h
- Read/Watch: all recap notes
- Step-by-step:
1. Write final retrospective (what worked, what failed, what next).
2. Publish final Twitter + LinkedIn launch post.
3. Define next 30-day continuation plan.
- Learn: sustainable growth after milestone completion.
- Affirmation: I am building a career-grade practice, one day at a time.

## Additional Suggestions (My Recommendations)
1. Keep Friday sessions lighter: cleanup, notes, tests, and posting.
2. Set a strict monthly GCP budget cap and one emergency kill-switch checklist.
3. Maintain a single `daily-log/` folder with one markdown file per day.
4. Record one short screen demo every Sunday; this compounds your portfolio fast.
5. Avoid starting new tools mid-week unless blocked; protect focus.

## Article Alignment vs Deviation
- Estimated alignment with your shared article: `~72%`
1. Foundation track (Python/ML/DL progression): aligned.
2. LLM track (Transformers, fine-tuning, RAG): aligned.
3. MLOps track (deploy, monitor, optimize): aligned.
4. Communication/build-in-public element: aligned.
- Estimated deviation/customization: `~28%`
1. Nanochat-specific repository-first sequencing.
2. GCP-credit-aware deployment choices (Cloud Run CPU + GPU VM split).
3. Heavy observability depth (logs + metrics + tracing + dashboards + alerts).
4. Timeboxing for working-professional constraints (2-3h weekdays).
