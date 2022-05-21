include "../src/common"
include "../src/status"

const EFI_SIMPLE_TEXT_INPUT_PROTOCOL_GUID = create EFI_GUID { 0x387477c1,0x69c7,0x11d2,0x8e,0x39,0x00,0xa0,0xc9,0x69,0x72,0x3b }
struct EFI_INPUT_KEY {
	ScanCode: UINT16,
	UnicodeChar: CHAR16,
}
struct EFI_SIMPLE_TEXT_INPUT_PROTOCOL {
	// Todo: change This: EFI_PTR_THIS to This: *EFI_SIMPLE_TEXT_INPUT_PROTOCOL
	Reset: *fun cc(EFIAPI) (This: EFI_PTR_THIS, ExtendedVerification: BOOLEAN): EFI_STATUS,
	ReadKeyStroke: *fun cc(EFIAPI) (This: EFI_PTR_THIS, Key: *EFI_INPUT_KEY): EFI_STATUS,
	WaitForKey: EFI_EVENT,
}
