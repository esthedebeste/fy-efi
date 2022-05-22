include "./common"
type EFI_VIRTUAL_ADDRESS = UINT64
type EFI_PHYSICAL_ADDRESS = UINT64

type EFI_ALLOCATE_TYPE = int32 // C enum
	const AllocateAnyPages   = 0
	const AllocateMaxAddress = 1
	const AllocateAddress    = 2
	const MaxAllocateType    = 3

type EFI_MEMORY_TYPE = int32 // C enum
	const EfiReservedMemoryType = 0
	const EfiLoaderCode = 1
	const EfiLoaderData = 2
	const EfiBootServicesCode = 3
	const EfiBootServicesData = 4
	const EfiRuntimeServicesCode = 5
	const EfiRuntimeServicesData	= 6
	const EfiConventionalMemory = 7
	const EfiUnusableMemory = 8
	const EfiACPIReclaimMemory = 9
	const EfiACPIMemoryNVS = 10
	const EfiMemoryMappedIO = 11
	const EfiMemoryMappedIOPortSpace = 12
	const EfiPalCode = 13
	const EfiPersistentMemory = 14
	const EfiUnacceptedMemoryType = 15
	const EfiMaxMemoryType = 16

struct EFI_MEMORY_DESCRIPTOR {
	Type: UINT32,
	PhysicalStart: EFI_PHYSICAL_ADDRESS,
	VirtualStart: EFI_VIRTUAL_ADDRESS,
	NumberOfPages: UINT64,
	Attribute: UINT64,
}
// bitflags for EFI_MEMORY_DESCRIPTOR.Attribute
const EFI_MEMORY_UC: UINT64  = 0x00001l
const EFI_MEMORY_WC: UINT64  = 0x00002l
const EFI_MEMORY_WT: UINT64  = 0x00004l
const EFI_MEMORY_WB: UINT64  = 0x00008l
const EFI_MEMORY_UCE: UINT64 = 0x00010l
const EFI_MEMORY_WP: UINT64  = 0x01000l
const EFI_MEMORY_RP: UINT64  = 0x02000l
const EFI_MEMORY_XP: UINT64  = 0x04000l
const EFI_MEMORY_NV: UINT64  = 0x08000l
const EFI_MEMORY_MORE_RELIABLE: UINT64 = 0x10000l
const EFI_MEMORY_RO: UINT64 = 0x20000l
const EFI_MEMORY_SP: UINT64 = 0x40000l
const EFI_MEMORY_CPU_CRYPTO: UINT64 = 0x80000l
const EFI_MEMORY_RUNTIME: UINT64 = 0x8000000000000000l

struct EFI_MEMORY_ATTRIBUTES_TABLE {
	Version: UINT32,
	NumberOfEntries: UINT32,
	DescriptorSize: UINT32,
	Reserved: UINT32,
	Entry: EFI_MEMORY_DESCRIPTOR[0], // unbound array
}

struct EFI_MEMORY_RANGE {
	Address: EFI_PHYSICAL_ADDRESS,
	Length: UINT64,
}

const EFI_PAGE_SIZE = 4096 // Pages are 4KiB
type EFI_ALLOCATE_PAGES = *fun cc(EFIAPI) (Type: EFI_ALLOCATE_TYPE, MemoryType: EFI_MEMORY_TYPE, Pages: UINTN, Memory: *EFI_PHYSICAL_ADDRESS): EFI_STATUS
type EFI_FREE_PAGES = *fun cc(EFIAPI) (Memory: EFI_PHYSICAL_ADDRESS, Pages: UINTN): EFI_STATUS
type EFI_GET_MEMORY_MAP = *fun cc(EFIAPI) (MemoryMapSize: *UINTN, MemoryMap: *EFI_MEMORY_DESCRIPTOR, MapKey: *UINTN, DescriptorSize: *UINTN, DescriptorVersion: *UINT32): EFI_STATUS
type EFI_ALLOCATE_POOL = *fun cc(EFIAPI) (PoolType: EFI_MEMORY_TYPE, Size: UINTN, Buffer: *EFI_PTR_VOID): EFI_STATUS
type EFI_FREE_POOL = *fun cc(EFIAPI) (Buffer: EFI_PTR_VOID): EFI_STATUS
