From: Myxomop <myxomopmeister@gmail.com>
Subject: Multiple ISP connection balancing
Date: Thu, 24 Aug 2006 11:32:19 +0600
Message-ID: <1156397539.3014.4.camel@localhost.localdomain>
Reply-To: myxomopmeister@gmail.com
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

Hi everybody!

I'm totally new to both linux and iptables.

I have multiple connections to the internet, and I want to unite them to
get better summary bandwidth. I've searched the internet, and found that
in recent past that was done with iptables by masquerading and packet
balancing schemes like random and round-robin.

The problem is I cannot make neither of modules nth and random work.
With every argument different from --help for random and nth I get
"Invalid argument" for iptables 1.3.0 and "Unknown error" with a very
large number for version 1.3.5. Other modules work just as well as they
have to.

I've tried different versions both of POM and iptables, but that did
not help. I also tried to compile kernel modules both statically and as
modules, loading them all, but that didn't seem to help either.

And can anyone explain me what libraries in /usr/local/lib/iptables/
for?

I'm using kernel 2.6.17.6 from kernel.org with Fedora3 distributive.

Here comes my loaded modules:

nfnetlink 6936 0
ipt_ULOG 8224 0
ipt_TTL 2432 0
ipt_ttl 2048 0
ipt_TOS 2304 0
ipt_tos 1792 0
ipt_TCPMSS 4352 0
ipt_SAME 2432 0
ipt_REJECT 5376 0
ipt_REDIRECT 2304 0
ipt_recent 11404 0
ipt_owner 2176 0
ipt_nth 2464 0
ipt_NETMAP 2176 0
ipt_MASQUERADE 3456 0
ipt_LOG 6784 0
ipt_iprange 1920 0
ipt_hashlimit 9224 0
ipt_ECN 3200 0
ipt_ecn 2432 0
ipt_DSCP 2432 0
ipt_dscp 1792 0
ipt_ah 2048 0
ipt_addrtype 2048 0
iptable_raw 2176 0
iptable_nat 7684 0
iptable_mangle 3072 0
ip_queue 10400 0
ip_nat_tftp 1920 0
ip_nat_pptp 6148 0
ip_nat_irc 2816 0
ip_nat_ftp 3584 0
ip_nat_amanda 2432 0
ip_nat 16692 10
ipt_SAME, ipt_REDIRECT, ipt_NETMAP, ipt_MASQUERADE, iptable_nat,
ip_nat_tftp, ip_nat_pptp, ip_nat_irc, ip_nat_ftp, ip_nat_amanda
ip_conntrack_tftp 4500 1 ip_nat_tftp
ip_conntrack_pptp 10896 1 ip_nat_pptp
ip_conntrack_irc 6808 1 ip_nat_irc
ip_conntrack_ftp 7580 1 ip_nat_ftp
ip_conntrack_amanda 4744 1 ip_nat_amanda
arpt_mangle 2816 0
arptable_filter 2304 0
arp_tables 11992 1 arptable_filter
ipt_random 2176 0
iptable_filter 3072 0
ip_tables 13912 4
iptable_raw, iptable_nat, iptable_mangle, iptable_filter
x_tables 14212 28
ipt_ULOG, ipt_TTL, ipt_ttl, ipt_TOS, ipt_tos, ipt_TCPMSS, ipt_SAME,
ipt_REJECT, ipt_REDIRECT, ipt_recent, ipt_owner, ipt_nth, ipt_NETMAP,
ipt_MASQUERADE, ipt_LOG, ipt_iprange, ipt_hashlimit, ipt_ECN, ipt_ecn,
ipt_DSCP, ipt_dscp, ipt_ah, ipt_addrtype, iptable_nat, arpt_mangle,
arp_tables, ipt_random, ip_tables
tun 11392 1
ppp_deflate 6272 1
zlib_deflate 21536 1 ppp_deflate
ppp_async 11392 1
crc_ccitt 2176 1 ppp_async
ppp_generic 24724 6 ppp_deflate, ppp_async
slhc 7680 1 ppp_generic
autofs4 21636 2
rfcomm 37528 0
l2cap 24324 5 rfcomm
bluetooth 48612 4 rfcomm, l2cap
sunrpc 154916 1
vfat 13184 1
fat 52252 1 vfat
nls_utf8 2176 3
ntfs 107508 3
video 14980 0
button 6544 0
nvidia 4549460 12
uhci_hcd 23052 0
ehci_hcd 30472 0
i2c_viapro 8852 0
i2c_core 21904 10
nvidia, i2c_viapro, b2c2_flexcop, mt352, mt312, bcm3510, stv0299,
stv0297, nxt200x, lgdt330x
sk98lin 160224 0
8139too 26240 0
mii 5888 1 8139too
floppy 60524 0
ext3 134408 2
jbd 57876 1 ext3
sata_via 8324 7
libata 70028 1 sata_via
sd_mod 18320 8
scsi_mod 98028 2 libata, sd_mod

I'll be very glad if you can guess the problem; and if patch-o-matic
method has become obsolete, I'd like to here how the problem is solved
nowadays.

Regards, Myxomop







