import cv2
cv2.setNumThreads(0) # fix potential pytorch worker issues

import os
print("---------------------------------")
print("current work directory is:")
print(os.getcwd())
print("---------------------------------")