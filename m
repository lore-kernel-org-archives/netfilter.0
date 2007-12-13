From: Saravanan Chanemouganandam <schane@osmozis.com>
Subject: iptables v1.3.5: Couldn't load target `MASQUERADE':File not found
Date: Thu, 13 Dec 2007 16:02:03 +0100
Message-ID: <200712131602.04744.schane@osmozis.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi all, 

Iam a newbie to use iptables and I am fascing the following issue with  
iptables v 1.3.5 on my target pxa270 Xscale running linux 2.6.16.

schane:/sbin$ iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
iptables v1.3.5: Couldn't load target `MASQUERADE':File not found

Try `iptables -h' or 'iptables --help' for more information.

schane:/sbin$ iptables -A INPUT -i lo -j ACCEPT
iptables v1.3.5: Couldn't load target `standard':File not found
Try `iptables -h' or 'iptables --help' for more information.

I did google and mail archieve search but couldn't find the exact information 
to fix the problem. To use iptables, I have enabled Core Netfilter 
Configuration, IP Netfilter Configuration built into linux-2.6.16 kernel 
image and cross compiled iptables package using buildroot's 
arm-linux-uclibc-gcc as 

make KERNEL_DIR=/home/pxa270/linux-2.6.16 
CC=/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-gcc 
LD=/home/sara/BuildRoot/buildroot/build_arm/staging_dir/usr/bin/arm-linux-ld
BINDIR=/home/sara/BuildRoot/myrootfs/sbin 
LIBDIR=/home/sara/BuildRoot/myrootfs/lib install

I have also built the netfilter configuration as kernel modules for the test 
and lsmod shows the list of modules loaded , but still the problem persists.
schane:~$ lsmod
Module                  Size  Used by    Not tainted
ipt_MASQUERADE          3296  0
ipt_REJECT              4608  0
ipt_owner               2016  0
ipt_LOG                 6048  0
iptable_nat             7300  0
ip_nat                 15282  2 ipt_MASQUERADE,iptable_nat
iptable_mangle          2400  0
iptable_filter          2528  0
ip_conntrack           51096  3 ipt_MASQUERADE,iptable_nat,ip_nat
nfnetlink               5624  2 ip_nat,ip_conntrack
ip_tables              11464  3 iptable_nat,iptable_mangle,iptable_filter
x_tables               11172  6 
ipt_MASQUERADE,ipt_REJECT,ipt_owner,ipt_LOG,iptable_nat,ip_tables

Can anybody tell me where it went wrong ? 

Thanks
Sara

