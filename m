From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: VPN Pass through doesn't work with Fedora Core 4, Why?????
Date: Fri, 22 Jul 2005 16:23:33 +0800
Message-ID: <MDAEMON-F200507221622.AA2217398md50000000031@palettemm.com>
Reply-To: bassam@palettemm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Dear All,

   I used to successfully install the pptp_conntrack_nat from the POM and
compile the kernel of my redhat 9 machine that works as a gateway in order
to enable multiple VPN pass through (VPN NATing) from the clients on the LAN
side to different VPN servers on the WAN side of my redhat 9 box.

Recently I have installed the Fedora Core 4 and has done the same steps that
I used to do previously with my redhat 9 without any problem, but when I
load the following modules after, non of the machines on the LAN side can
establish a VPN connection. So I wonder what are the problem.

$ modprobe ip_conntrack_proto_gre
$ modprobe ip_conntrack_pptp
$ modprobe ip_nat_proto_gre
$ modprobe ip_nat_pptp


Here is what I have done so far:

$ wget http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.12.3.tar.bz2
$ bzip2 -d linux-2.6.12.3.tar.bz2
$ tar -xvf linux-2.6.12.3.tar

$ wget http://www.netfilter.org/files/iptables-1.3.0.tar.bz2
$ bzip2 -d iptables-1.3.0.tar.bz2
$ tar -xvf iptables-1.3.0.tar

$ wget
http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/patch-o-matic-ng-2005
0714.tar.bz2
$ bzip2 -d patch-o-matic-ng-20050714.tar.bz2
$ tar -xvf patch-o-matic-ng-20050714.tar


Now to install the pptp_conntrack_nat only, here what I have done
$ KERNEL_DIR=/usr/src/kernels/linux-2.6.12
IPTABLES_DIR=/usr/src/iptables-1.3.0 ./runme extra    

$ cd /usr/src/kernels/linux-2.6.12
$ make clean
$ make mrproper
$ make xconfig
$ make
$ make bzImage
$ make modules
$ make modules_install
$ cp /usr/src/kernels/linux-2.6.12/arc/i386/boot/bzImage
/boot/bzImage-2.6.12.3
$ cp /usr/src/kernels/linux-2.6.12/System.map /boot/System.map-2.6.12.3
$ cd /boot
$ mkinitrd initrd-2.6.12.3.img 2.6.12.3
$ cd /boot/grub
$ vi menu.lst		#To add another entry in the menu.conf file, save
and exit
$ cd /usr/src/iptables-1.3.0
$ make clean
$ make KERNEL_DIR==/usr/src/kernels/linux-2.6.12
$ make install KERNEL_DIR==/usr/src/kernels/linux-2.6.12
$ reboot			#We choose to boot from the new kernel
linux-2.6.12.3
$ echo 1 > /proc/sys/net/ipv4/ip_forward
$ iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

Till this step there is no problem, the Fedora machine works fine as a
gateway and all the clients can access the Internet and only one machine
(chosen randomly) can establish a VPN connection to a VPN server on the WAN
side.

Now and as usual to enable VPN pass through (VPN NATing) we need to load the
following four modules into the kernel:

$ modprobe ip_conntrack_proto_gre
$ modprobe ip_conntrack_pptp
$ modprobe ip_nat_proto_gre
$ modprobe ip_nat_pptp

After loading these four modules none of the client machines can establish
the VPN connections.


Your help is appreciated to let me know why I am facing this problem.


Regards  
Bassam A. Al-Khaffaf


