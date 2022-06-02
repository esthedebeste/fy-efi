include "../src/common"
include "../src/memory" // EFI_PHYSICAL_ADDRESS

type EFI_GRAPHICS_PIXEL_FORMAT = int32 // C enum
	const PixelRedGreenBlueReserved8BitPerColor = 0
	const PixelBlueGreenRedReserved8BitPerColor = 1
	const PixelBitMask = 2
	const PixelBltOnly = 3
	const PixelFormatMax = 4

struct EFI_PIXEL_BITMASK {
	RedMask: UINT32,
	GreenMask: UINT32,
	BlueMask: UINT32,
	ReservedMask: UINT32,
}
struct EFI_GRAPHICS_OUTPUT_MODE_INFORMATION {
	Version: UINT32,
	HorizontalResolution: UINT32,
	VerticalResolution: UINT32,
	PixelFormat: EFI_GRAPHICS_PIXEL_FORMAT,
	PixelInformation: EFI_PIXEL_BITMASK,
	PixelsPerScanLine: UINT32,
}

struct EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE {
	MaxMode: UINT32,
	Mode: UINT32,
	Info: *EFI_GRAPHICS_OUTPUT_MODE_INFORMATION,
	SizeOfInfo: UINTN,
	FrameBufferBase: EFI_PHYSICAL_ADDRESS,
	FrameBufferSize: UINTN,
}

struct EFI_GRAPHICS_OUTPUT_BLT_PIXEL {
	Blue: UINT8,
	Green: UINT8,
	Red: UINT8,
	Reserved: UINT8,
}

type EFI_GRAPHICS_OUTPUT_BLT_OPERATION = int32 // C enum
	const EfiBltVideoFill = 0
	const EfiBltVideoToBltBuffer = 1
	const EfiBltBufferToVideo = 2
	const EfiBltVideoToVideo = 3
	const EfiGraphicsOutputBltOperationMax = 4

const EFI_GRAPHICS_OUTPUT_PROTOCOL_GUID = create EFI_GUID { 0x9042a9de,0x23dc,0x4a38,0x96,0xfb,0x7a,0xde,0xd0,0x80,0x51,0x6a }
struct EFI_GRAPHICS_OUTPUT_PROTOCOL {
	QueryMode: *fun cc(EFIAPI) (This: EFI_PTR_THIS, ModeNumber: UINT32, SizeOfInfo: *UINTN, Info: **EFI_GRAPHICS_OUTPUT_MODE_INFORMATION): EFI_STATUS,
	SetMode: *fun cc(EFIAPI) (This: EFI_PTR_THIS, ModeNumber: UINT32): EFI_STATUS,
	Blt: *fun cc(EFIAPI) (This: EFI_PTR_THIS, BltBuffer: *EFI_GRAPHICS_OUTPUT_BLT_PIXEL, BltOperation: EFI_GRAPHICS_OUTPUT_BLT_OPERATION, SourceX: UINTN,
						  SourceY: UINTN, DestinationX: UINTN, DestinationY: UINTN, Width: UINTN, Height: UINTN, Delta: UINTN): EFI_STATUS,
	Mode: *EFI_GRAPHICS_OUTPUT_PROTOCOL_MODE,
}
