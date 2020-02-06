FROM nvcr.io/nvidia/pytorch:18.12-py3

# RUN pip install albumentations==0.4.3
# RUN pip install pretrainedmodels==0.7.4
# RUN pip install pandas
# RUN pip install sklearn
# RUN pip install pydicom
# RUN pip install addict
RUN pip uninstall -y apex pytorch torchvision
RUN conda install -y pytorch torchvision cudatoolkit=10.0 -c pytorch
RUN git clone https://github.com/NVIDIA/apex.git && cd apex && pip install -v --no-cache-dir --global-option="--cpp_ext" --global-option="--cuda_ext" .
RUN pip install Pillow==6.1
RUN pip install opencv-python
RUN pip install pandas
RUN pip install sklearn
RUN pip install pydicom
RUN pip install addict
RUN pip install albumentations==0.4.3
RUN pip install pretrainedmodels==0.7.4