include "../common"
include "../protocols/device-path"

type EFI_IMAGE_LOAD = *fun(BootPolicy: BOOLEAN, ParentImageHandle: EFI_HANDLE, DevicePath: EFI_DEVICE_PATH_PROTOCOL,
						   SourceBuffer: EFI_PTR_VOID, SourceSize: UINTN, ImageHandle: *EFI_HANDLE): EFI_STATUS
type EFI_IMAGE_START = *fun(ImageHandle: EFI_HANDLE, ExitDataSize: *UINTN, ExitData: **CHAR16): EFI_STATUS
type EFI_EXIT = *fun(ImageHandle: EFI_HANDLE, ExitStatus: EFI_STATUS, ExitDataSize: UINTN, ExitData: *CHAR16): EFI_STATUS
type EFI_IMAGE_UNLOAD = *fun(ImageHandle: EFI_HANDLE): EFI_STATUS
type EFI_EXIT_BOOT_SERVICES = *fun(ImageHandle: EFI_HANDLE, MapKey: UINTN): EFI_STATUS
