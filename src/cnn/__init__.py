import cv2
cv2.setNumThreads(0) # fix potential pytorch worker issues

import os
print(os.getcwd())