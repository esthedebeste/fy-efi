include "../common"
const TPL_APPLICATION = 4
const TPL_CALLBACK = 8
const TPL_NOTIFY = 16
const TPL_HIGH_LEVEL = 31
type EFI_RAISE_TPL = *fun(NewTpl: EFI_TPL): EFI_TPL
type EFI_RESTORE_TPL = *fun(OldTpl: EFI_TPL): {} // void
