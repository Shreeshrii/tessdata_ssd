#!/bin/bash

###rm -rf ./ssd_alphanum
###time ~/tesseract/src/training/tesstrain.sh \
###  --fonts_dir ~/.fonts/ssd \
###  --lang eng --linedata_only \
###  --noextract_font_properties \
###  --langdata_dir ./langdata \
###  --tessdata_dir ~/tessdata_best \
###  --fontlist \
###  "DB LCD Temp Heavy" \
###  "SF Digital Readout Heavy" \
###  "Seven Segment" \
###  --training_text ./eng.ssd.alphanum.training_text \
###  --save_box_tiff \
###  --maxpages 0 \
###  --workspace_dir ~/tmp \
###  --output_dir ./ssd_alphanum
###
###  rm -rf ./ssd_eval
###~/tesseract/src/training/tesstrain.sh \
###  --fonts_dir ~/.fonts/ssd \
###  --lang eng --linedata_only \
###  --noextract_font_properties \
###  --langdata_dir ./langdata \
###  --tessdata_dir ~/tessdata_best \
###  --fontlist \
###  "DB LCD Temp Heavy" \
###  "SF Digital Readout Heavy" \
###  "Seven Segment" \
###  --save_box_tiff \
###  --training_text ./eng.ssd.eval.training_text \
###  --workspace_dir ~/tmp \
###  --output_dir ./ssd_eval
###
###rm -rf ./ssd_from_eng
###mkdir ./ssd_from_eng
###
###combine_tessdata -e ~/tessdata_best/eng.traineddata \
###  ./ssd_from_eng/eng.lstm
  
for num_iterations in {5000..10000..100}; do
lstmtraining \
  --model_output ./ssd_from_eng/ssd_alphanum_plus \
  --traineddata ./ssd_alphanum/eng/eng.traineddata \
  --continue_from ./ssd_from_eng/eng.lstm \
  --old_traineddata ~/tessdata_best/eng.traineddata \
  --train_listfile ./ssd_alphanum/eng.training_files.txt \
  --debug_interval 0 \
  --max_iterations $num_iterations
  
OMP_THREAD_LIMIT=1 lstmeval \
  --model ./ssd_from_eng/ssd_alphanum_plus_checkpoint \
  --traineddata ./ssd_alphanum/eng/eng.traineddata \
  --eval_listfile ./ssd_eval/eng.training_files.txt
  
  
lstmtraining \
--stop_training \
  --traineddata ./ssd_alphanum/eng/eng.traineddata \
  --continue_from ./ssd_from_eng/ssd_alphanum_plus_checkpoint \
  --model_output ./ssd_alphanum_plus.traineddata
  
  
done

  