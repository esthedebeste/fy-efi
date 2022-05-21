include "../common"
include "../../protocols/device-path"

type EFI_IMAGE_LOAD = *fun cc(EFIAPI) (BootPolicy: BOOLEAN, ParentImageHandle: EFI_HANDLE, DevicePath: EFI_DEVICE_PATH_PROTOCOL,
						   SourceBuffer: EFI_PTR_VOID, SourceSize: UINTN, ImageHandle: *EFI_HANDLE): EFI_STATUS
type EFI_IMAGE_START = *fun cc(EFIAPI) (ImageHandle: EFI_HANDLE, ExitDataSize: *UINTN, ExitData: **CHAR16): EFI_STATUS
type EFI_EXIT = *fun cc(EFIAPI) (ImageHandle: EFI_HANDLE, ExitStatus: EFI_STATUS, ExitDataSize: UINTN, ExitData: *CHAR16): EFI_STATUS
type EFI_IMAGE_UNLOAD = *fun cc(EFIAPI) (ImageHandle: EFI_HANDLE): EFI_STATUS
type EFI_EXIT_BOOT_SERVICES = *fun cc(EFIAPI) (ImageHandle: EFI_HANDLE, MapKey: UINTN): EFI_STATUS
