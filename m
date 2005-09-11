From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Route packets from an interface to another
Date: Sun, 11 Sep 2005 16:34:51 -0500
Message-ID: <200509111634.51592.rob0@gmx.co.uk>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<200509092345.40386.rob0@gmx.co.uk> <43258442.4000009@wildcash.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <43258442.4000009@wildcash.com>
Content-Disposition: inline
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

On Monday 2005-September-12 08:36[1], Rudi Starcevic is planning to 
write:
> I do something like this with the script below.

You're using NAT. I don't see the similarity. What the OP was talking 
about doing, and what I did, was to implement a remote IP address 
(routable, not RFC 1918) through an openvpn connection using proxy ARP 
and multiple routing tables. You're using multiple routing tables, but 
that's all the similarity I can see.

Unfortunately, the matter as previously posted really came down to be 
off-topic for this list. I'm not using any special iptables rules, be 
they mangle, nat nor filter tables. This is on topic at the OpenVPN 
users list (where I did post it) and perhaps also at LARTC.

> Please let me know if you see a better way to do this
> than I am using below.

I don't really know what you're doing!

> echo "Flushing NICs"
> ip addr flush eth0
> ip addr flush eth1
>
> ip link set eth0 down
> ip link set eth1 down
>
> ip link set eth0 up
> ip link set eth1 up
>
> echo "Flushing NetFilter"
> iptables -F
> iptables -t nat -F
>
> echo "Routing Tables:"
> cat /etc/iproute2/rt_tables

You have added "inet" and "implan" tables, but we don't know what they 
are nor what they are used for.

> echo "Setup NIC 0"
> ip addr add 192.168.2.7/24 dev eth0 brd +
>
> echo "Setup NIC 1"
> ip addr add 192.168.3.7/24 dev eth1 brd +

> echo "Setup Default Route [ inet table ]"
> ip route add default via 192.168.2.1 proto static table inet
>
> echo "Setup LAN Route [ implan table ]"
> ip route add 192.168.3/24 via 192.168.3.7 proto static table implan

Clues here. Looks like eth0 goes to a NAT router on 192.168.2.1, and 
eth1 goes to a LAN (which is double-SNAT'ed out eth0.)

> echo "Setup LAN ip rule"
> ip rule add to 192.168.3/24 prio 16000 table implan
>
> echo "Setup Internet ip rule"
> ip rule add to 0/0 prio 17000 table inet
>
> echo "Enable Kernel Forwarding"
> echo "1" > /proc/sys/net/ipv4/ip_forward
>
> echo "Enable NetFilter Forwarding"
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE

MASQUERADE is a form of source NAT, not forwarding, strictly speaking. 
It's useful to understand the difference. Furthermore it's not 
appropriate in this case, where (I presume) you have a static IP on 
eth0. (If not, you probably should.)

And the whole purpose is unclear. If you've got a NAT router on eth0, 
why not connect your LAN to that? Why the extra hop?

> echo "Flushing ip route cache"
> ip route flush cache



[1] "Date: Mon, 12 Sep 2005 06:36:02 -0700" is still in the future at 
this writing.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

