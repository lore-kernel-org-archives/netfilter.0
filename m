From: Ramin Alidousti <ramin@cannon.eng.us.uu.net>
Subject: Re: Requestion for help with GRE tunnel
Date: Tue, 18 Jun 2002 10:07:03 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <20020618140703.GJ22025@cannon.eng.us.uu.net>
References: <20020618063945.A2662@inxservices.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.samba.org>
Content-Disposition: inline
In-Reply-To: <20020618063945.A2662@inxservices.com>
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
Content-Transfer-Encoding: 7bit
To: George Garvey <tmwg-netfilter@inxservices.com>
Cc: netfilter@lists.samba.org

Do 192.168.1.12 and 192.168.2.2 connected through a router.
From your email below it looks like they go through a switch.
If that's the case, then it's your problem:

	You should be able to ping the encapsulating IP's of
	your tunnel from the other side to make sure that you
	have IP connectivity which is "the" requirement for
	setting up a tunnel. Can you?o

Ramin



On Tue, Jun 18, 2002 at 06:39:45AM -0700, George Garvey wrote:

>    I'm trying to make a tunnel between 2 LANs, 192.168.1 and 192.168.2.
> Eventually over the internet, right now between 2 computers. Both
> 2.4.19.
>    Everything is hooked up to a gigE switch right now. I've set the
> tunnel's IPs to LAN addresses for testing.
>    When the iproute2 commands are done, ip route get to the LAN on the
> other side of the tunnel shows the tunnel.
>    I can ping the IP address of the tunnel.
>    When I try to ping or traceroute to the other LAN, I get sendto:
> Operation not permitted.
>    What am I misunderstanding? I know this is probably stupid to
> everyone but me, but I'd appreciate assistance.
> 
>    These are the commands I'm using, which aren't working.
> 
> 192.168.1:
> 	This is the local LAN that already exists
> /sbin/ip link set dev eth0 up mtu 1500
> /sbin/ip address add 192.168.1.12/24 broadcast 192.168.1.255 dev eth0
> 	This is an SDSL
> /sbin/ip link set dev eth1 up
> /sbin/ip address add 66.134.162.140/29 broadcast 66.134.162.143 dev eth1
> 	This is an ADSL
> /sbin/ip link set dev eth2 up
> /sbin/ip address add 63.193.79.19/29 broadcast 63.193.79.23 dev eth2
> 
> /sbin/ip link set dev lo up
> /sbin/ip address add 127.0.0.1/8 broadcast + dev lo
> 	The ADSL is too busy to use for NAT
> /sbin/ip route add default via 63.193.79.17 dev eth2
> 	The tunnel
> /sbin/ip tunnel add withsales mode gre remote 192.168.2.2 local 192.168.1.12 ttl 255 dev eth0
> /sbin/ip link set withsales up
> /sbin/ip address add 192.168.2.1/24 broadcast + dev withsales
> 	While testing, I've had the firewall off, just NAT
> /sbin/iptables -P INPUT ACCEPT
> /sbin/iptables -F INPUT
> /sbin/iptables -P OUTPUT ACCEPT
> /sbin/iptables -F OUTPUT
> /sbin/iptables -P FORWARD DROP
> /sbin/iptables -F FORWARD
> /sbin/iptables -F -t nat
> /sbin/iptables -L -n
> /sbin/iptables -X
> /sbin/iptables -Z
> /sbin/iptables -A FORWARD -i eth2 -o eth0 -m state --state ESTABLISHED,RELATED -j ACCEPT
> /sbin/iptables -A FORWARD -i eth0 -o eth2 -j ACCEPT
> /sbin/iptables -A FORWARD -j DROP
> /sbin/iptables -t nat -A POSTROUTING -o eth2 -j SNAT --to 63.193.79.19
> 
> 192.168.2:
> 	This is the new LAN
> /sbin/ip link set dev eth0 up mtu 1500
> /sbin/ip address add 192.168.2.2/24 broadcast 192.168.2.255 dev eth0
> 	This will be an ADSL, currently hooked up to gigE switch
> /sbin/ip link set dev eth1 up
> /sbin/ip address add 67.113.82.198/29 broadcast 67.113.82.202 dev eth1
> 
> /sbin/ip link set dev lo up
> /sbin/ip address add 127.0.0.1/8 broadcast + dev lo
> 
> /sbin/ip route add default via 67.113.82.198 dev eth1
> 
> /sbin/ip tunnel add withsales mode gre remote 192.168.1.12 local 192.168.2.2 ttl 255 dev eth0
> /sbin/ip link set withsales up
> /sbin/ip address add 192.168.1.10/24 broadcast + dev withsales

