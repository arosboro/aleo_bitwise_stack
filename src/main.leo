// The 'aleo_bitwise_stack' program.

// Six bits can Represent any Standard Playing Card.  (Two extra bits for suit 00, 01, 10, 11)
// 0u8 = 0b00000000 // Null
// 1u8 = 0b00000001 // Joker
// 2u8 = 0b00000010
// 3u8 = 0b00000011
// 4u8 = 0b00000100
// 5u8 = 0b00000101
// 6u8 = 0b00000110
// 7u8 = 0b00000111
// 8u8 = 0b00001000
// 9u8 = 0b00001001
// 10u8 = 0b00001010
// 11u8 = 0b00001011 // Jack
// 12u8 = 0b00001100 // Queen
// 13u8 = 0b00001101 // King
// 14u8 = 0b00001110 // Ace

// Maxium Capacity of a stack is 4 256 bit series.  Each series contains 8 buffers.  Each buffer is 32 bits.
// Buffers are aligned to member_size.  Each stack element takes up member_size bits of the buffer.
// 4u32 * 8u32 * 32u32 / 6u32 = 170u32 Cards which can be contained in a stack.  (170u32 * 6u32 = 1020u32 bits)
// This allows for games with up to three decks of cards represented together in a single stack.


// Start with a 
program aleo_bitwise_stack.aleo {

    struct BufferSeries256Bit {
        b00: u32,
        b01: u32,
        b02: u32,
        b03: u32,
        b04: u32,
        b05: u32,
        b06: u32,
        b07: u32,
    }

    record Stack {
        owner: address,
        gates: u64,
        capacity: u32,
        top: u32,
        member_size: u32,
        s00: BufferSeries256Bit,
        s01: BufferSeries256Bit,
        s02: BufferSeries256Bit,
        s03: BufferSeries256Bit,
    }

    mapping stack_count: address => u64;
    mapping stack_elements: address => u64;

    // function u32_max() -> u32 / member_size {
    //     return 4294967295u32;
    // }

    function is_empty(stack: Stack) -> bool {
        return stack.top == 0u32;
    }

    function is_full(stack: Stack) -> bool {
        return stack.top == stack.capacity;
    }

    // There are 4 256 bit series in a stack.  A series contains 8 buffers.  Each buffer is 32 bits.
    // Buffers are aligned to member_size.  Each stack element takes up member_size bits of the buffer.
    function get_series_and_buffer_indexes(top: u32, member_size: u32) -> (u32, u32) {
        // Top relative to how many 256 bit series have been used with member_size lengthy elements.
        // It is the index of the next series to be used.
        let series_index: u32 = top / (8u32 * 32u32 / member_size);
        // Top relative to how many buffers have been used with member_size lengthy elements.
        // It is the index of the next buffer to be used.
        let buffer_index: u32 = (top % (8u32 * 32u32 / member_size)) / (32u32 / member_size);

        return (series_index, buffer_index);
    }

    function get_buffer_series(buffer_series_index: u32, stack: Stack) -> BufferSeries256Bit {
        // Top relative to how many 256 bit series have been used with stack.member_size lengthy elements.  
        // It is the index of the next series to be used.
        let top: u32 = stack.top;
        let member_size: u32 = stack.member_size;
        let capacity: u32 = stack.capacity;
        if buffer_series_index == 0u32 {
            let buffer_series: BufferSeries256Bit = stack.s00;
        } else if buffer_series_index == 1u32 {
            let buffer_series: BufferSeries256Bit = stack.s01;
        } else if buffer_series_index == 2u32 {
            let buffer_series: BufferSeries256Bit = stack.s02;
        } else if buffer_series_index == 3u32 {
            let buffer_series: BufferSeries256Bit = stack.s03;
        } else {
            assert(top < (4u32 * 8u32 * 32u32 / member_size));
        }
        return BufferSeries256Bit {
            b00: 0u32,
            b01: 0u32,
            b02: 0u32,
            b03: 0u32,
            b04: 0u32,
            b05: 0u32,
            b06: 0u32,
            b07: 0u32,
        };
    }

    function set_buffer_series(buffer_series_index: u32, stack: Stack, new_top: u32, buffer_series: BufferSeries256Bit) -> Stack {
        // Top relative to how many 256 bit series have been used with stack.member_size lengthy elements.  
        // It is the index of the next series to be used.
        let top: u32 = stack.top;
        let member_size: u32 = stack.member_size;
        let capacity: u32 = stack.capacity;
        let buffer_series00: BufferSeries256Bit = BufferSeries256Bit {
            b00: stack.s00.b00,
            b01: stack.s00.b01,
            b02: stack.s00.b02,
            b03: stack.s00.b03,
            b04: stack.s00.b04,
            b05: stack.s00.b05,
            b06: stack.s00.b06,
            b07: stack.s00.b07,
        };
        let buffer_series01: BufferSeries256Bit = BufferSeries256Bit {
            b00: stack.s01.b00,
            b01: stack.s01.b01,
            b02: stack.s01.b02,
            b03: stack.s01.b03,
            b04: stack.s01.b04,
            b05: stack.s01.b05,
            b06: stack.s01.b06,
            b07: stack.s01.b07,
        };
        let buffer_series02: BufferSeries256Bit = BufferSeries256Bit {
            b00: stack.s02.b00,
            b01: stack.s02.b01,
            b02: stack.s02.b02,
            b03: stack.s02.b03,
            b04: stack.s02.b04,
            b05: stack.s02.b05,
            b06: stack.s02.b06,
            b07: stack.s02.b07,
        };
        let buffer_series03: BufferSeries256Bit = BufferSeries256Bit {
            b00: stack.s03.b00,
            b01: stack.s03.b01,
            b02: stack.s03.b02,
            b03: stack.s03.b03,
            b04: stack.s03.b04,
            b05: stack.s03.b05,
            b06: stack.s03.b06,
            b07: stack.s03.b07,
        };
        if buffer_series_index == 0u32 {
            buffer_series00 = buffer_series;
        } else if buffer_series_index == 1u32 {
            buffer_series01 = buffer_series;
        } else if buffer_series_index == 2u32 {
            buffer_series02 = buffer_series;
        } else if buffer_series_index == 3u32 {
            buffer_series03 = buffer_series;
        } else {
            assert(top < (4u32 * 8u32 * 32u32 / member_size));
        }
        return Stack {
            owner: stack.owner,
            gates: stack.gates,
            capacity: capacity,
            top: new_top,
            member_size: member_size,
            s00: buffer_series00,
            s01: buffer_series01,
            s02: buffer_series02,
            s03: buffer_series03,
        };
    }

    function get_buffer_at_index(index: u32, buffer_series: BufferSeries256Bit) -> u32 {
        if index == 0u32 {
            return buffer_series.b00;
        } else if index == 1u32 {
            return buffer_series.b01;
        } else if index == 2u32 {
            return buffer_series.b02;
        } else if index == 3u32 {
            return buffer_series.b03;
        } else if index == 4u32 {
            return buffer_series.b04;
        } else if index == 5u32 {
            return buffer_series.b05;
        } else if index == 6u32 {
            return buffer_series.b06;
        } else if index == 7u32 {
            return buffer_series.b07;
        } else {
            assert(index < 32u32);
            return 0u32;
        }
    }

    function set_buffer_at_index(index: u32, buffer_series: BufferSeries256Bit, value: u32) -> BufferSeries256Bit {
        let buffer00: u32 = buffer_series.b00;
        let buffer01: u32 = buffer_series.b01;
        let buffer02: u32 = buffer_series.b02;
        let buffer03: u32 = buffer_series.b03;
        let buffer04: u32 = buffer_series.b04;
        let buffer05: u32 = buffer_series.b05;
        let buffer06: u32 = buffer_series.b06;
        let buffer07: u32 = buffer_series.b07;
        if index == 0u32 {
            buffer00 = value;
        } else if index == 1u32 {
            buffer01 = value;
        } else if index == 2u32 {
            buffer02 = value;
        } else if index == 3u32 {
            buffer03 = value;
        } else if index == 4u32 {
            buffer04 = value;
        } else if index == 5u32 {
            buffer05 = value;
        } else if index == 6u32 {
            buffer06 = value;
        } else if index == 7u32 {
            buffer07 = value;
        } else {
            assert(index < 32u32);
        }
        return BufferSeries256Bit {
            b00: buffer00,
            b01: buffer01,
            b02: buffer02,
            b03: buffer03,
            b04: buffer04,
            b05: buffer05,
            b06: buffer06,
            b07: buffer07,
        };
    }

    transition main(member_size: u32) -> Stack {
        let capacity: u32 = 4u32 * 8u32 * 32u32 / member_size;
        // Check for overflow
        assert(capacity > 0u32); 
        assert(member_size > 0u32);
        assert(member_size <= 32u32);
        assert(capacity <= 4294967295u32 / member_size);
        let empty_buffer_series: BufferSeries256Bit = BufferSeries256Bit {
            b00: 0u32,
            b01: 0u32,
            b02: 0u32,
            b03: 0u32,
            b04: 0u32,
            b05: 0u32,
            b06: 0u32,
            b07: 0u32,
        };
        return Stack {
            owner: self.caller,
            gates: 0u64,
            capacity,
            top: 0u32,
            member_size,
            s00: empty_buffer_series,
            s01: empty_buffer_series,
            s02: empty_buffer_series,
            s03: empty_buffer_series,
        } then finalize(self.caller, 1u64);
    }

    finalize main(owner: address, count: u64) {
        increment(stack_count, owner, count);
    }

    // buffer = 0u32 = 0b00000000000000000000000000000000;
    // value1 = 14u32 = 0b00000000000000000000000000001110;
    // value2 = 6u32 = 0b00000000000000000000000000000110;
    // buffer = buffer << 8u32; // buffer = 0b00000000000000000000000000000000;
    // buffer = buffer & value1; // new_buffer1 = 0b00000000000000000000000000001110
    // buffer = buffer << 8u32; // buffer = 0b00000000000000000000111000000000;
    // buffer = buffer & value2; // new_buffer2 = 0b00000000000000000000111000000110;
    transition push(value: u32, stack: Stack) -> Stack {
        let capacity: u32 = stack.capacity;
        let top: u32 = stack.top;
        let bits: u32 = stack.member_size;
        let (buffer_series_index, buffer_index): (u32, u32) = get_series_and_buffer_indexes(top, bits);
        let buffer_series: BufferSeries256Bit = get_buffer_series(buffer_series_index, stack);
        let buffer: u32 = get_buffer_at_index(buffer_index, buffer_series);
        let max_u32_value: u32 = 4294967295u32; // b11111111111111111111111111111111
        let max_bits_value: u32 = 0u32;
        if bits == 32u32 {
            max_bits_value = max_u32_value;
        }
        else {
            max_bits_value = 2u32 ** bits - 1u32;
        }
        // Check for overflow
        assert(top < capacity);
        assert(value <= max_bits_value);
        assert(max_bits_value <= max_u32_value / 2u32);
        
        // Shift Left and then use OR to add the value
        let new_top: u32 = top + 1u32;
        // Where the magic happens:
        let new_buffer: u32 = buffer << bits;
        new_buffer = new_buffer | value;
        let new_buffer_series: BufferSeries256Bit = set_buffer_at_index(buffer_index, buffer_series, new_buffer);
        let new_stack: Stack = set_buffer_series(buffer_series_index, stack, new_top, new_buffer_series);

        return new_stack then finalize(stack.owner, 1u64);
    }

    finalize push(owner: address, count: u64) {
        increment(stack_elements, owner, count);
    }

    transition pop(stack: Stack) -> (u32, Stack) {
        // Check for underflow
        assert(!is_empty(stack));
        let top: u32 = stack.top;
        let bits: u32 = stack.member_size;
        let (buffer_series_index, buffer_index): (u32, u32) = get_series_and_buffer_indexes(top, bits);
        let buffer_series: BufferSeries256Bit = get_buffer_series(buffer_series_index, stack);
        let buffer: u32 = get_buffer_at_index(buffer_index, buffer_series);
        let max_u32_value: u32 = 4294967295u32; // b11111111111111111111111111111111
        let max_bits_value: u32 = 0u32;
        if bits == 32u32 {
            max_bits_value = max_u32_value;
        }
        else {
            max_bits_value = 2u32 ** bits - 1u32;
        }
        let mask: u32 = max_bits_value;
        if top % 32u32 == 0u32 {
            let new_buffer_series_index: u32 = buffer_series_index - 1u32;
            let new_buffer_series: BufferSeries256Bit = get_buffer_series(new_buffer_series_index, stack);
            let new_buffer_index: u32 = 31u32;
            let new_buffer: u32 = get_buffer_at_index(new_buffer_index, new_buffer_series);
            let new_top: u32 = top - 1u32;
            // Where the magic happens:
            let value: u32 = new_buffer & mask;
            new_buffer = new_buffer >> bits;
            new_buffer_series = set_buffer_at_index(new_buffer_index, new_buffer_series, new_buffer);
            let new_stack: Stack = set_buffer_series(new_buffer_series_index, stack, new_top, new_buffer_series);
            return (value, new_stack) then finalize(stack.owner, 1u64);
        } else {
            let new_top: u32 = top - 1u32;
            // Where the magic happens:
            let value: u32 = buffer & mask;
            let new_buffer: u32 = buffer >> bits;
            let new_buffer_series: BufferSeries256Bit = set_buffer_at_index(buffer_index, buffer_series, new_buffer);
            let new_stack: Stack = set_buffer_series(buffer_series_index, stack, new_top, new_buffer_series);
            return (value, new_stack) then finalize(stack.owner, 1u64);
        }
    }

    finalize pop(owner: address, count: u64) {
        decrement(stack_elements, owner, count);
    }

    transition peek(stack: Stack) -> (u32, Stack) {
        // Check for underflow
        assert(!is_empty(stack));
        let top: u32 = stack.top;
        let bits: u32 = stack.member_size;
        let (buffer_series_index, buffer_index): (u32, u32) = get_series_and_buffer_indexes(top, bits);
        let buffer_series: BufferSeries256Bit = get_buffer_series(buffer_series_index, stack);
        let buffer: u32 = get_buffer_at_index(buffer_index, buffer_series);
        if bits == 32u32 {
            return (buffer, stack);
        } else {
            // use AND to get the value
            let mask: u32 = 2u32 ** bits - 1u32;
            return (buffer & mask, stack);
        }
    }

    transition slice_to_recipient(recipient: address, stack: Stack) -> (Stack, Stack) {
        // Check for underflow
        assert(!is_empty(stack));
        let top: u32 = stack.top;
        let bits: u32 = stack.member_size;
        let (buffer_series_index, buffer_index): (u32, u32) = get_series_and_buffer_indexes(top, bits);
        let buffer_series: BufferSeries256Bit = get_buffer_series(buffer_series_index, stack);
        let buffer: u32 = get_buffer_at_index(buffer_index, buffer_series);
        let new_top: u32 = top - 1u32;
        let empty_buffer_series: BufferSeries256Bit = BufferSeries256Bit {
            b00: 0u32,
            b01: 0u32,
            b02: 0u32,
            b03: 0u32,
            b04: 0u32,
            b05: 0u32,
            b06: 0u32,
            b07: 0u32,
        };
        let max_u32_value: u32 = 4294967295u32; // b11111111111111111111111111111111
        let max_bits_value: u32 = 0u32;
        if bits == 32u32 {
            max_bits_value = max_u32_value;
        }
        else {
            max_bits_value = 2u32 ** bits - 1u32;
        }
        let mask: u32 = max_bits_value;
        if top % 32u32 == 0u32 {
            // If the buffer is empty, we need to get the previous buffer
            let new_buffer_series_index: u32 = buffer_series_index - 1u32;
            let new_buffer_series: BufferSeries256Bit = get_buffer_series(new_buffer_series_index, stack);
            let new_buffer_index: u32 = 31u32;
            let new_buffer: u32 = get_buffer_at_index(new_buffer_index, new_buffer_series);
            // Where the magic happens:
            let value: u32 = new_buffer & mask;
            new_buffer = new_buffer >> bits;
            new_buffer_series = set_buffer_at_index(new_buffer_index, new_buffer_series, new_buffer);
            let new_stack: Stack = set_buffer_series(new_buffer_series_index, stack, new_top, new_buffer_series);
            let recipient_stack: Stack = Stack {
                owner: recipient,
                gates: 0u64,
                capacity: 1u32,
                top: 1u32,
                member_size: bits,
                s00: BufferSeries256Bit {
                    b00: value, // Single element buffer same as u32 literal value
                    b01: 0u32,
                    b02: 0u32,
                    b03: 0u32,
                    b04: 0u32,
                    b05: 0u32,
                    b06: 0u32,
                    b07: 0u32,
                },
                s01: empty_buffer_series,
                s02: empty_buffer_series,
                s03: empty_buffer_series,
            };
            return (new_stack, recipient_stack) then finalize(stack.owner, recipient, 1u64);
        } else {
            let new_buffer_index: u32 = buffer_index - 1u32;
            let new_buffer: u32 = get_buffer_at_index(new_buffer_index, buffer_series);
            // Where the magic happens:
            let value: u32 = new_buffer & mask;
            new_buffer = new_buffer >> bits;
            let new_buffer_series: BufferSeries256Bit = set_buffer_at_index(new_buffer_index, buffer_series, new_buffer);
            let new_stack: Stack = set_buffer_series(buffer_series_index, stack, new_top, new_buffer_series);
            let recipient_stack: Stack = Stack {
                owner: recipient,
                gates: 0u64,
                capacity: 1u32,
                top: 1u32,
                member_size: bits,
                s00: BufferSeries256Bit {
                    b00: value, // Single element buffer same as u32 literal value
                    b01: 0u32,
                    b02: 0u32,
                    b03: 0u32,
                    b04: 0u32,
                    b05: 0u32,
                    b06: 0u32,
                    b07: 0u32,
                },
                s01: empty_buffer_series,
                s02: empty_buffer_series,
                s03: empty_buffer_series,
            };

            return (new_stack, recipient_stack) then finalize(stack.owner, recipient, 1u64);
        }
    }

    finalize slice_to_recipient(owner: address, recipient: address, count: u64) {
        decrement(stack_elements, owner, count);
        increment(stack_elements, recipient, count);
        increment(stack_count, recipient, count);
    }

    transition empty(stack: Stack) -> Stack {
        let empty_buffer_series: BufferSeries256Bit = BufferSeries256Bit {
            b00: 0u32,
            b01: 0u32,
            b02: 0u32,
            b03: 0u32,
            b04: 0u32,
            b05: 0u32,
            b06: 0u32,
            b07: 0u32,
        };
        let new_stack: Stack = Stack {
            owner: stack.owner,
            gates: stack.gates,
            capacity: stack.capacity,
            top: 0u32,
            member_size: stack.member_size,
            s00: empty_buffer_series,
            s01: empty_buffer_series,
            s02: empty_buffer_series,
            s03: empty_buffer_series,
        };
        assert(is_empty(new_stack));
        return new_stack;
    }
}