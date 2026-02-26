#!/bin/sh
set -e

# If API_BASE_URL is set, generate config.js with the value
if [ -n "$API_BASE_URL" ]; then
    cat > /usr/share/nginx/html/config.js <<EOF
window.APP_CONFIG = {
    API_BASE_URL: "${API_BASE_URL}"
};
EOF
    echo "✅ config.js generated with API_BASE_URL=${API_BASE_URL}"
else
    echo "⚠️  API_BASE_URL not set, using default (same-origin)"
fi

# Start Nginx
exec nginx -g 'daemon off;'
