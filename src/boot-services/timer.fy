include "../common"

type EFI_TIMER_DELAY = int32 // C enum
	const TimerCancel = 0
	const TimerPeriodic = 1
	const TimerRelative = 2

type EFI_SET_TIMER = *fun cc(EFIAPI) (Event: EFI_EVENT, Type: EFI_TIMER_DELAY, TriggerTime: UINT64): EFI_STATUS
