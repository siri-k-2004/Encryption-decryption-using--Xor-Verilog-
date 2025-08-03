// top_level_cipher_testbench.v
// Test Bench for the top_level_cipher (VLSI-based Simple Encryption Algorithm)
// Objective: Simulate the encryption and decryption processes to understand cryptographic systems at the hardware level.
// Tools: Verilog for design, ModelSim for simulation[cite: 9].

module top_level_cipher_testbench;

    // Test bench signals to drive the main module inputs
    reg [7:0] test_data_in;    // Plaintext input
    reg [7:0] test_cipher_key; // Encryption/decryption key [cite: 7]

    // Wires to capture the main module outputs
    wire [7:0] test_encrypted_out;  // Ciphertext output
    wire [7:0] test_decrypted_out;  // Decrypted plaintext output

    // Instantiate the top_level_cipher module
    top_level_cipher uut_cipher (
        .data_in(test_data_in),
        .cipher_key(test_cipher_key),
        .encrypted_out(test_encrypted_out),
        .decrypted_out(test_decrypted_out)
    );

    // Initial block for stimulus generation and monitoring
    initial begin
        // Display header for simulation output
        $display("--------------------------------------------------------------------------------------------------------------------");
        $display("Time  | Plaintext (Hex/Dec) | Key (Hex/Dec) | Ciphertext (Hex/Dec) | Decrypted (Hex/Dec) | Match? | Notes");
        $display("--------------------------------------------------------------------------------------------------------------------");

        // Monitor signals for detailed output at each change
        // Features: Simulate the encryption and decryption process using Verilog[cite: 8].
        $monitor("%0t ns | 0x%h (%03d)         | 0x%h (%03d)     | 0x%h (%03d)          | 0x%h (%03d)       | %s    | %s",
                 $time, test_data_in, test_data_in,
                 test_cipher_key, test_cipher_key,
                 test_encrypted_out, test_encrypted_out,
                 test_decrypted_out, test_decrypted_out,
                 (test_data_in == test_decrypted_out) ? "YES" : "NO ",
                 (test_data_in == test_decrypted_out) ? "Decryption successful." : "ERROR: Decryption failed!");

        // Test Case 1: Basic ASCII character encryption
        test_data_in = 8'h41; // ASCII 'A'
        test_cipher_key = 8'hF0;
        #10; // Wait for 10 time units for signal propagation

        // Test Case 2: Different data, same key
        test_data_in = 8'h65; // ASCII 'e'
        // Key remains 8'hF0
        #10;

        // Test Case 3: Same data, different key
        test_data_in = 8'h41; // ASCII 'A' again
        test_cipher_key = 8'h0F; // New key
        #10;

        // Test Case 4: Data = all zeros
        test_data_in = 8'h00;
        test_cipher_key = 8'hAA;
        #10;

        // Test Case 5: Data = all ones
        test_data_in = 8'hFF;
        test_cipher_key = 8'h55;
        #10;

        // Test Case 6: Key = all zeros (ciphertext should be same as plaintext)
        test_data_in = 8'hC3;
        test_cipher_key = 8'h00;
        #10;

        // Test Case 7: Key = all ones (ciphertext should be bitwise NOT of plaintext)
        test_data_in = 8'h33;
        test_cipher_key = 8'hFF;
        #10;

        // Test Case 8: Random data and key for robustness check
        repeat (5) begin // Run 5 times with random values
            test_data_in = $urandom_range(0, 255); // Random 8-bit value
            test_cipher_key = $urandom_range(0, 255); // Random 8-bit value
            #10;
        end

        // End the simulation
        $display("--------------------------------------------------------------------------------------------------------------------");
        $display("Simulation Finished.");
        $finish;
    end

endmodule
