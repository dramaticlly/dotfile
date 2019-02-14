#!/bin/bash

echo -e "Gathering phonetool information about following people"
if [ -f "./phoneToolAlias" ]; then
	for a in `cat phoneToolAlias`; do kcurl -s https://phonetool.amazon.com/users/$a.json|jq '. | {name: .name, lvl: .job_level, city: .city, hire_date: .                 hire_date_iso}'; done
	return
fi
