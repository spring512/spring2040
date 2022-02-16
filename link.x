MEMORY {
    FLASH : ORIGIN = 0x10000000, LENGTH = 2048K
    RAM   : ORIGIN = 0x20000000, LENGTH = 256K
}

ENTRY(Reset);

EXTERN(main);

EXTERN(Reset);

EXTERN(RESET_VECTOR);

EXTERN(INTERRUPTS);

EXTERN(EXCEPTIONS);



SECTIONS
{
  .vector_table ORIGIN(FLASH) :
  {
    /* First entry: initial Stack Pointer value */
    LONG(ORIGIN(RAM) + LENGTH(RAM));

    /* Second entry: reset vector */
    KEEP(*(.vector_table.reset_vector));

    KEEP(*(.vector_table.exceptions));

    KEEP(*(.vector_table.interrupts));
  } > FLASH

  PROVIDE(_stext = ADDR(.vector_table) + SIZEOF(.vector_table));
  
  .text _stext :
  {
    *(.text .text.*);
  } > FLASH

  /DISCARD/ :
  {
    *(.ARM.exidx .ARM.exidx.*);
  }
}
