wget --recursive --no-parent --no-host-directories --cut-dirs=3 \
--user-agent="Mozilla/5.0" --execute robots=off \
https://review.coreboot.org/cgit/coreboot.git/plain/util/cbfstool/

wget --recursive --no-parent --no-host-directories --cut-dirs=3 \
--user-agent="Mozilla/5.0" --execute robots=off \
https://review.coreboot.org/cgit/coreboot.git/plain/src/commonlib/ \
--exclude-directories=/cgit/coreboot.git/plain/src/commonlib/storage/ \
--reject=configstring.c,iobuf.c,cbmem_id.h,configstring.h,coreboot_tables.h,\
fmap_serialized.h,iobuf.h,sd_mmc_ctrlr.h,sdhci.h,stdlib.h,storage.h,\
timestamp_serialized.h

wget --recursive --no-parent --no-host-directories --cut-dirs=3 \
--user-agent="Mozilla/5.0" --execute robots=off \
https://review.coreboot.org/cgit/coreboot.git/plain/src/vendorcode/intel/edk2/uefi_2.4/

wget --recursive --no-parent --no-host-directories --cut-dirs=3 \
--user-agent="Mozilla/5.0" --execute robots=off \
https://review.coreboot.org/cgit/coreboot.git/plain/src/vendorcode/intel/fsp/fsp1_1/IntelFspPkg/Include/FspInfoHeader.h

wget --recursive --no-parent --no-host-directories --cut-dirs=3 \
--user-agent="Mozilla/5.0" --execute robots=off \
--directory-prefix=./3rdparty/vboot/ \
https://review.coreboot.org/cgit/vboot.git/plain/firmware/2lib/ \
--reject=2api.c,2crc8.c,2hmac.c,2misc.c,2nvstorage.c,2rsa.c,2secdata.c,\
2secdatak.c,2stub.c,2tpm_bootmode.c,2crc8.h,2hmac.h,2misc.h,\
2nvstorage_fields.h,2nvstorage.h,2rsa.h,2secdata.h,2tpm_bootmode.h

wget --recursive --no-parent --no-host-directories --cut-dirs=3 \
--user-agent="Mozilla/5.0" --execute robots=off \
--directory-prefix=./3rdparty/vboot/ \
https://review.coreboot.org/cgit/vboot.git/plain/firmware/include/vb2_api.h

cd ./util/cbfstool/

make all
