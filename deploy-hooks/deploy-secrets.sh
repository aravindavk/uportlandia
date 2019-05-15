
read -p "Ctrl-c now to cancel or to deploy secrets Press [Enter]" reply

echo "Fetching keys..."
aws kms list-keys --region us-east-1

echo "Which key to use?"
read key

echo "Reading key attributes for " $key
aws kms describe-key --key-id $key --region us-east-1

read -p "Ctrl-c now and re-run the script if this is not the correct id, or press [Enter] to proceed"

echo "Set param 1"
read param1

echo "Set param 2"
read param2

aws ssm put-parameter --name "<rename me>" --value $param1 --type "SecureString" --key-id $key --region us-east-1
aws ssm put-parameter --name "<rename me too>" --value $param2 --type "SecureString" --key-id $key --region us-east-1

echo "Done"