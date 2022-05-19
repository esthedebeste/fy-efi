include "./common"
include "./table-header"
include "./protocols/text-input"
include "./protocols/text-output"
include "./runtime-services.fy"
include "./boot-services.fy"

struct EFI_CONFIGURATION_TABLE {
	VendorGuid: EFI_GUID,
	VendorTable: EFI_PTR_VOID,
}

const EFI_SYSTEM_TABLE_SIGNATURE = 0x5453595320494249 as UINT64
const EFI_SYSTEM_TABLE_REVISION  = EFI_2_90_SYSTEM_TABLE_REVISION

struct EFI_SYSTEM_TABLE {
	Hdr: EFI_TABLE_HEADER,
	FirmwareVendor: *CHAR16,
	FirmwareRevision: UINT32, PADDING: UINT32,
	ConsoleInHandle: EFI_HANDLE,
	ConIn: *EFI_SIMPLE_TEXT_INPUT_PROTOCOL,
	ConsoleOutHandle: EFI_HANDLE,
	ConOut: *EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL,
	StandardErrorHandle: EFI_HANDLE,
	StdErr: *EFI_SIMPLE_TEXT_OUTPUT_PROTOCOL,
	RuntimeServices: *EFI_RUNTIME_SERVICES,
	BootServices: *EFI_BOOT_SERVICES,
	NumberOfTableEntries: UINTN,
	ConfigurationTable: *EFI_CONFIGURATION_TABLE,
}
