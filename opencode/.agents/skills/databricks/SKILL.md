---
name: databricks
description: >
  Databricks platform interaction skill. Use for checking job status, triggering runs,
  inspecting pipelines, viewing cluster state, and diagnosing run failures via the
  Databricks CLI. Triggers: Databricks jobs, pipelines, clusters, run status, job failures,
  Spark Declarative Pipelines, workspace automation.
---

# Databricks Skill

Interact with the Databricks platform using the Databricks CLI. This skill orchestrates platform operations: checking job status, triggering runs, inspecting pipelines, and diagnosing failures.

## When to use this skill
- Checking job status or listing jobs
- Triggering a job run or pipeline run
- Inspecting run output, logs, or failure details
- Viewing cluster state
- Any Databricks platform operation

## Subagent

Use `databricks` as a subagent via the Task tool for all Databricks CLI operations. The subagent has `bash: databricks *` permission and runs commands safely.

```bash
# Dispatch the subagent
Task(subagent_type="databricks", description="List all jobs", prompt="List all Databricks jobs with their IDs and names. Use --output json for machine-readable output.")
```

## Direct CLI usage
When a quick check is needed and the subagent would be overkill, run databricks commands directly:

```bash
# Quick check: list jobs
databricks jobs list --output json

# Quick check: get a specific job
databricks jobs get <JOB_ID> --output json

# Quick check: check a run status
databricks jobs get-run <RUN_ID> --output json
```

## Common tasks

### Check all jobs and their latest status
Dispatch `databricks` subagent:
1. List all jobs
2. For each job, fetch the latest run
3. Report state (RUNNING, SUCCEEDED, FAILED, PENDING)

### Trigger a job and monitor it
1. `databricks jobs run-now <JOB_ID> --output json`  (or dispatch subagent)
2. Extract the `run_id` from the response
3. Poll: `databricks jobs get-run <RUN_ID> --output json`
4. Report final status and output

### Diagnose a failed run
1. Get run details: `databricks jobs get-run <RUN_ID> --output json`
2. Get run output: `databricks jobs get-run-output <RUN_ID> --output json`
3. Look at `state.state_message` for the error
4. Check task-level errors in the JSON response

### View running clusters
```bash
databricks clusters list --cluster-states RUNNING --output json
```

## Profile management
The `~/.databrickscfg` file contains authentication profiles:
```bash
databricks jobs list --profile <profile> --output json
```

If no config exists, tell the user to run `databricks configure`.

## Command reference

| Operation | Command |
|-----------|---------|
| List jobs | `databricks jobs list --output json` |
| Get job | `databricks jobs get <ID> --output json` |
| Run job | `databricks jobs run-now <ID> --output json` |
| Get run | `databricks jobs get-run <ID> --output json` |
| Get run output | `databricks jobs get-run-output <ID> --output json` |
| Cancel run | `databricks jobs cancel-run <ID>` |
| List runs | `databricks jobs list-runs <JOB_ID> --output json` |
| List pipelines | `databricks pipelines list-pipelines --output json` |
| Run pipeline | `databricks pipelines run <ID> --output json` |
| Pipeline history | `databricks pipelines history <ID> --output json` |
| List clusters | `databricks clusters list --output json` |
| Get cluster | `databricks clusters get <ID> --output json` |
