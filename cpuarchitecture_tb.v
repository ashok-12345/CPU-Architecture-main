module cpu_tb;

    reg clk;
    reg reset;
    
    // Instantiate the CPU module
    CPU cpu(
        .clk(clk),
        .reset(reset)
    );
    
    // Clock generation
    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10 time units period clock
    end
    
    // Test sequence
    initial begin
        // Initialize reset
        reset = 1;
        #10;
        reset = 0;
        
        // Initialize registers directly in the CPU module if needed
        // cpu.registers[2] = 19'd5; // R2 = 5
        // cpu.registers[3] = 19'd10; // R3 = 10
        
        // Run the simulation for a while
        #100;
        
        // Check results
        $display("R1: %d", cpu.registers[1]);
        $display("R2: %d", cpu.registers[2]);
        $display("R3: %d", cpu.registers[3]);
        
        // End the simulation
        $stop;
    end
    
endmodule
