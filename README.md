# tessdata_ssd
Traineddata for Tesseract 4 for recognizing Seven Segment Display

This is a proof of concept traineddata in response to [this post in tesseract-ocr google group](https://groups.google.com/d/msgid/tesseract-ocr/b7fc9a05-8d8d-4e68-ac02-2e71b0078557%40googlegroups.com).

The training text and scripts used are provided for reference. 

Feel free to clone the repo and rerun training with your own custom training_text and fonts.
You will also need files from `tesseract_ocr/langdata` and `tesseract_ocr/tessdata_best`.

### Finetune Plus Training from tessdata_best/eng.traineddata 

Finetune Plus training was done using a training text of 9700+ lines with only numbers and
limited punctuation (. : /) etc.

#### Three Seven Segment Display fonts were used for making synthetic training data.
*  "DB LCD Temp Heavy" \
*  "SF Digital Readout Heavy" \
*  "Seven Segment" \

#### 14000 iterations -  char train=0.186%, word train=0.4%

* [Download best version - 10.7 MB](ssd.traineddata). use with `-l ssd`.
* [Download fast/integer version - 1.37 MB](ssd_int.traineddata). use with `-l ssd_int`.

* [Download older best version - 10.9 MB](7seg.traineddata). use with `-l 7seg`.


#### Evaluation 

Evaluation was done using synthetic data generated using an evaluation text of over 440 lines 
with only numbers and limited punctuation (. : /) using same 3 fonts.

Test of a small sample of real life images gives better results with the older 7seg.traineddata.
See https://github.com/Shreeshrii/tessdata_ssd/issues/1 for details

### Other SSD Projects (I have not tried them)


* https://www.unix-ag.uni-kl.de/~auerswal/ssocr/ 
* https://github.com/auerswal/ssocr

* https://github.com/arturaugusto/display_ocr

