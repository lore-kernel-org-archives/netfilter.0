From: Anders Fugmann <afu@fugmann.dhs.org>
Subject: Re: iptables and permits ports
Date: Thu, 12 Sep 2002 09:02:38 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3D803C0E.4010306@fugmann.dhs.org>
References: <1031772226005316@caramail.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mohamed Nassih <nassihmohamed@caramail.com>
Cc: netfilter@lists.netfilter.org

Mohamed Nassih wrote:
>  Hi,
> 
>  my firewall file is like below, It is work without any 
> problem, today I test to connect to a oracle server via the 
> internet from inside to the port 1521(in outside oracle 
> server), and it is work.
> 
>  Can I have please explanation of this..
Yes. You say that you connect from the "inside". I assume that
you hereby mean a machine located behind the firewall on the lan, and 
has to go through the firewall in order to connect to the internet.

If this is correct, the you can connect because you have no FORWARD 
rules. The packet is masqueraded perfectly, and all replys to the 
connection is routed without problem the the machine on the lan.
You should read: 
http://www.netfilter.org/documentation/tutorials/blueflux/,
and understand how packets traverse the chains.

The INPUT and OUTPUT are only for packets for the server itself and for 
packets originating from the server itself.

> 
> 
> The firewall file :
> 
> /sbin/modprobe iptables iptable_nat 
> /sbin/modprobe ip_conntrack_ftp
> /sbin/modprobe ip_nat_irc
> /sbin/modprobe iptable_filter
> 
> if [ -e /proc/sys/net/ipv4/conf/all/rp_filter ]
> then
> for filtre in /proc/sys/net/ipv4/conf/*/rp_filter
> do
> echo 1 > $filtre
> done
> fi
> 
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_all
> echo 1 > /proc/sys/net/ipv4/icmp_echo_ignore_broadcasts
> 
> iptables -F
> iptables -X
> 
> iptables -t nat -A POSTROUTING -o eth0 -s 10.154.17.0/24 -j 
> MASQUERADE
> 
> iptables -A INPUT -i eth0 -s 199.243.181.226 -j DROP
> 
> iptables -A INPUT -i eth1 -s ! 10.154.17.0/24 -j DROP
> iptables -A INPUT -i eth0 -p tcp ! --syn -m state --state 
> NEW -j DROP
> 
> iptables -A INPUT -i lo -j ACCEPT
> iptables -A OUTPUT -o lo -j ACCEPT
> 
> iptables -A INPUT -m state --state ESTABLISHED,RELATED -j 
> ACCEPT
> 
> iptables -A INPUT -i eth1 -p tcp --destination-port www -j 
> ACCEPT
> iptables -A INPUT -i eth1 -p tcp --destination-port ftp -j 
> ACCEPT
> iptables -A INPUT -i eth1 -p tcp --destination-port ftp-
> data -j ACCEPT
> iptables -A INPUT -i eth1 -p tcp --destination-port smtp -j 
> ACCEPT
> iptables -A INPUT -i eth1 -p tcp --destination-port 110 -j 
> ACCEPT
> iptables -A INPUT -i eth1 -d 198.235.216.131 -p udp --
> destination-port domain -j ACCEPT
> iptables -A INPUT -i eth1 -d 198.235.216.131 -p tcp --
> destination-port domain -j ACCEPT
> iptables -A INPUT -i eth1 -d 198.235.216.130 -p udp --
> destination-port domain -j ACCEPT
> iptables -A INPUT -i eth1 -d 198.235.216.130 -p tcp --
> destination-port domain -j ACCEPT
> 
> iptables -A INPUT -i eth0 -p tcp --destination-port www -j 
> ACCEPT
> iptables -A INPUT -i eth0 -p tcp --destination-port ftp -j 
> ACCEPT
> iptables -A INPUT -i eth0 -p tcp --destination-port ftp-
> data -j ACCEPT
> iptables -A INPUT -i eth0 -p tcp --destination-port smtp -j 
> ACCEPT
> #iptables -A INPUT -i eth0 -p tcp --destination-port 110 -j 
> ACCEPT
> 
> iptables -A INPUT -p tcp --dport 113 -j REJECT --reject-
> with tcp-reset
> 
> iptables -A INPUT -j DROP
> 
> Thanks in advance.
I strongly advice your to start your script with these three commands:
	iptables -P INPUT DROP
	iptables -P FORWARD DROP
	iptables -P OUTPUT DROP

This sets the default policy on all filter chains, meaning that if no 
rule matched the packet, the packet is dropped.

Beware. When you do this, no users on the lan can access the internet,
and the firewall cannot communicate with any other machines, because you 
only accept packets to the loopback interface.

Regards
Anders Fugmann

-- 
Author of FIAIF
FIAIF Is An Intelligent/Iptables Firewall
http://fiaif.fugmann.dhs.org


