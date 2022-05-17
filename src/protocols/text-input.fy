include "../common"
include "../status"

struct EFI_INPUT_KEY {
	ScanCode: UINT16,
	UnicodeChar: CHAR16,
}
struct EFI_SIMPLE_TEXT_INPUT_PROTOCOL {
	// Todo: change This: EFI_PTR_VOID to This: *EFI_SIMPLE_TEXT_INPUT_PROTOCOL
	Reset: *fun(This: EFI_PTR_VOID, ExtendedVerification: BOOLEAN): EFI_STATUS,
	ReadKeyStroke: *fun(This: EFI_PTR_VOID, Key: *EFI_INPUT_KEY): EFI_STATUS,
	WaitForKey: EFI_EVENT,
}
