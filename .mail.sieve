require ["fileinto"];

if address :is "To" "facebook@urbainvaes.com"
{
    fileinto :create "Drafts";
}

else 
{
    keep;
}
