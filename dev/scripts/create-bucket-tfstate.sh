#!/usr/bin/env bash

declare -r BUCKET_URL="gs://${PROJECT_ID}-tfstate"

function create_gcs_bucket() {
    declare project_id="${1}"
    declare bucket_url="${2}"

    echo "Setting up GCS bucket ${bucket_url}."
    gsutil ls "${bucket_url}" >/dev/null 2>&1 || {
        echo "Creating bucket ${bucket_url}."
        gsutil mb -p "${project_id}" "${bucket_url}"
        gsutil versioning set on "${bucket_url}"
    } && {
      echo "Bucket ${bucket_url} already exist."
    }
}

create_gcs_bucket "${PROJECT_ID}" "${BUCKET_URL}"