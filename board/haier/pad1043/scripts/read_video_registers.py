import subprocess


def read_i2c_register(
    bus_num: int, dev_addr: int, reg_addr: int, addr_width: int, read_len: int
) -> str:
    args = ["i2ctransfer", "-f", "-y", str(bus_num), f"w{addr_width}@{dev_addr}"]
    for i in range(addr_width):
        args.append(str((reg_addr >> (i * 8)) & 0xFF))

    args.append(f"r{read_len}")

    proc = subprocess.run(args, capture_output=True)
    proc.check_returncode()

    return " ".join(proc.stdout.decode("latin-1").strip().split()[::-1])


def read_mem_addr(addr: int, width: int) -> str:
    args = ["devmem", str(addr), str(width * 8)]

    proc = subprocess.run(args, capture_output=True)
    proc.check_returncode()

    return proc.stdout.decode("latin-1").strip()


def read_rk618_module_registers(name: str, base_addr: int, num_regs: int):
    bus_num = 4
    dev_addr = 0x50

    print(f"{name}\n")

    for i in range(num_regs):
        reg_addr = base_addr + 4 * i
        content = read_i2c_register(bus_num, dev_addr, reg_addr, 2, 4)
        print(f"{hex(reg_addr)}: {content}")

    print("\n\n")


def read_rk618_registers():
    print("RK618 Registers:\n\n")

    read_rk618_module_registers("scaler/dither/vif/pll", 0x0000, 40)
    read_rk618_module_registers("hdmi", 0x0400, 238)
    read_rk618_module_registers("codec", 0x0800, 74)
    read_rk618_module_registers("mipi-phy", 0x0C00, 211)
    read_rk618_module_registers("mipi-ctrl", 0x1000, 29)

    print("\n\n")


def read_lcdc1_registers():
    base_addr = 0x1010E000

    print("LCDC1\n\n")

    for i in range(37):
        reg_addr = base_addr + 4 * i
        content = read_mem_addr(reg_addr, 4)
        print(f"{hex(reg_addr)}: {content}")

    print("\n\n")


def main():
    read_rk618_registers()
    read_lcdc1_registers()


if __name__ == "__main__":
    main()
