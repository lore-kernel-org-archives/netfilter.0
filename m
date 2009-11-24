From: Claus Wimmer <Claus.Wimmer@lrz.de>
Subject: arptables v0.0.8: no hln defined
Date: Tue, 24 Nov 2009 14:01:16 +0100
Message-ID: <4B0BD91C.9090506@lrz.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I am trying to build up a gateway cluster according to the example in
the iptables manpage (see cluster extension). But I am not able to use
the arptables command successfully:


host1:/ # arptables -A OUT -o intern --arhln 6 -j mangle --mangle-hw-s
01:00:5e:11:11:11
arptables v0.0.8: no hln defined
Try `arptables -h' or 'arptables --help' for more information.
host1:/ #


Here comes some system information:

host1:/ # lsmod | grep arp
arpt_mangle             2760  0
arptable_filter         4168  0
arp_tables             20856  1 arptable_filter
x_tables               30096  11
arpt_mangle,arp_tables,xt_mark,xt_cluster,xt_MARK,ipt_LOG,xt_limit,xt_tcpudp,xt_state,ip6_tables,ip_tables

host1:/ # uname -a
Linux host1 2.6.31.5-0.1-default #1 SMP 2009-10-26 15:49:03 +0100 x86_64
x86_64 x86_64 GNU/Linux
host1:/ #

host1:/ # cat /etc/SuSE-release
openSUSE 11.2 (x86_64)
VERSION = 11.2
host1:/ #

host1:/ # rpm -q arptables
arptables-0.0.8-6.1.x86_64
host1:/ # rpm -qi arptables
Name        : arptables                    Relocations: (not relocatable)
Version     : 0.0.8                             Vendor: openSUSE
Release     : 6.1                           Build Date: Mon 19 Oct 2009
08:28:05 PM CEST
Install Date: Fri 20 Nov 2009 03:54:09 PM CET      Build Host: build20
Group       : Productivity/Networking/Security   Source RPM:
arptables-0.0.8-6.1.src.rpm
Size        : 215614                           License: GPL v2 or later
Signature   : RSA/8, Mon 19 Oct 2009 08:28:27 PM CEST, Key ID
b88b2fd43dbdc284
Packager    : http://bugs.opensuse.org
URL         : http://ebtables.sourceforge.net/
Summary     : User Space Tool to Set Up and Maintain ARP Filtering Tables
Description :
arptables is a user space tool used to set up and maintain thetables of
ARP rules in the Linux kernel. These rules inspect the ARPframes.
arptables is similar to the iptables userspace tool, but less
complicated.



Authors:
--------
    Jay Fenlason <fenlason@redhat.com>
    and others
Distribution: openSUSE 11.2



Do I miss something or is there a problem with arptables?


Thanks in advance
Claus Wimmer
