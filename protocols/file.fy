include "../src/common"
include "../src/runtime-services/time"

// open mode
const EFI_FILE_MODE_READ: UINT64 = 0x0000000000000001l
const EFI_FILE_MODE_WRITE: UINT64 = 0x0000000000000002l
const EFI_FILE_MODE_CREATE: UINT64 = 0x8000000000000000l
// attributes
const EFI_FILE_READ_ONLY: UINT64 = 0x0000000000000001
const EFI_FILE_HIDDEN: UINT64 = 0x0000000000000002
const EFI_FILE_SYSTEM: UINT64 = 0x0000000000000004
const EFI_FILE_RESERVED: UINT64 = 0x0000000000000008
const EFI_FILE_DIRECTORY: UINT64 = 0x0000000000000010
const EFI_FILE_ARCHIVE: UINT64 = 0x0000000000000020
const EFI_FILE_VALID_ATTR: UINT64 = 0x0000000000000037

const EFI_FILE_INFO_ID = create EFI_GUID { 0x09576e92,0x6d3f,0x11d2,0x8e,0x39,0x00,0xa0,0xc9,0x69,0x72,0x3b }
struct EFI_FILE_INFO {
	Size: UINT64,
	FileSize: UINT64,
	PhysicalSize: UINT64,
	CreateTime: EFI_TIME,
	LastAccessTime: EFI_TIME,
	ModificationTime: EFI_TIME,
	Attribute: UINT64,
	FileName: CHAR16[0],
}

const EFI_FILE_SYSTEM_INFO_ID = create EFI_GUID { 0x09576e93,0x6d3f,0x11d2,0x8e,0x39,0x00,0xa0,0xc9,0x69,0x72,0x3b }
struct EFI_FILE_SYSTEM_INFO {
	Size: UINT64,
	ReadOnly: BOOLEAN, PADDING: UINT8[7],
	VolumeSize: UINT64,
	FreeSpace: UINT64,
	BlockSize: UINT32,
	VolumeLabel: CHAR16[0],
}

const EFI_FILE_SYSTEM_VOLUME_LABEL_ID = create EFI_GUID { 0xdb47d7d3,0xfe81,0x11d3,0x9a,0x35,0x00,0x90,0x27,0x3f,0xc1,0x4d }
struct EFI_FILE_SYSTEM_VOLUME_LABEL {
	VolumeLabel: CHAR16[0],
}

struct EFI_FILE_IO_TOKEN {
	Event: EFI_EVENT,
	Status: EFI_STATUS,
	BufferSize: UINTN,
	Buffer: EFI_PTR_VOID,
}
struct EFI_FILE_PROTOCOL {
	Revision: UINT64,
	Open: *fun cc(EFIAPI) (This: EFI_PTR_THIS, NewHandle: *EFI_PTR_THIS, FileName: *CHAR16, OpenMode: UINT64, Attributes: UINT64): EFI_STATUS,
	Close: *fun cc(EFIAPI) (This: EFI_PTR_THIS): EFI_STATUS,
	Delete: *fun cc(EFIAPI) (This: EFI_PTR_THIS): EFI_STATUS,
	Read: *fun cc(EFIAPI) (This: EFI_PTR_THIS, BufferSize: *UINTN, Buffer: EFI_PTR_VOID): EFI_STATUS,
	Write: *fun cc(EFIAPI) (This: EFI_PTR_THIS, BufferSize: *UINTN, Buffer: EFI_PTR_VOID): EFI_STATUS,
	GetPosition: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Position: *UINT64): EFI_STATUS,
	SetPosition: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Position: UINT64): EFI_STATUS,
	GetInfo: *fun cc(EFIAPI) (This: EFI_PTR_THIS, InformationType: *EFI_GUID, BufferSize: *UINTN, Buffer: EFI_PTR_VOID): EFI_STATUS,
	SetInfo: *fun cc(EFIAPI) (This: EFI_PTR_THIS, InformationType: *EFI_GUID, BufferSize: UINTN, Buffer: EFI_PTR_VOID): EFI_STATUS,
	Flush: *fun cc(EFIAPI) (This: EFI_PTR_THIS): EFI_STATUS,
	OpenEx: *fun cc(EFIAPI) (This: EFI_PTR_THIS, NewHandle: *EFI_PTR_THIS, FileName: *CHAR16, OpenMode: UINT64, Attributes: UINT64, Token: *EFI_FILE_IO_TOKEN): EFI_STATUS, // Added for revision 2
	ReadEx: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Token: *EFI_FILE_IO_TOKEN): EFI_STATUS, // Added for revision 2
	WriteEx: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Token: *EFI_FILE_IO_TOKEN): EFI_STATUS, // Added for revision 2
	FlushEx: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Token: *EFI_FILE_IO_TOKEN): EFI_STATUS, // Added for revision 2
}
