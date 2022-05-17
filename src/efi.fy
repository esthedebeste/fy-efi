include "./common"
include "./status"
include "./system-table"

type EFI_IMAGE_ENTRY_POINT = fun(EFI_HANDLE, *EFI_SYSTEM_TABLE): EFI_STATUS
