include "../common"
include "./locate"

type EFI_PROTOCOLS_PER_HANDLE = *fun cc(EFIAPI) (Handle: EFI_HANDLE, ProtocolBuffer: ***EFI_GUID, ProtocolBufferCount: *UINTN): EFI_STATUS
type EFI_LOCATE_HANDLE_BUFFER = *fun cc(EFIAPI) (SearchType: EFI_LOCATE_SEARCH_TYPE, Protocol: *EFI_GUID, SearchKey: EFI_PTR_VOID, NoHandles: *UINTN, Buffer: **EFI_HANDLE): EFI_STATUS
type EFI_LOCATE_PROTOCOL = *fun cc(EFIAPI) (Protocol: *EFI_GUID, Registration: EFI_PTR_VOID, Interface: *EFI_PTR_VOID): EFI_STATUS
type EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES = *fun cc(EFIAPI) (Handle: *EFI_HANDLE, __VARARG__): EFI_STATUS
type EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES = *fun cc(EFIAPI) (Handle: EFI_HANDLE, __VARARG__): EFI_STATUS
