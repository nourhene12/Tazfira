function xliste
{
echo "entrez le nom du paquet"
read nom
dpkg --list $nom
}
