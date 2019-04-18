#!/bin/bash

###rm -rf ./ssd_num
###time ~/tesseract/src/training/tesstrain.sh \
###  --fonts_dir ~/.fonts/ssd \
###  --lang eng --linedata_only \
###  --noextract_font_properties \
###  --langdata_dir ~/langdata \
###  --tessdata_dir ~/tessdata_best \
###  --fontlist \
###  "DB LCD Temp Heavy" \
###  "SF Digital Readout Heavy" \
###  "Seven Segment" \
###  --training_text ./eng.ssd.num.training_text \
###  --save_box_tiff \
###  --maxpages 0 \
###  --workspace_dir ~/tmp \
###  --output_dir ./ssd_num
###
###  rm -rf ./ssd_eval
###~/tesseract/src/training/tesstrain.sh \
###  --fonts_dir ~/.fonts/ssd \
###  --lang eng --linedata_only \
###  --noextract_font_properties \
###  --langdata_dir ~/langdata \
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

## rm -rf ./ssd_scratch
## mkdir ./ssd_scratch
  
for num_iterations in {5000..20000..1000}; do
lstmtraining \
  --model_output ./ssd_scratch/ssd_scratch \
  --traineddata ./ssd_num/eng/eng.traineddata \
  --net_spec '[1,36,0,1 Ct3,3,16 Mp3,3 Lfys48 Lfx96 Lrx96 Lfx192 O1c1]' \
  --train_listfile ./ssd_num/eng.training_files.txt \
  --eval_listfile ./ssd_eval/eng.training_files.txt \
  --debug_interval 0 \
  --max_iterations $num_iterations
  
OMP_THREAD_LIMIT=1 lstmeval \
  --verbosity 0 \
  --model ./ssd_scratch/ssd_scratch_checkpoint \
  --traineddata ./ssd_num/eng/eng.traineddata \
  --eval_listfile ./ssd_eval/eng.training_files.txt
  
  
lstmtraining \
--stop_training \
  --traineddata ./ssd_num/eng/eng.traineddata \
  --continue_from ./ssd_scratch/ssd_scratch_checkpoint \
  --model_output ./ssd.traineddata
  
  
lstmtraining \
--stop_training \
--convert_to_int \
  --traineddata ./ssd_num/eng/eng.traineddata \
  --continue_from ./ssd_scratch/ssd_scratch_checkpoint \
  --model_output ./ssd_int.traineddata
  
  
done
