From: "Bassam A. Al-Khaffaf" <bassam@palettemm.com>
Subject: RE: VPN Pass through doesn't work with Fedora Core 4, Why?????
Date: Mon, 25 Jul 2005 09:49:30 +0800
Message-ID: <MDAEMON-F200507250948.AA4808765md50000000046@palettemm.com>
References: <5c68515305072204353d0ccf90@mail.gmail.com>
Reply-To: bassam@palettemm.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5c68515305072204353d0ccf90@mail.gmail.com>
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
To: 'Robb Bossley' <robb.bossley@gmail.com>
Cc: netfilter@lists.netfilter.org

Yes I have already chosen the required options in the xconfig or menuconfig.
The steps are:

$ make xconfig
Network Support
	Networking Options
		Network Packet Filtering
			IP: Netfilter Configuration
				GRE Protocol Support
				PPTP Protocol Support

This is the required option selection after patching the POM. They are
normal steps where I used to do it in Redhat 9.
After compiling the kernel successfully and load the four modules
(ip_conntrack_proto_gre, ip_conntrack_pptp, ip_nat_proto_gre and
ip_nat_pptp) by using the command modprobe, I couldn't establish the VPN
pass through. PLEASE READ MY FIRST POST.

Your help is much appreciated

Regards
Bassam


-----Original Message-----
From: Robb Bossley [mailto:robb.bossley@gmail.com] 
Sent: Friday, July 22, 2005 7:36 PM
To: bassam@palettemm.com
Subject: Re: VPN Pass through doesn't work with Fedora Core 4, Why?????

Can we assume that you are doing a "make menuconfig" and selecting the
proper options as modules?  That is a critical step I do not see
listed.

On 7/22/05, Bassam A. Al-Khaffaf <bassam@palettemm.com> wrote:
> Dear All,
> 
>    I used to successfully install the pptp_conntrack_nat from the POM and
> compile the kernel of my redhat 9 machine that works as a gateway in order
> to enable multiple VPN pass through (VPN NATing) from the clients on the
LAN
> side to different VPN servers on the WAN side of my redhat 9 box.
> 
> Recently I have installed the Fedora Core 4 and has done the same steps
that
> I used to do previously with my redhat 9 without any problem, but when I
> load the following modules after, non of the machines on the LAN side can
> establish a VPN connection. So I wonder what are the problem.
> 
> $ modprobe ip_conntrack_proto_gre
> $ modprobe ip_conntrack_pptp
> $ modprobe ip_nat_proto_gre
> $ modprobe ip_nat_pptp
> 
> 
> Here is what I have done so far:
> 
> $ wget http://www.kernel.org/pub/linux/kernel/v2.6/linux-2.6.12.3.tar.bz2
> $ bzip2 -d linux-2.6.12.3.tar.bz2
> $ tar -xvf linux-2.6.12.3.tar
> 
> $ wget http://www.netfilter.org/files/iptables-1.3.0.tar.bz2
> $ bzip2 -d iptables-1.3.0.tar.bz2
> $ tar -xvf iptables-1.3.0.tar
> 
> $ wget
>
http://ftp.netfilter.org/pub/patch-o-matic-ng/snapshot/patch-o-matic-ng-2005
> 0714.tar.bz2
> $ bzip2 -d patch-o-matic-ng-20050714.tar.bz2
> $ tar -xvf patch-o-matic-ng-20050714.tar
> 
> 
> Now to install the pptp_conntrack_nat only, here what I have done
> $ KERNEL_DIR=/usr/src/kernels/linux-2.6.12
> IPTABLES_DIR=/usr/src/iptables-1.3.0 ./runme extra
> 
> $ cd /usr/src/kernels/linux-2.6.12
> $ make clean
> $ make mrproper
> $ make xconfig
> $ make
> $ make bzImage
> $ make modules
> $ make modules_install
> $ cp /usr/src/kernels/linux-2.6.12/arc/i386/boot/bzImage
> /boot/bzImage-2.6.12.3
> $ cp /usr/src/kernels/linux-2.6.12/System.map /boot/System.map-2.6.12.3
> $ cd /boot
> $ mkinitrd initrd-2.6.12.3.img 2.6.12.3
> $ cd /boot/grub
> $ vi menu.lst           #To add another entry in the menu.conf file, save
> and exit
> $ cd /usr/src/iptables-1.3.0
> $ make clean
> $ make KERNEL_DIR==/usr/src/kernels/linux-2.6.12
> $ make install KERNEL_DIR==/usr/src/kernels/linux-2.6.12
> $ reboot                        #We choose to boot from the new kernel
> linux-2.6.12.3
> $ echo 1 > /proc/sys/net/ipv4/ip_forward
> $ iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> 
> Till this step there is no problem, the Fedora machine works fine as a
> gateway and all the clients can access the Internet and only one machine
> (chosen randomly) can establish a VPN connection to a VPN server on the
WAN
> side.
> 
> Now and as usual to enable VPN pass through (VPN NATing) we need to load
the
> following four modules into the kernel:
> 
> $ modprobe ip_conntrack_proto_gre
> $ modprobe ip_conntrack_pptp
> $ modprobe ip_nat_proto_gre
> $ modprobe ip_nat_pptp
> 
> After loading these four modules none of the client machines can establish
> the VPN connections.
> 
> 
> Your help is appreciated to let me know why I am facing this problem.
> 
> 
> Regards
> Bassam A. Al-Khaffaf
> 
> 
> 


-- 
As if you could kill time without injuring eternity.  The mass of men
live lives of quiet desperation.
- Henry David Thoreau



-- 
No virus found in this incoming message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.9.2/55 - Release Date: 7/21/2005


