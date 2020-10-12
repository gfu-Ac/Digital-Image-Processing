This package includes the Matlab code that implements the method for tissue segmentation and bias field correction in Chunming Li et al's paper:
    "Multiplicative intrinsic component optimization (MICO) for MRI bias field estimation and tissue segmentation", Magnetic Resonance Imaging, vol. 32 (7), pp. 913-923, 2014
 这个软件包包括了在李春明等人的论文中实现组织分割和偏置场校正方法的Matlab代码:
  “用于磁共振成像偏置场估计和组织分割的乘法内禀成分优化(MICO)”，磁共振成像，第32卷(7)，第913-923页，2014年

Author: Chunming Li, all rights reserved
E-mail: li_chunming@hotmail.com
URL:  http://imagecomputing.org/~cmli/

This package includes two folders: MICO_2D and MICO_3D.
这个包包括两个文件夹:MICO_2D和MICO_3D。

The folder MICO_2D includes the Matlab code for 2D MICO and some 2D test images. 
文件夹MICO_2D包括2D MICO和一些2D测试图像的Matlab代码。

The folder MICO_3D includes the following files:
1. Matlab code for 3D MICO.
2. Two 3D images in Nifti format. 
3. Some Matlab code for reading and saving images in Nifti format.
MICO_3D文件夹包括以下文件:
1.3D MICO的Matlab代码。
2.两张Nifti格式的3D图像。
3.一些用于读取和保存Nifti格式图像的Matlab代码。

Usage for 3D MICO
Input: 
      images in nifti format.
Output: 
      The results of segmentation and bias field correction in two files in nifti format: the       segmented image and the bias field corrected image are saved as nifti files with postfixes       "_seg" and "_bc", respectively. 
3D MICO的用法
输入:
nifti格式的图像。
输出:
在nifti格式的两个文件中的分割和偏置场校正的结果:分割图像和偏置场校正图像被分别保存为带有后缀“_seg”和“_bc”的nifti文件。

Note: For visualization, the code only shows the result for one of the 2D slices, although it performs 3D segmentation and bias field estimation/correction.
注意:对于可视化，代码仅显示一个2D切片的结果，尽管它执行3D分割和偏置场估计/校正。
   





