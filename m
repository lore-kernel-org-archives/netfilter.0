From: "Torsten Puls" <debian@pumpum.de>
Subject: AW: SNAT? DNAT? why?
Date: Sun, 6 Apr 2003 14:22:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <DHEJIOOJDPNLNFDGOGMGGEMHCDAA.debian@pumpum.de>
References: <DHEJIOOJDPNLNFDGOGMGMEMFCDAA.debian@pumpum.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DHEJIOOJDPNLNFDGOGMGMEMFCDAA.debian@pumpum.de>
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

 Hello i have an debian-system 3.0, kernel 2.4.18.
>
>
> +-------------+
> +-------------+
> | DSL router  |                                 | ISDN-router |
> | 192.168.0.1 |                                 | 192.168.1.1 |
> +-------------+                                 +-------------+
>        |                                                |
>        |                                                |
>        +-----------+                    +---------------+
>                    |                    |
>              +-----------------------------------+
>              |   eth2                  eth0      |
>              | 192.168.0.10		192.168.1.10 |
>              |                                   |
>              |               eth1                |
>              |          172.16.3.6               |
>              +-----------------------------------+
>                              |
>                              |
>              +-----------------------------------+
>              |     intern net 172.16.3.0/24    |
>
>
 following:
>
> email-traffic via ISDN-router
> www via DSL-router
>
> pstree:
> qmail
> squid
> apache
>
> my firewall skript
> !! SNAT Rules
> Why make it correct?
>
> intern browser => port 3128:eth1
> pop/smtp => eth0
>
>
>
> #!/bin/sh
> route add -net 172.16.1.0/24 gw 172.16.3.2

> ### eth0 Internet
> DTAG_NET="192.168.1.0/24"
> DTAG_INTERFACE="eth0"
> DTAG_IP="192.168.1.10"

> ### eth1 intern
> INTERN_NET="172.16.3.0/24"
> INTERN_INTERFACE="eth1"
> INTERN_IP="172.16.3.6"

> ### eth2 DSL
> DMZ01_NET="192.168.0.0/24"
> DMZ01_INTERFACE="eth2"
> DMZ01_IP="192.168.0.10"
>
### Kernel-Tuning
> echo     1 > /proc/sys/net/ipv4/ip_forward
> echo     1 > /proc/sys/net/ipv4/tcp_syncookies
> echo "8182" > /proc/sys/net/ipv4/ip_conntrack_max
>
> iptables -F INPUT
> iptables -F FORWARD
> iptables -F OUTPUT
> iptables -t nat -F PREROUTING
> iptables -t nat -F OUTPUT
> iptables -t nat -F POSTROUTING
> iptables -t mangle -F PREROUTING
> iptables -t mangle -F OUTPUT
>
> iptables -P FORWARD DROP
> iptables -P INPUT DROP
> iptables -P OUTPUT DROP
>
> iptables -A INPUT -d $DMZ01_IP -m state --state ESTABLISHED,RELATED -j
> ACCEPT
> iptables -A OUTPUT -s $DMZ01_IP -m state --state
> NEW,ESTABLISHED,RELATED -j
> ACCEPT
>
> iptables -A INPUT -d $DTAG_IP -m state --state
> ESTABLISHED,RELATED -j ACCEPT
> iptables -A OUTPUT -s $DTAG_IP -m state --state NEW,ESTABLISHED,RELATED -j
> ACCEPT
>
> iptables -A INPUT -d $INTERN_IP -m state --state
> NEW,ESTABLISHED,RELATED -j
> ACCEPT
> iptables -A OUTPUT -s $INTERN_IP -m state --state
> NEW,ESTABLISHED,RELATED -j
> ACCEPT
>
> iptables -A OUTPUT -o $INTERN_INTERFACE -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
>
> iptables -A INPUT  -i $INTERN_INTERFACE -j ACCEPT
> iptables -A OUTPUT -o $INTERN_INTERFACE -j ACCEPT
>
> iptables -A INPUT   -i $DTAG_INTERFACE   -p TCP --dport 25   -j ACCEPT
> iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 25   -j ACCEPT
> iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 80   -j ACCEPT
> iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 110  -j ACCEPT
> iptables -A INPUT   -i $INTERN_INTERFACE -p TCP --dport 3128 -j ACCEPT
>
> ### SNAT Rules
> #
> #  ????????????????????????????????
> iptables -t nat -A PREROUTING  -i $INTERN_INTERFACE -p  -j DNAT --to
> $DMZ01_IP
> iptables -t nat -A POSTROUTING -o $DTAG_INTERFACE   -s $INTERN_NET      -j
> SNAT --to $DTAG_IP
>
>
> ### EOF
>
>
> #route:
> 192.168.0.10    192.168.0.1     255.255.255.255 UGH   0      0
>     0 eth2
> 192.168.0.0     *               255.255.255.0   U     0      0
>     0 eth0
> 172.16.3.0      *               255.255.255.0   U     0      0
>     0 eth1
> 192.168.0.0     *               255.255.255.0   U     0      0
>     0 eth2
> 172.16.1.0      172.16.3.2      255.255.255.0   UG    0      0
>     0 eth1
> default         192.168.1.1     0.0.0.0         UG    0      0
>     0 eth0
>
> #ip ru ls:
> 0:      from all lookup local
> 32765:  from 192.168.0.10 lookup DSL
> 32766:  from all lookup main
> 32767:  from all lookup default
>
>
> #ip ro ls:
> 192.168.0.10 via 192.168.0.1 dev eth2
> 192.168.1.0/24 dev eth0  proto kernel  scope link  src 192.168.1.10
> 172.16.3.0/24 dev eth1  proto kernel  scope link  src 172.16.3.6
> 192.168.0.0/24 dev eth2  proto kernel  scope link  src 192.168.0.10
> 172.16.1.0/24 via 172.16.3.2 dev eth1
> default via 192.168.1.1 dev eth0
> 111,1
>
>
>
> Help
>
> Torsten
>
>


