#! /bin/bash
rm -rf camsync || true && mkdir -p camsync
cat > camsync/camsync_result.json << EOF
{"delta_ms":100}
EOF
