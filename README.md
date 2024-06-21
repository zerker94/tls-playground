# Building TLS Client and Server Examples

To build the TLS client and server examples demonstrating the use of the extended key update, follow these steps:

## Steps

1. **Build Strongswan:**
    - Run `build_strongswan.sh`, which downloads and builds Strongswan. This tool is convenient for creating certificates. Although you could use OpenSSL tools, the Strongswan tool offers a more user-friendly experience.

2. **Build Mbed TLS:**
    - Run `build_mbedtls.sh` to build the Mbed TLS stack and examples.
    - **Note:** You need to fork my repository as described in the script. You also need to update the script to include the URL of your repository. The script then uses the appropriate branch to access the baseline code. Additional details about the code are provided below.

3. **Generate Certificates:**
    - Run `generate_certs.sh` to generate the certificates needed for client-server interaction.

4. **Start the Server:**
    - Open one terminal and run `start_server.sh`. This script includes the command to start the server from the build folder.

5. **Start the Client:**
    - Open another terminal and run `start_client.sh` to start the TLS client.

Both the server and client are configured to start with a high debug level to provide detailed debugging information.

## About This Exercise

The goal is to enhance the code to support the extended key update functionality described in [this draft specification](https://hannestschofenig.github.io/tls-key-update/draft-tschofenig-tls-extended-key-update.html).

You don't need to implement everything in the specification. Choose something that makes sense to you. Examples include:

- Adding Diffie-Hellman to the post-handshake Key Update (which is described in the not-yet-published draft above)
- Including the negotiation of Post-quantum cryptographic algorithms in the initial handshake, as described in [this draft](https://www.ietf.org/archive/id/draft-connolly-tls-mlkem-key-agreement-01.html)
- Including the Hybrid algorithm in the initial handshake, as described in [this draft](https://datatracker.ietf.org/doc/html/draft-ietf-tls-hybrid-design)
- Using PQC in the post-handshake key update
- Negotiating the extension, as described in [this draft](https://datatracker.ietf.org/doc/draft-ietf-tls-tlsflags/)

Note: The current code in the repo does not enable the application traffic secrets - it currently only computes them. 

## Key Files

You will likely need to make changes to these two files:

- `library/ssl_tls13_client.c`
- `library/ssl_tls13_server.c`

These files contain the TLS 1.3 client and server library code. At the bottom of these files, I have already added code to exchange a simple key update message sent by the client and processed by the server to help you get started. You can see the debug output when you run the server and the client program. 

The sample client and server implementations executed with `start_client.sh` and `start_server.sh` scripts are found in `programs/ssl/ssl_client2.c` and `programs/ssl/ssl_server2.c`.

Note: If you want to re-build the code (in case you made updates to the code), you need to run (at least) make in the debug directory again.

## Configuration

As is common with embedded development, there is a configuration file in `include/mbedtls/mbedtls_config.h`. This file includes C pre-processor directives that guide the build process and, depending on the settings, include or exclude certain TLS extensions. I have created reasonable settings and you might not need to touch this file.

## Final Tips

I recommend building these scripts in a virtual machine on your machine and using your favorite text editor to modify them. Examples of editors used for development include Eclipse and Visual Studio Code, but you can use any text editor you prefer.

I wish you a lot of fun with this exercise.

**PS:** Don't give up when you encounter the first problem. After making some progress, you will better understand how to work with larger, open-source software projects, navigate bigger projects, and read specifications.
