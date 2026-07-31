#!/usr/bin/env bash
set -euo pipefail

script_dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$script_dir/.."
source "$script_dir/common_uv.sh"

ensure_uv
sync_uv

mkdir -p tests/report/test_reports tests/report/cov

uv run pytest tests/ \
  --html=tests/report/test_reports/full_test_report.html --self-contained-html \
  --cov=src \
  --cov-report=html:tests/report/cov/htmlcov \
  --cov-report=xml:tests/report/cov/coverage.xml \
  --cov-report=json:tests/report/cov/coverage.json \
  --maxfail=5 \
  --tb=short
