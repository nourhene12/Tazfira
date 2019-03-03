function xaffiche
{
echo "donner le nom du fichier"
read fichier
dpkg --get-selections '*' >$fichier
}
