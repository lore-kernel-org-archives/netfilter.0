From: "Pierre Gillet" <gpg__gpg@hotmail.com>
Subject: problem with forward/nat
Date: Sun, 07 Mar 2004 04:13:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY1-F168WzqJX7rVGS00004a39@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
Content-Transfer-Encoding: quoted-printable
To: netfilter@lists.netfilter.org
Cc: gpg.gpg@caramail.com

hello,

i have a small private network, 192.168.1.0 on eth1
public network on eth0. the server running a dhcp server for private=20
network.

system: SuSE 9.0Pro, iptables 1.2.8

my script:
echo "1" > /proc/sys/net/ipv4/ip_forward

#vidage des tables
iptables -F
iptables -X

#policies par defaut
iptables -P INPUT DROP
iptables -P OUTPUT DROP
iptables -P FORWARD DROP

#autorise boucle locale

iptables -A OUTPUT -o lo -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 80 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 443 -j ACCEPT
iptables -A OUTPUT -o eth0 -p udp --dport 53 -j ACCEPT
iptables -A OUTPUT -o eth1 -d 192.168.1.0/24 -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 23 -j ACCEPT

iptables -A INPUT -i lo -m state --state RELATED,ESTABLISHED,NEW -j ACCEPT
iptables -A INPUT -i eth0 -p udp --sport 53 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 80 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 443 -j ACCEPT
iptables -A INPUT -i eth1 -s 192.168.1.0/24 -j ACCEPT
iptables -A INPUT -i eth0 -p tcp --sport 23 -j ACCEPT

#forward

iptables -A POSTROUTING -t nat -o eth0 -j MASQUERADE
iptables -A FORWARD -s 192.168.1.0/24 -j ACCEPT -o eth0
#iptables -A FORWARD -i eth0 -o eth0 -m state --state ESTABLISHED,RELATED -=
j=20
ACCEPT

modules are here:
ls /lib/modules/`uname -r`/kernel/net/ipv4/netfilter/
ip_queue.o            ipt_ULOG.o       ipt_pkttype.o
ip_tables.o           ipt_ah.o         ipt_psd.o
arp_tables.o          ipchains.o       ipt_conntrack.o  ipt_state.o
arptable_filter.o     ipfwadm.o        ipt_dscp.o       ipt_string.o
ip_conntrack.o        ipt_DSCP.o       ipt_ecn.o        ipt_tcpmss.o
ip_conntrack_amanda.o ipt_ECN.o        ipt_esp.o        ipt_tos.o
ip_conntrack_ftp.o    ipt_LOG.o        ipt_helper.o     ipt_ttl.o
ip_conntrack_irc.o    ipt_MARK.o       ipt_iplimit.o    ipt_unclean.o
ip_conntrack_tftp.o   ipt_MASQUERADE.o ipt_length.o  iptable_filter.o
ip_nat_amanda.o       ipt_MIRROR.o     ipt_limit.o   iptable_mangle.o
ip_nat_ftp.o          ipt_REDIRECT.o    ipt_mac.o      iptable_nat.o
ip_nat_irc.o          ipt_REJECT.o      ipt_mark.o
ip_nat_snmp_basic.o   ipt_TCPMSS.o      ipt_multiport.o
ip_nat_tftp.o         ipt_TOS.o         ipt_owner.o

problem:
pc firewall can acces on web
pc firewall can acces in private network
private network can acces in pc firewall
private network CAN'T acces on web

i sniff on eth0 and eth1, request from private network are sniffed in eth1 =

but not transmiet on eth0, it cant go out.

can you help / explain to me?

sorry for my very bad english and thank you for your help

Pierre
gpg__gpg@hotmail.com

_________________________________________________________________
Calendrier Pirelli, les top mod=E8les de mars...=20
http://automobile.fr.msn.be/pirelli2004/mars2/


