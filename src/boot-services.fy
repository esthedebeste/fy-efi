include "./common"
include "./event"
include "./status"
include "./table-header" // EFI_TABLE_HEADER
include "./memory" // Memory Services
include "./boot-services/tpl" // EFI_RAISE_TPL, EFI_TPL
include "./boot-services/timer" // EFI_SET_TIMER
include "./boot-services/protocol-handler" // Protocol Handler Services
include "./boot-services/driversupport" // DriverSupport Services
include "./boot-services/library" // Library Services
include "./boot-services/image" // Image Services

const EFI_BOOT_SERVICES_SIGNATURE = 0x56524553544f4f42
const EFI_BOOT_SERVICES_REVISION  = EFI_SPECIFICATION_VERSION
struct EFI_BOOT_SERVICES {
	Hdr: EFI_TABLE_HEADER,
	// Task Priority Services
	RaiseTPL: EFI_RAISE_TPL, // EFI 1.0+
	RestoreTPL: EFI_RESTORE_TPL, // EFI 1.0+
	// Memory Services
	AllocatePages: EFI_ALLOCATE_PAGES, // EFI 1.0+
	FreePages: EFI_FREE_PAGES, // EFI 1.0+
	GetMemoryMap: EFI_GET_MEMORY_MAP, // EFI 1.0+
	AllocatePool: EFI_ALLOCATE_POOL, // EFI 1.0+
	FreePool: EFI_FREE_POOL, // EFI 1.0+
	// Event & Timer Services
	CreateEvent: *fun(Type: UINT32, NotifyTpl: EFI_TPL, NotifyFunction: EFI_EVENT_NOTIFY, NotifyContext: EFI_PTR_VOID, Event: *EFI_EVENT): EFI_STATUS, // EFI 1.0+
	SetTimer: EFI_SET_TIMER, // EFI 1.0+
	WaitForEvent: *fun(NumberOfEvents: UINTN, Event: *EFI_EVENT, Index: *UINTN): EFI_STATUS, // EFI 1.0+
	SignalEvent: *fun(Event: EFI_EVENT): EFI_STATUS, // EFI 1.0+
	CloseEvent: *fun(Event: EFI_EVENT): EFI_STATUS, // EFI 1.0+
	CheckEvent: *fun(Event: EFI_EVENT): EFI_STATUS, // EFI 1.0+
	// Protocol Handler Services
	InstallProtocolInterface: EFI_INSTALL_PROTOCOL_INTERFACE, // EFI 1.0+
	ReinstallProtocolInterface: EFI_REINSTALL_PROTOCOL_INTERFACE, // EFI 1.0+
	UninstallProtocolInterface: EFI_UNINSTALL_PROTOCOL_INTERFACE, // EFI 1.0+
	HandleProtocol: EFI_HANDLE_PROTOCOL, // EFI 1.0+
	Reserved: EFI_PTR_VOID, // EFI 1.0+
	RegisterProtocolNotify: EFI_REGISTER_PROTOCOL_NOTIFY, // EFI 1.0+
	LocateHandle: EFI_LOCATE_HANDLE, // EFI 1.0+
	LocateDevicePath: EFI_LOCATE_DEVICE_PATH, // EFI 1.0+
	InstallConfigurationTable: *fun(Guid: *EFI_GUID, Table: EFI_PTR_VOID): EFI_STATUS, // EFI 1.0+
	// Image Services
	LoadImage: EFI_IMAGE_LOAD, // EFI 1.0+
	StartImage: EFI_IMAGE_START, // EFI 1.0+
	Exit: EFI_EXIT, // EFI 1.0+
	UnloadImage: EFI_IMAGE_UNLOAD, // EFI 1.0+
	ExitBootServices: EFI_EXIT_BOOT_SERVICES, // EFI 1.0+
	// Miscellaneous Services
	GetNextMonotonicCount: *fun(Count: *UINT64): EFI_STATUS, // EFI 1.0+
	Stall: *fun(Microseconds: UINTN): EFI_STATUS, // EFI 1.0+
	SetWatchdogTimer: *fun(Timeout: UINTN, WatchdogCode: UINT64, DataSize: UINTN, WatchdogData: *CHAR16): EFI_STATUS, // EFI 1.0+
	// DriverSupport Services
	ConnectController: EFI_CONNECT_CONTROLLER, // EFI 1.1
	DisconnectController: EFI_DISCONNECT_CONTROLLER,// EFI 1.1+
	// Open and Close Protocol Services
	OpenProtocol: EFI_OPEN_PROTOCOL, // EFI 1.1+
	CloseProtocol: EFI_CLOSE_PROTOCOL, // EFI 1.1+
	OpenProtocolInformation: EFI_OPEN_PROTOCOL_INFORMATION, // EFI 1.1+
	// Library Services
	ProtocolsPerHandle: EFI_PROTOCOLS_PER_HANDLE, // EFI 1.1+
	LocateHandleBuffer: EFI_LOCATE_HANDLE_BUFFER, // EFI 1.1+
	LocateProtocol: EFI_LOCATE_PROTOCOL, // EFI 1.1+
	InstallMultipleProtocolInterfaces: EFI_INSTALL_MULTIPLE_PROTOCOL_INTERFACES, // EFI 1.1+
	UninstallMultipleProtocolInterfaces: EFI_UNINSTALL_MULTIPLE_PROTOCOL_INTERFACES, // EFI 1.1+
	// 32-bit CRC Services
	CalculateCrc32: *fun(Data: EFI_PTR_VOID, DataSize: UINTN, Crc32: *UINT32): EFI_STATUS, // EFI 1.1+
	// Miscellaneous Services
	CopyMem: *fun(Destination: EFI_PTR_VOID, Source: EFI_PTR_VOID, Length: UINTN): EFI_STATUS, // EFI 1.1+
	SetMem: *fun(Buffer: EFI_PTR_VOID, Size: UINTN, Value: UINT8): EFI_STATUS, // EFI 1.1+
	CreateEventEx: *fun(Type: UINT32, NotifyTpl: EFI_TPL, NotifyFunction: EFI_EVENT_NOTIFY, NotifyContext: EFI_PTR_VOID, EventGroup: *EFI_GUID, Event: *EFI_EVENT): EFI_STATUS, // UEFI 2.0+
}
