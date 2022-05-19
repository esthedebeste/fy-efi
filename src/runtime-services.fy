include "./common"
include "./status"
include "./table-header" // EFI_TABLE_HEADER
include "./memory" // EFI_MEMORY_DESCRIPTOR
include "./runtime-services/time" // EFI_TIME
include "./runtime-services/reset" // EFI_RESET_SYSTEM
include "./runtime-services/capsule" // EFI_UPDATE_CAPSULE EFI_QUERY_CAPSULE_CAPABILITIES

const EFI_RUNTIME_SERVICES_SIGNATURE = 0x56524553544e5552
const EFI_RUNTIME_SERVICES_REVISION  = EFI_SPECIFICATION_VERSION

struct EFI_RUNTIME_SERVICES {
	Hdr: EFI_TABLE_HEADER,
	// Time Services
	GetTime: *fun cc(EFIAPI) (Time: *EFI_TIME, Capabilities: *EFI_TIME_CAPABILITIES): EFI_STATUS,
	SetTime: *fun cc(EFIAPI) (Time: *EFI_TIME): EFI_STATUS,
	GetWakeupTime: *fun cc(EFIAPI) (Enabled: *BOOLEAN, Pending: *BOOLEAN, Time: *EFI_TIME): EFI_STATUS,
	SetWakeupTime: *fun cc(EFIAPI) (Enable: BOOLEAN, Time: *EFI_TIME): EFI_STATUS, // if enable is false, time is ignored (nullable)
	// Virtual Memory Services
	SetVirtualAddressMap: *fun cc(EFIAPI) (MemoryMapSize: UINTN, DescriptorSize: UINTN, DescriptorVersion: UINT32, VirtualMap: *EFI_MEMORY_DESCRIPTOR): EFI_STATUS,
	ConvertPointer: *fun cc(EFIAPI) (DebugDisposition: UINTN, Address: *EFI_PTR_VOID): EFI_STATUS,
	// Variable Services
	GetVariable: *fun cc(EFIAPI) (VariableName: *CHAR16, VendorGuid: *EFI_GUID, Attributes: *UINT32, DataSize: *UINTN, Data: EFI_PTR_VOID): EFI_STATUS,
	GetNextVariableName: *fun cc(EFIAPI) (VariableNameSize: *UINTN, VariableName: *CHAR16, VendorGuid: *EFI_GUID): EFI_STATUS,
	SetVariable: *fun cc(EFIAPI) (VariableName: *CHAR16, VendorGuid: *EFI_GUID, Attributes: UINT32, DataSize: UINTN, Data: EFI_PTR_VOID): EFI_STATUS,
	// Miscellaneous Services
	GetNextHighMonotonicCount: *fun cc(EFIAPI) (HighCount: *UINT32): EFI_STATUS,
	ResetSystem: EFI_RESET_SYSTEM,
	// UEFI 2.0 Capsule Services
	UpdateCapsule: EFI_UPDATE_CAPSULE,
	QueryCapsuleCapabilities: EFI_QUERY_CAPSULE_CAPABILITIES,
	// Miscellaneous UEFI 2.0 Service
	QueryVariableInfo: *fun cc(EFIAPI) (Attributes: UINT32, MaximumVariableStorageSize: *UINT64, RemainingVariableStorageSize: *UINT64, MaximumVariableSize: *UINT64): EFI_STATUS,
}
const EFI_OPTIONAL_PTR = 0b01 // bitflag for ConvertPointer.
