# Note, this script has to be run on celliwig (or wherever webtasks is hosted) to access the raw sqlite dbs
# and as chad-upload to write as the 
# Currently set up with a cronjob

singularity run \
  --bind /var/www/www_root:/var/www/www_root \
  --bind /study/chad:/study/chad \
  --app Rscript r.sif sqlite_to_csv.R \
  /var/www/www_root/2021/chad/ashar/data/data.sqlite /study/chad/raw-data/behavioral/ashar/data.csv

singularity run \
  --bind /var/www/www_root:/var/www/www_root \
  --bind /study/chad:/study/chad \
  --app Rscript r.sif sqlite_to_csv.R \
  /var/www/www_root/2021/chad/pp/data/data.sqlite /study/chad/raw-data/behavioral/biat/data.csv
