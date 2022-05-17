include "../common"
include "../status"

type EFI_RESET_TYPE = int32 // C enum
	const EfiResetCold = 0
	const EfiResetWarm = 1
	const EfiResetShutdown = 2
	const EfiResetPlatformSpecific = 3
type EFI_RESET_SYSTEM = *fun(ResetType: EFI_RESET_TYPE, ResetStatus: EFI_STATUS, DataSize: UINTN, ResetData: EFI_PTR_VOID): {} // does not return
