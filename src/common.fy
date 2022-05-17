type BOOLEAN = uint8 // Logical Boolean. 1-byte value containing a 0 for FALSE or a 1 for TRUE.
const EFI_FALSE: BOOLEAN = 0
const EFI_TRUE: BOOLEAN = 1

type INTN = int_ptrsize
type UINTN = uint_ptrsize
type INT8 = int8
type INT16 = int16
type INT32 = int32
type INT64 = int64
type INT128 = int128
type UINT8 = uint8
type UINT16 = uint16
type UINT32 = uint32
type UINT64 = uint64
type UINT128 = uint128

type CHAR8 = uint8
type CHAR16 = uint16
struct __EFI_VOID_PTR_UNDERLYING__ { ______: uint8 }
type EFI_PTR_VOID = *__EFI_VOID_PTR_UNDERLYING__

struct EFI_GUID {
	Data1: UINT32,
	Data2: UINT16,
	Data3: UINT16,
	Data4: UINT8[8],
}
type EFI_STATUS = UINTN
type EFI_HANDLE = EFI_PTR_VOID
type EFI_EVENT = EFI_PTR_VOID
type EFI_LBA = uint64 // logical block address
type EFI_TPL = UINTN // task priority level
type EFI_MAC_ADDRESS = uint8[32] // 32-byte buffer containing a MAC address
type EFI_IPv4_ADDRESS = uint8[4] // 4-byte buffer containing an IPv4 address
type EFI_IPv6_ADDRESS = uint8[16] // 16-byte buffer containing an IPv6 address
type EFI_IP_ADDRESS = uint8[16] // 16-byte buffer containing an IPv4 or IPv6 address

const EFI_2_90_SYSTEM_TABLE_REVISION: UINT64 = 0x2005a // (2<<16) | 90
const EFI_2_80_SYSTEM_TABLE_REVISION: UINT64 = 0x20050 // (2<<16) | 80
const EFI_2_70_SYSTEM_TABLE_REVISION: UINT64 = 0x20046 // (2<<16) | 70
const EFI_2_60_SYSTEM_TABLE_REVISION: UINT64 = 0x2003c // (2<<16) | 60
const EFI_2_50_SYSTEM_TABLE_REVISION: UINT64 = 0x20032 // (2<<16) | 50
const EFI_2_40_SYSTEM_TABLE_REVISION: UINT64 = 0x20028 // (2<<16) | 40
const EFI_2_31_SYSTEM_TABLE_REVISION: UINT64 = 0x2001f // (2<<16) | 31
const EFI_2_30_SYSTEM_TABLE_REVISION: UINT64 = 0x2001e // (2<<16) | 30
const EFI_2_20_SYSTEM_TABLE_REVISION: UINT64 = 0x20014 // (2<<16) | 20
const EFI_2_10_SYSTEM_TABLE_REVISION: UINT64 = 0x2000a // (2<<16) | 10
const EFI_2_00_SYSTEM_TABLE_REVISION: UINT64 = 0x20000 // (2<<16) | 00
const EFI_1_10_SYSTEM_TABLE_REVISION: UINT64 = 0x1000a // (1<<16) | 10
const EFI_1_02_SYSTEM_TABLE_REVISION: UINT64 = 0x10002 // (1<<16) | 02
const EFI_SPECIFICATION_VERSION:      UINT64 = EFI_2_90_SYSTEM_TABLE_REVISION
