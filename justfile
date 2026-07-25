set quiet

[private]
default:
	{{just_executable()}} --list --unsorted --no-aliases

test dry:
    MICROCAGE_WORK_COUNT=100000 \
    ./microcage \
        --cpu-id 2 \
        --iterations-count 3 \
        --redirect-stdout \
        --redirect-stderr \
        --output-path ./output/ \
        --exit-code worst \
        --move-irqs \
        --disable-boost \
        --thp never \
        --move-workqueues \
        {{ if dry == "dry" { "--dry-run" } else { "" }}} \
        -- \
        ./test
