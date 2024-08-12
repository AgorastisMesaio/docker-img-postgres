#!/usr/bin/env sh

# Test PostgreSQL with its own tools
echo -n "Test PostgreSQL"
export ERR_MSG="Error testing PostgreSQL"
pg_isready > /dev/null 2>&1 || { ret=${?}; echo " - ${ERR_MSG}, return code: ${ret}"; exit ${ret}; }
echo " Ok."

# All passed
exit 0
