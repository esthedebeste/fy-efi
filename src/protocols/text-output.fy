include "../common"
include "../status"

const EFI_BLACK = 0x00
const EFI_BLUE = 0x01
const EFI_GREEN = 0x02
const EFI_CYAN = 0x03
const EFI_RED = 0x04
const EFI_MAGENTA = 0x05
const EFI_BROWN = 0x06
const EFI_LIGHTGRAY = 0x07
const EFI_BRIGHT = 0x08
const EFI_DARKGRAY = 0x08
const EFI_LIGHTBLUE = 0x09
const EFI_LIGHTGREEN = 0x0A
const EFI_LIGHTCYAN = 0x0B
const EFI_LIGHTRED = 0x0C
const EFI_LIGHTMAGENTA = 0x0D
const EFI_YELLOW = 0x0E
const EFI_WHITE = 0x0F
const EFI_BACKGROUND_BLACK = 0x00
const EFI_BACKGROUND_BLUE = 0x10
const EFI_BACKGROUND_GREEN = 0x20
const EFI_BACKGROUND_CYAN = 0x30
const EFI_BACKGROUND_RED = 0x40
const EFI_BACKGROUND_MAGENTA = 0x50
const EFI_BACKGROUND_BROWN = 0x60
const EFI_BACKGROUND_LIGHTGRAY = 0x70
inline fun EFI_TEXT_ATTR(Foreground: UINTN, Background: UINTN): UINTN
	(Background << 4) | Foreground


struct SIMPLE_TEXT_OUTPUT_MODE {
	MaxMode: INT32,
	// current settings
	Mode: INT32,
	Attribute: INT32,
	CursorColumn: INT32,
	CursorRow: INT32,
	CursorVisible: BOOLEAN,
}

struct EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL {
	// TODO: change This: EFI_PTR_VOID to This: *EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL
	Reset: *fun cc(EFIAPI) (This: EFI_PTR_VOID, ExtendedVerification: BOOLEAN): EFI_STATUS,
	OutputString: *fun cc(EFIAPI) (This: EFI_PTR_VOID, String: *CHAR16): EFI_STATUS,
	TestString: *fun cc(EFIAPI) (This: EFI_PTR_VOID, String: *CHAR16): EFI_STATUS,
	QueryMode: *fun cc(EFIAPI) (This: EFI_PTR_VOID, ModeNumber: UINTN, Columns: *UINTN, Rows: *UINTN): EFI_STATUS,
	SetMode: *fun cc(EFIAPI) (This: EFI_PTR_VOID, ModeNumber: UINTN): EFI_STATUS,
	SetAttribute: *fun cc(EFIAPI) (This: EFI_PTR_VOID, Attribute: UINTN): EFI_STATUS,
	ClearScreen: *fun cc(EFIAPI) (This: EFI_PTR_VOID): EFI_STATUS,
	SetCursorPosition: *fun cc(EFIAPI) (This: EFI_PTR_VOID, Column: UINTN, Row: UINTN): EFI_STATUS,
	EnableCursor: *fun cc(EFIAPI) (This: EFI_PTR_VOID, Visible: BOOLEAN): EFI_STATUS,
	Mode: *SIMPLE_TEXT_OUTPUT_MODE,
}
