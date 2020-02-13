#!/bin/bash
root=/home/lincoln/kaggle-rsna-intracranial-hemorrhage/
cd $root

#python -m src.postprocess.make_submission --inputs "['./meta/meta100_lgb.pkl', './meta/meta100_cat.pkl', './meta/meta100_xgb.pkl']" --output ./submission/sub001.csv
# python -m src.postprocess.make_submission --inputs "['./meta/meta100_cat.pkl', './meta/meta100_xgb.pkl']" --output ./submission/sub002.csv
# python -m src.postprocess.make_submission --inputs "['./meta/meta100_lgb.pkl', './meta/meta100_xgb.pkl']" --output ./submission/sub003.csv
# python -m src.postprocess.make_submission --inputs "['./meta/meta100_lgb.pkl', './meta/meta100_cat.pkl']" --output ./submission/sub004.csv

python -m src.postprocess.make_submission --inputs "['./meta/meta110_lgb.pkl', './meta/meta110_cat.pkl', './meta/meta110_xgb.pkl']" --output ./submission/sub005.csv
python -m src.postprocess.make_submission --inputs "['./meta/meta110_cat.pkl', './meta/meta110_xgb.pkl']" --output ./submission/sub006.csv
python -m src.postprocess.make_submission --inputs "['./meta/meta110_lgb.pkl', './meta/meta110_xgb.pkl']" --output ./submission/sub007.csv
python -m src.postprocess.make_submission --inputs "['./meta/meta110_lgb.pkl', './meta/meta110_cat.pkl']" --output ./submission/sub008.csv

python -m src.postprocess.make_submission --inputs "['./meta/meta120_lgb.pkl', './meta/meta120_cat.pkl', './meta/meta120_xgb.pkl']" --output ./submission/sub009.csv
python -m src.postprocess.make_submission --inputs "['./meta/meta120_cat.pkl', './meta/meta120_xgb.pkl']" --output ./submission/sub010.csv
python -m src.postprocess.make_submission --inputs "['./meta/meta120_lgb.pkl', './meta/meta120_xgb.pkl']" --output ./submission/sub011.csv
python -m src.postprocess.make_submission --inputs "['./meta/meta120_lgb.pkl', './meta/meta120_cat.pkl']" --output ./submission/sub012.csv

#kaggle competitions submit rsna-intracranial-hemorrhage-detection -m "" -f ./submission/sub001.csv
