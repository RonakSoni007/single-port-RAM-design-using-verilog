# 🧠 Single-Port RAM in Verilog

## 📌 Description

This project implements a **Single-Port Synchronous RAM** using **Verilog HDL**. It simulates a memory module with:

- 🧱 **64 memory locations**
- 🧾 **8-bit word width**
- ⏱️ **Clock-synchronous read and write operations**

The design is minimal and easy to integrate into larger FPGA or ASIC-based digital systems. Useful for educational purposes or as a base for more complex memory architectures.

---

## 🔧 Features

- ✅ **Single-Port Architecture**  
  Uses a single data/address port for both read and write.

- 🔁 **Synchronous Read/Write**  
  All memory operations occur on the **positive clock edge**.

- 🔒 **Write Enable Control**  
  Write occurs only when `enableW` is high.

- 🧮 **Latched Read Address**  
  Address is registered to ensure stable read operation.

---

## 🖥️ Module Interface

```verilog
module bit_single_port_ram(
    input [7:0] data_ip,     // Data input (write data)
    input [5:0] address,     // Address input (6-bit for 64 locations)
    input enableW,           // Write enable
    input clk,               // Clock signal
    output [7:0] data_op     // Data output (read data)
);
