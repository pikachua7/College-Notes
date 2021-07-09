#include <stdio.h>
#include <stdlib.h>

void main()
{
system("free -g");
system("sudo mkdir /mnt/ramdisk");
system("sudo mount -t tmpfs -o size=500m tmpfs /mnt/ramdisk");
system("sudo cp cal /mnt/ramdisk");
system("sudo cp input.txt /mnt/ramdisk");
//system("sudo cp output.txt /mnt/ramdisk6");
}
