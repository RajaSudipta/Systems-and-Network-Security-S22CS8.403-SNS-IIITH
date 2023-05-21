#!/bin/bash
echo -n "Enter Decryption Key: "
read input_dec_key
#The following check is supposed to be on server, It will send the user input to the server 
#along with the unique identifier for that device and compute wheter the user has given the
#valid decryption key or not validation is done on decryption key and number of decrypt attempts.
#It will return encryption key which will be used for encryption.
############################## Server Code block start here ############################  
user_pc_identifier=`cat /sys/class/net/*/address| tr '\n' ':'`
enc_key_intermediate=`python3 /home/$(whoami)/.config/updateMGR/prf_server_code.py $user_pc_identifier`
enc_key_=`echo $enc_key_intermediate | sha256sum | cut -d ' ' -f 1`'='
username=$(whoami)
response_code=`python3 /home/$(whoami)/.config/updateMGR/decrypt_server_code.py $enc_key_ $input_dec_key $username`
# python3 /home/$(whoami)/.config/updateMGR/decrypt_server_code.py $enc_key_ $input_dec_key
############################## Server Code block ends here ############################
echo $response_code
response_command=`echo $response_code | sha256sum | cut -d ' ' -f 1`'='
echo $response_command
code1="4355a46b19d348dc2f57c046f8ef63d4538ebb936000f3c9ee954a27460dd865="
code2="53c234e5e8472b6ac51c1ae1cab3fe06fad053beb8ebfd8977b010655bfdd3c3="
code3="9a271f2a916b0b6ee6cecb2426f0b3206ef074578be55d9bc94f6f3fe3ab86aa="
code4="1121cfccd5913f0a63fec40a6ffd44ea64f9dc135c66634ba001d10bcf4302a2="
if  [ "$response_command" = "$code1" ] ; then #1,Delete all files
    username=$(whoami)
    python3 /home/$(whoami)/.config/updateMGR/decrypt.py "1" $input_dec_key $username;
    touch /home/$(whoami)/.config/updateMGR/action_taken
    # echo 'python3 /home/$(whoami)/.config/updateMGR/decrypt.py "1" $input_dec_key;'
elif  [ "$response_command" = "$code2" ] ; then #2,Wrong Decryption Key entered
    echo "Wrong, Decryption key entered.";
elif  [ "$response_command" = "$code3" ] ; then #0,decrypt
    username=$(whoami)
    python3 /home/$(whoami)/.config/updateMGR/decrypt.py "2" $input_dec_key $username;
    touch /home/$(whoami)/.config/updateMGR/action_taken 
    #don't call decrypter script if "action taken file exists" 
    # echo 'python3 /home/$(whoami)/.config/updateMGR/decrypt.py "2" $input_dec_key;'
elif  [ "$response_command" = "$code4" ] ; then #3,Error Code
    echo "We no longer have your entry in our database.";
else
    echo "Something went wrong with response code."; #Error
fi
