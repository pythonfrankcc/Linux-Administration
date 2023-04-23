#!/usr/bin/env bash

# List of servers to run the command on
servers=("server1" "server2" "server3")

# Output file
output_file="/path/to/output/file.txt"

# Loop through the servers and run the command
for server in "${servers[@]}"
do
    # Run the command and save the output to a temporary file
    ssh "$server" "df -h" > /tmp/df_output.txt
    
    # Add the server name to the output
    echo "Server: $server" >> "$output_file"
    
    # Append the output to the output file
    cat /tmp/df_output.txt >> "$output_file"
    
    # Add a separator between each server's output
    echo "====================" >> "$output_file"
    
    # Remove the temporary file
    rm /tmp/df_output.txt
done

#the use of "${servers[@]}" is a bash syntax to expand the array variable "servers"  into a list of values
#In the script, "servers" is an array variable that contains a list of server names. By using "${servers[@]}", the script expands the array into a list of server names. 
#the "@" in this expression means that all the elements of the array will be expanded




#the downside of the above code is that it will keep prompting for a password for the user you are running the script with to circumnagigate this is using public key authentication
#Public key authentication allows you to connect to a remote server without entering a password, by using a private key that is stored on your local machine and a public key that is 
#stored on the remote server


#Here is how you can set up a public key authentication and the modified script to use it

#Generate a public/private key pair on your local machine (if you haven't already done so). You can do this using the ssh-keygen command:
#$ ssh-keygen
#This will generate a public key (id_rsa.pub) and a private key (id_rsa) in your ~/.ssh directory.


#Copy the public key to each remote server that you want to connect to. You can do this using the ssh-copy-id command:
#ssh-copy-id user@server
#This will copy the public key to the remote server and add it to the list of authorized keys for the user.


#Test the connection to make sure it works without a password:
#ssh user@server

#Modify the script to use ssh with public key authentication:

#!/usr/bin/env bash

# List of servers to run the command on
servers=("server1" "server2" "server3")

# Output file
output_file="/path/to/output/file.txt"

# Loop through the servers and run the command
for server in "${servers[@]}"
do
    # Run the command and save the output to a temporary file
    ssh -i /path/to/private/key user@"$server" "df -h" > /tmp/df_output.txt
    
    # Add the server name to the output
    echo "Server: $server" >> "$output_file"
    
    # Append the output to the output file
    cat /tmp/df_output.txt >> "$output_file"
    
    # Add a separator between each server's output
    echo "====================" >> "$output_file"
    
    # Remove the temporary file
    rm /tmp/df_output.txt
done

#the ssh -i command is used to specify the path to the private key file that you generated earlier.
#The use of public key authentication can make the script more convenient to use, especially if you need to run it frequently or on a large number of servers.This is as opposed to password authentication

#public key management is generally considered safer as opposed to password authentication but here are among the downsides:
#Complexity, Key management, Revocation: In the case where your keys are compromised, you need to revoke the private key and remove the public key from the servers that you had initially out it on
#Compatibility issues since public key authentication may not be supported by all servers
