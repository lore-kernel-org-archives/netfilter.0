From: "Dennis Cardinale" <dennis@core-enterprises.com>
Subject: RE: Help with invalid argument
Date: Sat, 6 Jul 2002 12:31:21 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <EPEHIDPIPEBFNAHLCHPGKEMFCEAA.dennis@core-enterprises.com>
References: <EPEHIDPIPEBFNAHLCHPGAEMCCEAA.dennis@core-enterprises.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
In-Reply-To: <EPEHIDPIPEBFNAHLCHPGAEMCCEAA.dennis@core-enterprises.com>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Netfilter Mailing List <netfilter@lists.samba.org>

OK...solved my own problem.

userspace/make install all

does not copy the new iptables binaries to the /sbin directory.

Is there a script to do this?  Can I do it manually? Is there a way to do it
so that the binaries used are compatible with the chosen kernel at boot
time?

Thanks.

-----Original Message-----
From: netfilter-admin@lists.samba.org
[mailto:netfilter-admin@lists.samba.org]On Behalf Of Dennis Cardinale
Sent: Friday, July 05, 2002 10:03 PM
To: netfilter@lists.samba.org
Subject: Help with invalid argument


I have Mandrake Linux 8.2 (kernel 2.4.18) installed in a box I use as a
router for my DSL connection.  I use a firewall script that I have been
running since 2.4.3 using netfilter.

Lately, I have had a need to run Netmeeting from behind my router, so I
pom'd the h323 conntrack and rebuilt my kernel.  Here are the steps I used:


cd /usr/src
cp -R linux-2.4.18-6mdk linux-2.4.18-6h323   	#copy old src installation
ln -s linux-2.4.18-6h323 linux		   	#link to new source tree
cd linux
vi Makefile						   	#and change EXTRAVERSION = -6h323
make mrproper					   	#clean (also erases .config)
cp arch/i386/defconfig .config			#restore Mandrake default configuration
make oldconfig
make dep
cd /root/pom/netfilter/userspace			#POM userspace
make patch-o-matic
	apply:	arptables
			config-cleanup
			conntrack+nat-helper-unregister
			ip_conntrack_protocol_unregister
			macro-trailing-semicolon-fix
			nat-export_symbols
			netfilter-arp
			REJECT-don't fragment
			pptp_conntrack_nat		#just in case
			h323_conntrack_nat		#this patch done last
cd /usr/src/linux
make oldconfig						#answer <m>odule for pptp & h323
make dep
make clean
make bzImage && make modules && make modules_install
make install						#Mandrake automated script for setting up /boot & lilo
lilo
cd /root/pom/netfilter/userspace
make install all						#install netfilter stuff

and reboot!

The new kernel boots fine.  Unfortunately, the following happens:

[root@...]# iptables -t nat -A POSTROUTING -o eth0 -s 192.168.10.0/24 -j
SNAT --to-source $INET_IP
iptables: Invalid Argument

The same happens if I change SNAT to MASQUERADE (w/o --to-source).

If I do:

[root@...]# iptables -t nat -I POSTROUTING 1 -o eth0 -s 192.168.10.0/24 -j
SNAT --to-source $INET_IP
iptables: Target Problem

I've spent hours on Google & found similar problems with different targets,
but not exactly this one.  The rest of the firewall script runs fine. This
is the only problem I have.

The following modules are loaded, by the way:

ip_nat_h323
ip_conntrack_h323
ip_nat_ftp
ip_conntrack_ftp
ipt_LOG
ipt_MASQUERADE
iptable_nat
ip_conntrack
iptable_filter
iptable_mangle
ip_tables

Please keep in mind that the SNAT target worked just fine (for a very long
time) until I pom'd the kernel.  Now I can't nat at all, even if I unload
the h323 stuff.  All I can do to make things work is to reboot into the old
kernel.  I would like the get the h323 to work.  All help would be
appreciated.

Thank you,

Dennis Cardinale


