From: "Torsten Puls" <debian@pumpum.de>
Subject: ROUTE.patch
Date: Tue, 20 May 2003 16:03:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001201c31ed8$8d422f40$4a01a8c0@main.luenecom.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hello,

I try to compile the kernel with the Route.patch.

#cd /usr/src/linux
#wget http://www.netfilter.org/files/patch-o-matic-20030701.tar.bz2
#bunzip patch-o-matic-20030702.tar.bz2
#tar -xvf patch-o-matic-20030701.tar
#cd patch-o-matic-20030701
#KERNEL_DIR=/usr/src/linux ./runme extra

So far all is OK.

Then I configure the kernel.
#make menuconfig
Networking options ---> IP: Netfilter Configuration  ---> <M>   ROUTE target
support
and other
Exit.

So far all is OK.

#make dep clean bzImage modules modules_install
20 minutes later.
cp arch/i386/boot/bzImage /boot/vmlinuz
cp System.map /boot/System.map
lilo
reboot

So far all is OK.

But then:

#ls /lib/iptables/
here a many libipt_*.so but not libipt_ROUTE.so
Why?
#modconf
kernel/net/ipv4/netfilter =>
ipt_MASQUERADE     + MASQUERADE target support
ipt_REDIRECT       + REDIRECT target support
ipt_REJECT         + REJECT target support
ipt_ROUTE          + (No description available)  <===   please look here
ipt_TCPMSS         + TCPMSS target support
ipt_TOS            + TOS target support

What di I make wrong?


By the way: I use Debian Woody 3.0 Kernel 2.4.18 or 20

Please help.

Greetings Torsten



