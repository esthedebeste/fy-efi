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
const EFI_MEMORY_UC = 0x00001
const EFI_MEMORY_WC = 0x00002
const EFI_MEMORY_WT = 0x00004
const EFI_MEMORY_WB = 0x00008
const EFI_MEMORY_UCE= 0x00010
const EFI_MEMORY_WP = 0x01000
const EFI_MEMORY_RP = 0x02000
const EFI_MEMORY_XP = 0x04000
const EFI_MEMORY_NV = 0x08000
const EFI_MEMORY_MORE_RELIABLE = 0x10000
const EFI_MEMORY_RO = 0x20000
const EFI_MEMORY_SP = 0x40000
const EFI_MEMORY_CPU_CRYPTO = 0x80000
const EFI_MEMORY_RUNTIME = 0x8000000000000000

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
type EFI_ALLOCATE_PAGES = *fun(Type: EFI_ALLOCATE_TYPE, MemoryType: EFI_MEMORY_TYPE, Pages: UINTN, Memory: *EFI_PHYSICAL_ADDRESS): EFI_STATUS
type EFI_FREE_PAGES = *fun(Memory: EFI_PHYSICAL_ADDRESS, Pages: UINTN): EFI_STATUS
type EFI_GET_MEMORY_MAP = *fun(MemoryMapSize: *UINTN, MemoryMap: *EFI_MEMORY_DESCRIPTOR, MapKey: *UINTN, DescriptorSize: *UINTN, DescriptorVersion: *UINT32): EFI_STATUS
type EFI_ALLOCATE_POOL = *fun(PoolType: EFI_MEMORY_TYPE, Size: UINTN, Buffer: *EFI_PTR_VOID): EFI_STATUS
type EFI_FREE_POOL = *fun(Buffer: EFI_PTR_VOID): EFI_STATUS
