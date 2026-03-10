# FPGA-RAM-ROM-Controller
This project implements a dual-memory controller system on an Altera/Intel MAX 10 DE10-Lite FPGA. It explores the differences between fabric-based logic and embedded memory blocks through the VHDL implementation of a structural RAM and ROM system.
### Technical Features
- **Dual Memory Architecture:** Manages two different memory types within a single structural hierarchy:
  - **Synchronous RAM:** A 64x4-bit read/write memory block.
  - **Combinatorial ROM:** A 64x4-bit read-only memory featuring a pre-loaded lookup table.
- **Resource Optimization:** Implemented a synchronous register-level read/write processes that allows the Quartus compiler to target the FPGA's on-board M9K memory blocks.
- **Structural VHDL Implementation:** Used a top-level structural entity to interconncet behavioral memory components with hardware-interfacing logic.
- **Memory Mapping & Addressing:** Shared 6-bit address bus ($2^{6} = 64$ elements) for both memory units and controlled via physical toggle switches.
- **Active-Low Control Logic:** Integrated the DE10-Lite pushbuttons for `WEN` (Write-Enable) control that utilizes inverted logic to match the hardware's default high state.
### Hardware
- **Board:** Altera/Intel MAX 10 DE10-Lite FPGA (10M50DAF484C7G)
- **Input:**
  - **Switches:** SW[5:0] for addressing; SW[9:6] for RAM data input.
  - **Pushbuttons:**  KEY[0] for active-low `WEN` with internal pull-up.
- **Output:** HEX0 and HEX1 displays for visualization of RAM and ROM data.
### Software
- Quartus
### Challenge & Solution
The main problem that I faced was ensuring that the RAM implementation utilized the FPGA's dedicated memory resources instead of its logic. At first, I had the memory built using logic elements which is inefficient for larger designs. So, I resolved this issue by moving the `rdata` assignment inside the synchronouse process (`rising_edge(clk)` which forced the synthesis tool to build the necessary registers that would trigger M9K block allocation. This reduced the logic elements used in the design.
### Project Structure
- `Lab10.vhd`: The top-level structural entity that interconnects the RAM, ROM, and HEX encoders.
- `RAM.vhd`: Behavorial VHDL for the synchronous RAM block
- `ROM.vhd`: Behavioral VHDL for the combinatorial ROM block with pre-defined data.
- `hex_encoder.vhd`: Logic for driving 7-segment displays to show 4-bit memory data.
