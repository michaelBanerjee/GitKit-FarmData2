#!/usr/bin/env bash

# shellcheck disable=SC2016
cat <<'EOF'
#!/usr/bin/env bash

GIT_COMMAND="$(which git)"
export GIT_COMMAND

GIT_SUB_SHIMS="/home/student/GitKit-FarmData2/.kit/features/8-git-shim/sub-shims"
export GIT_SUB_SHIMS

git() {
    local SUB_COMMAND
    SUB_COMMAND="$1"

    PRE_SUB_COMMAND="/home/student/GitKit-FarmData2/.kit/features/8-git-shim/sub-shims/pre-${SUB_COMMAND}"
    if [ -x "$PRE_SUB_COMMAND" ] ; then
        "$PRE_SUB_COMMAND" "$@" || return 1
    fi

    "$GIT_COMMAND" "$@"
}
EOF
