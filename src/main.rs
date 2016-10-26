#![no_std]
#![no_main]
#![feature(lang_items)]

#[cfg(not(test))]
pub mod panic;

#[no_mangle]
pub extern "C" fn kmain() -> ! {
    unsafe {
        let vga = 0xb8000 as *mut u64;

        *vga = 0x2f592f412f4b2f4f;
    };

    loop { }
}
