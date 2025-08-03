// top_level_cipher.v
// Main module for the VLSI-based Simple Encryption Algorithm.
// This module integrates the encryption and decryption functionalities.
// Objective: Design a VLSI module to implement a basic encryption algorithm such as XOR-based encryption[cite: 3].

module top_level_cipher (
    input [7:0] data_in,     // Input data (plaintext for encryption)
    input [7:0] cipher_key,  // Key for both encryption and decryption
    output [7:0] encrypted_out, // Output of the encryption process
    output [7:0] decrypted_out  // Output of the decryption process (should match data_in)
);

    // Internal wire to connect the output of encryption to the input of decryption
    wire [7:0] intermediate_ciphertext;

    // Instantiate the encryption module
    // Features: Design the encryption ... modules using basic XOR gates[cite: 6].
    encryption_module u1_encrypt (
        .plaintext(data_in),
        .key(cipher_key),
        .ciphertext(intermediate_ciphertext) // Output ciphertext
    );

    // Instantiate the decryption module
    // Features: Design the ... decryption modules using basic XOR gates[cite: 6].
    decryption_module u2_decrypt (
        .ciphertext(intermediate_ciphertext),
        .key(cipher_key),
        .decrypted_text(decrypted_out) // Output decrypted text
    );

    // Assign the intermediate ciphertext to an output for observation in testbench
    assign encrypted_out = intermediate_ciphertext;

endmodule

// encryption_module.v (Included for completeness in the same file)
// This module performs the XOR-based encryption.
module encryption_module (
    input [7:0] plaintext,
    input [7:0] key,
    output [7:0] ciphertext
);
    assign ciphertext = plaintext ^ key;
endmodule

// decryption_module.v (Included for completeness in the same file)
// This module performs the XOR-based decryption.
module decryption_module (
    input [7:0] ciphertext,
    input [7:0] key,
    output [7:0] decrypted_text
);
    assign decrypted_text = ciphertext ^ key;
endmodule
