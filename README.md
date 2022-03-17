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


### Gradient

### Model p0

![](richel_issue_144_p0_0.png)

> 0 noise, p0

![](richel_issue_144_p0_1.png)

> 1 noise, p0

![](richel_issue_144_p0_2.png)

> 2 noise, p0

![](richel_issue_144_p0_3.png)

> 3 noise, p0

![](richel_issue_144_p0_4.png)

> 4 noise, p0

![](richel_issue_144_p0_5.png)

> 5 noise, p0

![](richel_issue_144_p0_6.png)

> 6 noise, p0

![](richel_issue_144_p0_7.png)

> 7 noise, p0

![](richel_issue_144_p0_8.png)

> 8 noise, p0

![](richel_issue_144_p0_9.png)

> 9 noise, p0

![](richel_issue_144_p0_10.png)

> 10 noise, p0

### Model p1

![](richel_issue_144_p1_0.png)

> 0 noise, p1

![](richel_issue_144_p1_1.png)

> 1 noise, p1

![](richel_issue_144_p1_2.png)

> 2 noise, p1

![](richel_issue_144_p1_3.png)

> 3 noise, p1

![](richel_issue_144_p1_4.png)

> 4 noise, p1

![](richel_issue_144_p1_5.png)

> 5 noise, p1

![](richel_issue_144_p1_6.png)

> 6 noise, p1

![](richel_issue_144_p1_7.png)

> 7 noise, p1

![](richel_issue_144_p1_8.png)

> 8 noise, p1

![](richel_issue_144_p1_9.png)

> 9 noise, p1

![](richel_issue_144_p1_10.png)

> 10 noise, p1

### Model p2

![](richel_issue_144_p2_0.png)

> 0 noise, p2

![](richel_issue_144_p2_1.png)

> 1 noise, p2

![](richel_issue_144_p2_2.png)

> 2 noise, p2

![](richel_issue_144_p2_3.png)

> 3 noise, p2

![](richel_issue_144_p2_4.png)

> 4 noise, p2

![](richel_issue_144_p2_5.png)

> 5 noise, p2

![](richel_issue_144_p2_6.png)

> 6 noise, p2

![](richel_issue_144_p2_7.png)

> 7 noise, p2

![](richel_issue_144_p2_8.png)

> 8 noise, p2

![](richel_issue_144_p2_9.png)

> 9 noise, p2

![](richel_issue_144_p2_10.png)

> 10 noise, p2

### Real data

![](richel_issue_129.png)

> NSPHS, 1k SNPs

![](richel_issue_136.png)

> NSPHS, 10k SNPs


