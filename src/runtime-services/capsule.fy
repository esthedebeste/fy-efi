include "../common"
include "../memory"
include "./reset" // EFI_RESET_TYPE

struct EFI_CAPSULE_BLOCK_DESCRIPTOR {
	Length: UINT64,
	DataBlockOrContinuationPointer: EFI_PHYSICAL_ADDRESS,
}

struct EFI_CAPSULE_HEADER {
	CapsuleGuid: EFI_GUID,
	HeaderSize: UINT32,
	Flags: UINT32,
	CapsuleImageSize: UINT32,
}
const CAPSULE_FLAGS_PERSIST_ACROSS_RESET  = 0x00010000
const CAPSULE_FLAGS_POPULATE_SYSTEM_TABLE = 0x00020000
const CAPSULE_FLAGS_INITIATE_RESET        = 0x00040000

struct _EFI_CAPSULE_PTR_UNDERLYING_ {
	Header: EFI_CAPSULE_HEADER,
	Capsules: EFI_CAPSULE_BLOCK_DESCRIPTOR[0],
}

struct EFI_MEMORY_RANGE_CAPSULE {
	Header: EFI_CAPSULE_HEADER,
	OsRequestedMemoryType: UINT32,
	NumberOfMemoryRanges: UINT64,
	MemoryRanges: EFI_MEMORY_RANGE[0],
}

struct EFI_MEMORY_RANGE_CAPSULE_RESULT {
	FirmwareMemoryRequirement: UINT64,
	NumberOfMemoryRanges: UINT64,
}

type EFI_UPDATE_CAPSULE = *fun cc(EFIAPI) (CapsuleHeaderArray: **EFI_CAPSULE_HEADER, CapsuleCount: UINTN, ScatterGatherList: EFI_PHYSICAL_ADDRESS): EFI_STATUS
type EFI_QUERY_CAPSULE_CAPABILITIES = *fun cc(EFIAPI) (CapsuleHeaderArray: **EFI_CAPSULE_HEADER, CapsuleCount: UINTN, MaximumCapsuleSize: *UINT64, ResetType: *EFI_RESET_TYPE): EFI_STATUS
