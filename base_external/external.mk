cat > base_external/external.mk <<'EOF'
# Pull in all package .mk files under this external tree
include $(sort $(wildcard $(BR2_EXTERNAL_PROJECT_BASE_PATH)/package/*/*.mk))
EOF
