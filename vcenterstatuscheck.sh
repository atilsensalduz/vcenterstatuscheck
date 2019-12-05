#!/bin/bash
vcenters="https://vcenter1 https://vcenter2 https://vcenter3"
for x in $vcenters
do
   status_code=$(curl --write-out %{http_code} --silent -k --output /dev/null $x)
        if [[ "$status_code" -ne 200 ]] ; then
                echo "vcenter http status code = $status_code" | mailx -s "$x vcenter not reachable" -r "vcentertatus@example.com" recipient@example.com
        fi
done
