From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: marking in output mangle with route lookup
Date: Mon, 14 Jul 2003 07:59:28 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BF02@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: lartc@manchotnetworks.net, netfilter <netfilter@lists.netfilter.org>

Try using iproute2 ip assigning and not ip aliasing as I find =
aliasing=3Devil for some things.

ip addr add 192.168.1.101/24 dev eth1

Also, have you tried using SNAT instead of iproute for a simple snat of =
the source address?

iptables -I POSTROUTING -o eth1 -t nat -s 192.168.1.1 -d 192.168.1.250 =
-j SNAT --to 192.168.1.101

Thanks,
____________________________________________
George Vieira
Systems Manager

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

-----Original Message-----
From: lartc@manchotnetworks.net [mailto:lartc@manchotnetworks.net]
Sent: Sunday, July 13, 2003 5:40 PM
To: netfilter
Subject: marking in output mangle with route lookup


hello all,

i posted this to the lartc forum, and received no response, so i am =
hopeful
that someone here can advise.

i have come accross a curious issue:

+----------------------+            +---------------+
| eth1   192.168.1.1   |------------| 192.168.1.250 |
| eth1:1 192.168.1.101 |            |               |
+----------------------+            +---------------+


iptables --append OUTPUT --table mangle --jump MARK --set-mark 0x2
ip rule add fwmark 0x2 table 2
ip route add 192.168.1.0/24 dev eth1 src 192.168.1.101 table 2
ip route flush cache


telnet 192.168.1.250 ; and tcpdump gives src ip address as 192.168.1.1


ip rule add to 192.168.1.250 table 2
ip route flush cache


telnet 192.168.1.250 ; and tcpdump gives src ip address as 192.168.1.101



are there issues concerning the marking of OUTPUT packets generated on
the local box that i should be aware of?


many, many thanks

charles





