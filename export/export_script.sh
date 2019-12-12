#!/bin/bash

function print_stat {
  REF_ALL=`sed -n -E 's/(\[.*\]\(.*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_IMG=`sed -n -E 's/([!]\[.*\]\(.*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_LNK=`sed -n -E 's/([^!]\[.*\]\(.*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_LNK_HTTP=`sed -n -E 's/([^!]\[.*\]\(http.*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_LNK_LOCL=`sed -n -E '/([^!]\[.*\]\(http.*\))/! s/([^!]\[.*\]\(.*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_LNK_LOCL_LHASH=`sed -n -E '/([^!]\[.*\]\(http.*\))/! s/([^!]\[.*\]\(.+#.+\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_LNK_LOCL_HONLY=`sed -n -E '/([^!]\[.*\]\(http.*\))/! s/([^!]\[.*\]\(#.*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  REF_LNK_LOCL_LONLY=`sed -n -E '/([^!]\[.*\]\(http.*\))/! s/([^!]\[.*\]\([^#]*\))/\1/p' export.md | wc -l | awk '{print $1}'`
  DUPL_HEADERS=`sed -n -E 's/^#+(.*)/\1/p' export.md | sort | uniq -id | wc -l | awk '{print $1}'`

  echo ""
  echo "Total references found ${REF_ALL} (${REF_IMG} images, ${REF_LNK} links)"
  echo "- external links: ${REF_LNK_HTTP}"
  echo "- local links: ${REF_LNK_LOCL}"
  echo "--- local links with hash: ${REF_LNK_LOCL_LHASH}"
  echo "--- section hash only: ${REF_LNK_LOCL_HONLY}"
  echo "--- local links only: ${REF_LNK_LOCL_LONLY}"

  if [ "${REF_LNK_LOCL_LONLY}" -gt 0 ]; then
    echo ""
    echo "Warning: Following links will not properly export:"
    sed -n -E '/([^!]\[.*\]\(http.*\))/! s/.*([^!]\[.*\]\([^#]*\)).*/\1/p' export.md
  fi

  if [ "${DUPL_HEADERS}" -gt 0 ]; then
    echo ""
    echo "Warning: Following headers are duplicit and will not properly export:"
    sed -n -E 's/^#+(.*)/\1/p' export.md | sort | uniq -id
  fi
}

echo ""
echo "Merging documentation..."
> export.md
cat export_list | while read in; do cat "$in" >> export.md; echo "" >> export.md; done

print_stat

echo ""
echo "Repairing image location..."
sed -i '' -E 's/\((..\/)*images/(..\/images/' export.md

echo ""
echo "Repairing links location..."
sed -i '' -E '/([^!]\[.*\]\(http.*\))/! s/([^!]\[.*\]\().+(#.+\))/\1\2/' export.md

print_stat
