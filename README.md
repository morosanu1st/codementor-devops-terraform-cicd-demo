# Terraform, CI/CD & Kubernetes Mentorship Demo

A small, runnable sketch of the DevOps stack I use when mentoring on Codementor: Terraform stubs, GitHub Actions CI, Docker, and a tiny Kubernetes/Compose layout.

## What this repo shows

| Piece | Path | Purpose |
|-------|------|---------|
| Terraform S3 + VPC stub | `terraform/` | IaC basics, remote state mindset, AWS troubleshooting hooks |
| GitHub Actions CI | `ci/github-actions-ci.yml` (copy into `.github/workflows/` when you have workflow scope) | Lint/plan-style pipeline without needing live cloud creds |
| Dockerfile | `Dockerfile` | Build a tiny nginx-based demo image |
| Compose | `docker-compose.yml` | Local multi-service smoke test |
| K8s Deployment + Service | `k8s/` | Minimal manifest pair for interview walkthroughs |

No real AWS keys or paid cloud required — everything is educational stubs you can read and extend.

## How I help as a Codementor tutor

I tailor sessions to your current level (junior ops → mid platform engineer) and focus on **why** tools fit together, not just YAML copy-paste. Typical outcomes:

- Confidence explaining Terraform state, providers, and blast radius
- A CI pipeline you can defend in interviews
- Docker → Compose → K8s mental model (when each is enough)
- Structured AWS troubleshooting (IAM, networking, logs) without panic

## Sample session agenda (60–90 min)

1. **Warm-up (10 min)** — Your goals (job hunt, on-call readiness, side project). Quick skill map.
2. **Terraform walkthrough (20 min)** — Open `terraform/main.tf`: resources, variables, outputs. Discuss state locking and why `plan` before `apply`.
3. **CI together (15 min)** — Trace `ci/github-actions-ci.yml` (copy into `.github/workflows/` when you have workflow scope). Add a cheap check (fmt/validate) and talk about secrets vs OIDC.
4. **Containers (15 min)** — Build/run with the Dockerfile + Compose. Contrast with the K8s Deployment in `k8s/`.
5. **Interview drill (15–20 min)** — Whiteboard: “Deploy a static site to S3 + CloudFront” or “Debug CrashLoopBackOff.” Feedback on clarity under time pressure.
6. **Homework** — One small PR to this repo (or your fork): add a Terraform variable, a workflow step, or a readiness probe.

## Suggested learning path (longer mentorship)

Week 1–2: Terraform fundamentals + AWS networking  
Week 3–4: CI/CD patterns (GitHub Actions / GitLab CI)  
Week 5–6: Docker hardening + K8s basics  
Week 7+: Mock interviews and production incident playbooks  

Ready to go deeper? Book a Codementor session and bring your target job description or a stuck pipeline — we’ll work through it live.
