INST_MAP = {
    "add": {'type': 'R', 'op': '000000', 'fn': '100000'},
    "sub": {'type': 'R', 'op': '000000', 'fn': '100010'},
    "addi": {'type': 'I', 'op': '001000', 'fn': ''},
    "and": {'type': 'R', 'op': '000000', 'fn': '100100'},
    "andi": {'type': 'I', 'op': '001100', 'fn': ''},
    "or": {'type': 'R', 'op': '000000', 'fn': '100101'},
    "ori": {'type': 'I', 'op': '001101', 'fn': ''},
    "nor": {'type': 'R', 'op': '000000', 'fn': '100111'},
    "slt": {'type': 'R', 'op': '000000', 'fn': '101010'},
    "slti": {'type': 'I', 'op': '001010', 'fn': ''},
    "sll": {'type': 'R', 'op': '000000', 'fn': '000000'},
    "srl": {'type': 'R', 'op': '000000', 'fn': '000010'},
    "sra": {'type': 'R', 'op': '000000', 'fn': '000011'},
    "lw": {'type': 'I', 'op': '100011', 'fn': ''},
    "sw": {'type': 'I', 'op': '101011', 'fn': ''},
    "lui": {'type': 'I', 'op': '001111', 'fn': ''},
    "lb": {'type': 'I', 'op': '100000', 'fn': ''},
    "sb": {'type': 'I', 'op': '101000', 'fn': ''},
    "lh": {'type': 'I', 'op': '100001', 'fn': ''},
    "sh": {'type': 'I', 'op': '101001', 'fn': ''},
    "beq": {'type': 'I', 'op': '000100', 'fn': ''},
    "bne": {'type': 'I', 'op': '000101', 'fn': ''},
    "j": {'type': 'J', 'op': '000010', 'fn': ''},
    "jr": {'type': 'R', 'op': '000000', 'fn': '001000'},
    }

REG_MAP = {
    "$zero": "00000",
    "$0": "00000",
    "$at": "00001",
    "$v0": "00010",
    "$v1": "00011",
    "$a0": "00100",
    "$a1": "00101",
    "$a2": "00110",
    "$a3": "00111",
    "$t0": "01000",
    "$t1": "01001",
    "$t2": "01010",
    "$t3": "01011",
    "$t4": "01100",
    "$t5": "01101",
    "$t6": "01110",
    "$t7": "01111",
    "$s0": "10000",
    "$s1": "10001",
    "$s2": "10010",
    "$s3": "10011",
    "$s4": "10100",
    "$s5": "10101",
    "$s6": "10110",
    "$s7": "10111",
    "$t8": "11000",
    "$t9": "11001",
    "$k0": "11010",
    "$k1": "11011",
    "$gp": "11100",
    "$sp": "11101",
    "$fp": "11110",
    "$ra": "11111",
}


def sign_extent(n, bits):
    s = bin(n & int("1"*bits, 2))[2:]
    return ("{0:0>%s}" % (bits)).format(s)


file_name = raw_input().strip()
with open(file_name) as f:
    content = f.readlines()
content = [x.strip() for x in content]
f = open("instructionmemory.txt", "w+")

labels = {}

for i in range(0, len(content)):
    inst_line = content[i]
    ls = inst_line.split(" ")
    if ":" in ls[0]:
        labels[ls[0][:-1]] = i

print(labels)
for i in range(0, len(content)):
    inst_line = content[i]
    if '/' in inst_line:
        continue
    ls = inst_line.split(" ")
    inst_line = content[i]
    ls = inst_line.split(" ")
    if ":" in ls[0]:
        ls.pop(0)
    print ls
    inst = ls[0]
    binary_string = 0
    if inst == 'noop':
        val = sign_extent(0, 32)
        binary_string = val

    elif INST_MAP[inst]["type"] == "R":
        if inst == "jr":
            rs = ls[1].replace(',', "")
            rt = "00000"
            rd = "00000"
            shamt = "00000"
            binary_string = INST_MAP[inst]['op']+REG_MAP[rs]+rt+rd+shamt+INST_MAP[inst]['fn']

        elif not inst == "sll" or inst == "srl" or inst == "sra":
            rs = ls[2].replace(',', "")
            rt = ls[3].replace(',', "")
            rd = ls[1].replace(',', "")
            binary_string = INST_MAP[inst]['op']+REG_MAP[rs]+REG_MAP[rt]+REG_MAP[rd]+"00000"+INST_MAP[inst]['fn']

        else:
            rs = "00000"
            rd = ls[1].replace(',', "")
            rt = ls[2].replace(',', "")
            shamt = sign_extent(int(ls[3]), 5)
            binary_string = INST_MAP[inst]['op'] + rs + REG_MAP[rt] + REG_MAP[rd] + shamt + INST_MAP[inst]['fn']

    elif INST_MAP[inst]["type"] == "I":
        if inst == "lw" or inst == "sw":
            rt = ls[1].replace(',', "")
            temp = ls[2].split('(')
            immediate = sign_extent(int(temp[0]), 16)
            rs = temp[1].replace(')', "")
            binary_string = INST_MAP[inst]['op'] + REG_MAP[rs] + REG_MAP[rt] + immediate

        elif inst == "beq" or inst == "bne":
            "beq $s0, $t0, Label"
            rs = ls[1].replace(',', "")
            rt = ls[2].replace(',', "")
            pos = labels[ls[3]]
            if pos > i:
                immediate = sign_extent((pos - i - 1), 16)
            else:
                immediate = sign_extent((pos - i - 1), 16)

            binary_string = INST_MAP[inst]['op'] + REG_MAP[rs] + REG_MAP[rt] + immediate

        else:
            rt = ls[1].replace(',', "")
            rs = ls[2].replace(',', "")
            immediate = sign_extent(int(ls[3]), 16)
            binary_string = INST_MAP[inst]['op'] + REG_MAP[rs] + REG_MAP[rt] + immediate

    elif INST_MAP[inst]["type"] == "J":
        if inst == 'j':
            val = sign_extent(i*4, 26)
            binary_string = INST_MAP[inst]['op'] + val
    f.write("%s\r\n" % binary_string)
    if inst == "beq" or inst == "bne" or inst == "lw" or inst == "sw":
        val = sign_extent(0, 32)
        for i in range(4):
            f.write("%s\r\n" % val)

f.close()
