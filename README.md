# g505s-atombios
AMD AtomBIOS video bios releases for G505S Integrated HD-8650G and discrete HD-8570M / R5-M230 GPUs

- [Description](#description)
- [ROMs table with download links](#roms-table-with-download-links)
  - [ROMs table notes](#roms-table-notes)
  - [ROMs SHA-256 checksums](#roms-sha-256-checksums)
- [coreboot.rom operations](#corebootrom-operations)

## Description

<samp>coreboot wiki describes 5 different ways of extracting the VGABIOS ROMs:  
https://www.coreboot.org/VGA_support#How_to_retrieve_a_good_video_bios  
And all these ways have been tried and found unsuitable for Lenovo G505S:  
https://mail.coreboot.org/pipermail/coreboot/2017-July/084660.html  
This message above - also describes a new method which really works!  </samp>  

<samp>Sadly this new method is Windows-only, but we believe it is a fine approach,  
because: two ROMs for integrated GPU, while got at these very different OS,  
are exactly the same - and most likely it is the same situation for discrete ROM  
Aside from purely ethical concerns, in practice it should not matter if you are  
using closed-source Windows instead of open-source Linux to extract the ROMs</samp>  

<samp>But, to ensure that Windows could not receive the instructions from evil server  
to stealthily modify the extracted ROMs, these conditions should be fulfilled:  </samp>  

<samp>**1)** OS: clean install of Windows 7 Ultimate SP1 x64 without any spying updates  
*(WiFi card removed before installation and OS never connected to the Internet)*  
on a hard drive that has been securely formatted or never used by Windows before  
*^ same requirement for a media which you are using to bring the drivers/software*  </samp>  

<samp>**2)** Proprietary UEFI/BIOS and KB9012 firmware: clean binaries flashed,  
*(part of g505s-proprietary repository)* without any IDs or serial numbers  </samp>  

<samp>**3)** After the extraction, the ROMs should be directly brought to Linux OS  </samp>  

<samp>All these conditions, as well as some others, have been fulfilled by us  
before the extraction of these ROMs. Please use Linux OS to download and  
make sure that their SHA-256 checksums are correct before using them  </samp>  

## ROMs table with download links

<samp>G505S version \ GPU model</samp> | <samp>Integrated HD-8650G</samp> | <samp>Discrete (HD-8570M / R5-M230)</samp> |
---------------------------------------- | ------- | -------- |
<samp>G505S without discrete</samp> | <samp>[pci1002,990b.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_without_discrete/pci1002,990b.rom) (R5's)</samp> | <samp>N/A</samp> | 
<samp>G505S with discrete HD-8570M</samp> | <samp>[pci1002,990b.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_HD-8570M/pci1002,990b.rom) (HD's)</samp> | <samp>[pci1002,6663.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_HD-8570M/pci1002,6663.rom)</samp> |
<samp>G505S with discrete R5-M230</samp> | <samp>[pci1002,990b.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_R5-M230/pci1002,990b.rom) (R5's)</samp> | <samp>[pci1002,6665.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_R5-M230/pci1002,6665.rom)</samp> |

### ROMs table notes

<samp>**1)** Versions of G505S with discrete HD-8570M and R5-M230  
have the different ROMs for Integrated HD-8650G  </samp>  

<samp>**2)** Most likely, both R5's and HD's Integrated ROMs could be used  
for G505S without discrete. I put R5's version of this ROM to  
"G505S without discrete" row, but could have put HD's version  </samp>  

<samp>**3)** Turning ON/OFF the Dual Graphics before the extraction -  
does not affect any of these ROMs  </samp>  

### ROMs SHA-256 checksums

<samp>Filename</samp> | <samp>SHA-256 checksum</samp> |
----------------------|------------------|
<samp>[pci1002,990b.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_HD-8570M/pci1002,990b.rom) (HD's)</samp> | <samp>a928af5b129fe13c5a0032a28e387edf238198b8ce56fc076c580427cbf8835c</samp> |
<samp>[pci1002,6663.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_HD-8570M/pci1002,6663.rom)</samp> | <samp>6052b5def3fda2a93f6c4d55ec91b819429e212e26cdb8e0fcca54599c9c92ed</samp> |
<samp>[pci1002,990b.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_R5-M230/pci1002,990b.rom) (R5's)</samp> | <samp>6104e6989ea3f494d7bfa30573bf38e830f1068bab9980caec5e890e0ccbfced</samp> |
<samp>[pci1002,6665.rom](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/G505S_with_discrete_R5-M230/pci1002,6665.rom)</samp> | <samp>15d74515332bc512de66e0dc910d8600aeb134bf715bbc34a4faac0257f4a0dc</samp> |

## coreboot.rom operations

<samp>Run [./cbfstool.sh](https://github.com/g505s-opensource-researcher/g505s-atombios/raw/master/cbfstool.sh) script to download and build cbfstool,  
https://mail.coreboot.org/pipermail/coreboot/2017-July/084671.html  
Then use one of these commands: </samp>  

<samp>**1)** Adding VGABIOS to coreboot.rom  </samp>  

`./util/cbfstool/cbfstool $COREBOOT_ROM_PATH add -f $VGABIOS_PATH -n pci****,****.rom -t optionrom`

<samp>**2)** Removing VGABIOS from coreboot.rom  </samp>  

`./util/cbfstool/cbfstool $COREBOOT_ROM_PATH remove -n pci****,****.rom`

<samp>**3)** Printing coreboot.rom memory map  </samp>  

`./util/cbfstool/cbfstool $COREBOOT_ROM_PATH print`
