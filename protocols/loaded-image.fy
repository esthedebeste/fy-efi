include "../src/common"
include "../src/system-table" // EFI_SYSTEM_TABLE
include "../src/memory" // EFI_MEMORY_TYPE
include "./device-path" // EFI_DEVICE_PATH_PROTOCOL

const EFI_LOADED_IMAGE_PROTOCOL_GUID = create EFI_GUID { 0x5b1b31a1,0x9562,0x11d2,0x8e,0x3f,0x00,0xa0,0xc9,0x69,0x72,0x3b }
const EFI_LOADED_IMAGE_PROTOCOL_REVISION: UINT32 = 0x1000
const EFI_LOADED_IMAGE_DEVICE_PATH_PROTOCOL_GUID = create EFI_GUID { 0xbc62157e,0x3e33,0x4fec,0x99,0x20,0x2d,0x3b,0x36,0xd7,0x50,0xdf }

struct EFI_LOADED_IMAGE_PROTOCOL {
	Revision: UINT32, Pad1: UINT32,
	ParentHandle: EFI_HANDLE,
	SystemTable: *EFI_SYSTEM_TABLE,
	// Source location of the image
	DeviceHandle: EFI_HANDLE,
	FilePath: *EFI_DEVICE_PATH_PROTOCOL,
	Reserved: EFI_PTR_VOID,
	// Image’s load options
	LoadOptionsSize: UINT32, Pad2: UINT32,
	LoadOptions: EFI_PTR_VOID,
	// Location where image was loaded
	ImageBase: EFI_PTR_VOID,
	ImageSize: UINT64,
	ImageCodeType: EFI_MEMORY_TYPE, Pad3: UINT32,
	ImageDataType: EFI_MEMORY_TYPE, Pad4: UINT32,
	Unload: *fun cc(EFIAPI) (ImageHandle: EFI_HANDLE): EFI_STATUS,
}
