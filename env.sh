set -o allexport

# fill in these variables for your project:
google_project=  # eg. vf-infdev-ca-nonlive
gcs_bucket=  # eg. vf-infdev-ca-nonlive-dev

# do not change these unless you specifically want to use different values in a certain Jenkins build
repo_name=$(basename $(git remote get-url origin) .git)
latest_commit_hash=$(git rev-parse --verify --short=8 HEAD)
parent_commit_hash=$(git rev-parse --verify --short=8 HEAD^)

set +o allexport
