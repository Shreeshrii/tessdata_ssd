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

#### 800 iterations - char train=0.273%, word train=3.47%, word train=0%

* [Download best version - 10.8 MB](). use with `-l ssd`.
* [Download fast version - 1.38 MB](). use with `-l ssd_int`.
* [Download older best version - 10.MB](). use with `-l 7seg`.
