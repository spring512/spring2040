#![no_std]
#![no_main]

use core::panic::PanicInfo;

#[no_mangle]
pub fn main() -> ! {
    let x = 42;
    loop {}
}

#[panic_handler]
fn panic(_panic: &PanicInfo<'_>) -> ! {
    loop {}
}

#[no_mangle]
pub unsafe extern "C" fn Reset() -> ! {
    main()
}

// The reset vector, a pointer into the reset handler
#[link_section = ".vector_table.reset_vector"]
#[no_mangle]
pub static RESET_VECTOR: unsafe extern "C" fn() -> ! = Reset;

#[link_section = ".vector_table.interrupts"]
#[no_mangle]
static INTERRUPTS: unsafe extern "C" fn() -> ! = Int;

#[link_section = ".vector_table.exceptions"]
#[no_mangle]
static EXCEPTIONS: unsafe extern "C" fn() -> ! = Exception;

/// Dummy interrupt.
#[no_mangle]
pub unsafe extern "C" fn Int() -> ! {
    loop {}
}

#[no_mangle]
pub unsafe extern "C" fn Exception() -> ! {
    loop {}
}
