# science_presentation_20220305

Presentation of my scientific work at 2022-03-05

## Goal

Accurate quantitative trait prediction

## Results

### An example 

[show fam, bed, bim]

![](richel_issue_140.png)

### 1 SNP contributing to 1 trait

Here is a reasonable prediction, would it be real data:

![](richel_issue_126.png)

PLINK will find the SNP that has an effect.

### 1 SNP contributing to 1 trait, 1000 SNPs having no effect

Adding 1000 SNPs that do nothing, however, kills GCAE:

![](richel_issue_127.png)

PLINK will find the SNP that has an effect.

### 1000 SNPs contributing to 1 trait

Adding 999 SNPs that are additive as well, also, kills GCAE:

![](richel_issue_106.png)

Note that PLINK will also fail to detect each SNP having an effect.


