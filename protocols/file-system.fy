include "../src/common"
include "./file"

const EFI_SIMPLE_FILE_SYSTEM_PROTOCOL_GUID = create EFI_GUID { 0x0964e5b22,0x6459,0x11d2,0x8e,0x39,0x00,0xa0,0xc9,0x69,0x72,0x3b }
struct EFI_SIMPLE_FILE_SYSTEM_PROTOCOL {
	Revision: UINT64,
	OpenVolume: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Root: **EFI_FILE_PROTOCOL): EFI_STATUS,
}
