# Note, this sort of script has to be run on celliwig (or wherever webtasks is hosted) to access the raw sqlite dbs
# and as $STUDY-upload to write to raw-data
#
# probably set up with a cronjob like:
# 15 2 * * * /study/$STUDY/scripts/labjs_downloader/run_script.sh 2>&1 > /dev/null 

STUDY=example

singularity run \
  --bind /var/www/www_root:/var/www/www_root \
  --bind /study/$STUDY:/study/$STUDY \
  --app Rscript r.sif sqlite_to_csv.R \
  /var/path/to/TASK1/data.sqlite /study/$STUDY/raw-data/behavioral/TASK1/data.csv

singularity run \
  --bind /var/www/www_root:/var/www/www_root \
  --bind /study/$STUDY:/study/$STUDY \
  --app Rscript r.sif sqlite_to_csv.R \
  /var/path/to/TASK2/data.sqlite /study/$STUDY/raw-data/behavioral/TASK2/data.csv
