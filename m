From: Manuel Tato <madness@adinet.com.uy>
Subject: Re: voice IP
Date: Mon, 03 Nov 2003 17:55:34 -0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FA6C0C6.9090802@adinet.com.uy>
References: <3FA6B9B8.2040703@adinet.com.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA6B9B8.2040703@adinet.com.uy>
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
To: netfilter@lists.netfilter.org

OK further information

mandrake linux 9.1
kernel 2.4.21

running over a celeron 300 mhz, 64 mb ram + 2 realtek NICs.
tthe voip gateway, has no brand, and i dont have more information...

regards
manuel

pd: gatekeeper its mi solution??

Manuel Tato wrote:

> i have this firewall, i have at 192.168.1.40 a voice ip gateway, i'm=20
> doing portforward to this ip.
> i make phone calls with out major problems, but i can=B4t recive any...
> someone have voip experience trough linux fw/routers?
> thanks in advance
> manuel
>=20
>=20
> #!/bin/bash
> # eth1--> Modem/ADSL
> # eth0--> LAN
> #
> echo 1 > /proc/sys/net/ipv4/ip_forward
> modprobe ipt_MASQUERADE
> modprobe ip_conntrack
> modprobe ip_conntrack_ftp
> modprobe iptable_nat
> modprobe ip_conntrack_h323
> modprobe ip_nat_h323
> #
> iptables -F
> iptables -t nat -F
> iptables -t mangle -F
> iptables -A INPUT -j ACCEPT
> iptables -A FORWARD -j ACCEPT
> iptables -A OUTPUT -j ACCEPT
>=20
> iptables -A FORWARD -p tcp --sport 137:139 -j DROP
> iptables -A FORWARD -p udp --sport 137:139 -j DROP
> #    NFS Mount Service (TCP/UDP 635)
> iptables -A FORWARD -p tcp --sport 635 -j DROP
> iptables -A FORWARD -p udp --sport 635 -j DROP
> #    NFS (TCP/UDP 2049)
> iptables -A FORWARD -p tcp --sport 2049 -j DROP
> iptables -A FORWARD -p udp --sport 2049 -j DROP
> #    Portmapper (TCP/UDP 111)
> iptables -A FORWARD -p tcp --sport 111 -j DROP
> iptables -A FORWARD -p udp --sport 111 -j DROP
> # Block incoming syslog, lpr, rsh, rexec...
> iptables -A FORWARD -i eth1 -p udp --dport syslog -j DROP
> iptables -A FORWARD -i eth1 -p tcp --dport 515 -j DROP
> iptables -A FORWARD -i eth1 -p tcp --dport 514 -j DROP
> iptables -A FORWARD -i eth1 -p tcp --dport 512 -j DROP
> ###
> #
> # NAT
> iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE
> ######
> #####
> #######
> iptables -A FORWARD -p tcp --sport 1719:1789 -j ACCEPT
> iptables -A FORWARD -p udp --sport 1719:1789 -j ACCEPT
>=20
> iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth1 -j DNAT --to=20
> 192.168.1.40:80
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 80 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp --dport 23 -i eth1 -j DNAT --to=20
> 192.168.1.40:23
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 23 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp --dport 161 -i eth1 -j DNAT --to=20
> 192.168.1.40:161
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 161 -j ACCEPT
> iptables -t nat -A PREROUTING -p tcp --dport 1726:1789 -i eth1 -j DNAT=20
> --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p tcp -d 192.168.1.40 --dport 1726:1789 -j=20
> ACCEPT
> iptables -t nat -A PREROUTING -p udp --dport 1726:1789 -i eth1 -j DNAT=20
> --to 192.168.1.40:1726:1789
> iptables -A FORWARD -i eth1 -p udp -d 192.168.1.40 --dport  1726:1789 -j =

> ACCEPT
>=20
>=20
>=20
>=20
>=20
>=20



