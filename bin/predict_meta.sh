predict_meta() {
    oof=$1
    test=$2
    name=$3
    python -u -m src.meta.trainer --inputs-test "${test}" --inputs-oof "${oof}" --output-name ${name} |tee ./meta/${name}.log
}

#experiment 0
########################
oof100="[\
    ['./model/model100/fold0_ep2_valid_tta5.pkl', './model/model100/fold0_ep3_valid_tta5.pkl'],\
]"
test100="[\
    ['./model/model100/fold0_ep2_test_tta5.pkl', './model/model100/fold0_ep3_test_tta5.pkl'],\
]"

oof120="[\
    ['./model/model120/fold2_ep2_valid_tta5.pkl', './model/model120/fold2_ep3_valid_tta5.pkl'],\
]"
test120="[\
    ['./model/model120/fold2_ep2_test_tta5.pkl', './model/model120/fold2_ep3_test_tta5.pkl'],\
]"

oof1="[${oof100}, ${oof120}]"
test1="[${test100}, ${test120}]"

predict_meta "${oof1}" "${test1}" meta100
########################

# oof100="[\
#     ['./model/model100/fold0_ep2_valid_tta5.pkl', './model/model100/fold0_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold1_ep2_valid_tta5.pkl', './model/model100/fold1_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold2_ep2_valid_tta5.pkl', './model/model100/fold2_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold3_ep2_valid_tta5.pkl', './model/model100/fold3_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold4_ep2_valid_tta5.pkl', './model/model100/fold4_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold5_ep2_valid_tta5.pkl', './model/model100/fold5_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold6_ep2_valid_tta5.pkl', './model/model100/fold6_ep3_valid_tta5.pkl'],\
#     ['./model/model100/fold7_ep2_valid_tta5.pkl', './model/model100/fold7_ep3_valid_tta5.pkl'],\
# ]"
# test100="[\
#     ['./model/model100/fold0_ep2_test_tta5.pkl', './model/model100/fold0_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold1_ep2_test_tta5.pkl', './model/model100/fold1_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold2_ep2_test_tta5.pkl', './model/model100/fold2_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold3_ep2_test_tta5.pkl', './model/model100/fold3_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold4_ep2_test_tta5.pkl', './model/model100/fold4_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold5_ep2_test_tta5.pkl', './model/model100/fold5_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold6_ep2_test_tta5.pkl', './model/model100/fold6_ep3_test_tta5.pkl'],\
#     ['./model/model100/fold7_ep2_test_tta5.pkl', './model/model100/fold7_ep3_test_tta5.pkl'],\
# ]"

# oof110="[\
#     ['./model/model110/fold0_ep2_valid_tta5.pkl', './model/model110/fold0_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold1_ep2_valid_tta5.pkl', './model/model110/fold1_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold2_ep2_valid_tta5.pkl', './model/model110/fold2_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold3_ep2_valid_tta5.pkl', './model/model110/fold3_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold4_ep2_valid_tta5.pkl', './model/model110/fold4_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold5_ep2_valid_tta5.pkl', './model/model110/fold5_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold6_ep2_valid_tta5.pkl', './model/model110/fold6_ep3_valid_tta5.pkl'],\
#     ['./model/model110/fold7_ep2_valid_tta5.pkl', './model/model110/fold7_ep3_valid_tta5.pkl'],\
# ]"
# test110="[\
#     ['./model/model110/fold0_ep2_test_tta5.pkl', './model/model110/fold0_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold1_ep2_test_tta5.pkl', './model/model110/fold1_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold2_ep2_test_tta5.pkl', './model/model110/fold2_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold3_ep2_test_tta5.pkl', './model/model110/fold3_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold4_ep2_test_tta5.pkl', './model/model110/fold4_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold5_ep2_test_tta5.pkl', './model/model110/fold5_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold6_ep2_test_tta5.pkl', './model/model110/fold6_ep3_test_tta5.pkl'],\
#     ['./model/model110/fold7_ep2_test_tta5.pkl', './model/model110/fold7_ep3_test_tta5.pkl'],\
# ]"


# oof1="[${oof100}, ${oof110}]"
# test1="[${test100}, ${test110}]"

# predict_meta "${oof1}" "${test1}" meta100

