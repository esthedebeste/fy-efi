include "../common"

struct EFI_TIME {
	Year: UINT16, // 1900 – 9999
	Month: UINT8, // 1 – 12
	Day: UINT8, // 1 – 31
	Hour: UINT8, // 0 – 23
	Minute: UINT8, // 0 – 59
	Second: UINT8, // 0 – 59
	Pad1: UINT8,
	Nanosecond: UINT32, // 0 – 999,999,999
	TimeZone: INT16, // -1440 to 1440 or 2047
	Daylight: UINT8,
	Pad2: UINT8,
}

// EFI_TIME.Daylight bitmasks
const EFI_TIME_ADJUST_DAYLIGHT = 0b01
const EFI_TIME_IN_DAYLIGHT     = 0b10

inline fun(EFI_TIME) affected_by_daylight_savings(): bool
	(this.Daylight & EFI_TIME_ADJUST_DAYLIGHT) != 0
inline fun(EFI_TIME) adjusted_by_daylight_savings(): bool
	(this.Daylight & EFI_TIME_IN_DAYLIGHT) != 0

const EFI_UNSPECIFIED_TIMEZONE = 0x07FF

struct EFI_TIME_CAPABILITIES {
	Resolution: UINT32,
	Accuracy: UINT32,
	SetsToZero: BOOLEAN,
}
