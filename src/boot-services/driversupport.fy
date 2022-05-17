include "../common"
include "../protocols/device-path"

type EFI_CONNECT_CONTROLLER = *fun(ControllerHandle: EFI_HANDLE, DriverImageHandle: *EFI_HANDLE, RemainingDevicePath: *EFI_DEVICE_PATH_PROTOCOL, Recursive: BOOLEAN): EFI_STATUS
type EFI_DISCONNECT_CONTROLLER = *fun(ControllerHandle: EFI_HANDLE, DriverImageHandle: EFI_HANDLE, ChildHandle: EFI_HANDLE): EFI_STATUS
