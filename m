From: "Federico Cruciani" <f.cruciani@oxys.it>
Subject: Iptables Nat Problem
Date: Sat, 1 Feb 2003 18:12:09 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000001c2ca15$12d750e0$0a00a8c0@oxys.lan>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: pablo@lacnic.net

> Hi,=20
>
>
> Have a 200.40.226.64 /28 net *public NET
> have a 192.168.1.0 /24 net *private NET
>
> have a 200.40.226.66 server running iptables * Is the gateway
>
> have a VoIp box THIS is the PROBLEM.
> i need to put behind the firewall and have the address 192.168.1.33 =
but
> i need to go outside with 200.40.226.69 and received external =
requirements
> with this ip but iptables not function for me. i Put this lines but =
dont
> work i need Route? or something else???
>
>
> echo 1 > /proc/sys/net/ipv4/ip_forward
>.
>.
>.
>
> iptables -t nat -A POSTROUTING -s 192.168.1.33/255.255.255.255 -o eth0
> -j SNAT --to 200.40.226.70
>
> iptables -t nat -A PREROUTING  -s 200.40.226.70/255.255.255.255 -i =
eth0
> -j DNAT --to 192.168.1.33
>
> ## When i put this lines the conecction for .33 down. if possible to
> need some instructions, for route this to my gateway??? #.
> .
>.
>.
> iptables -t nat -A POSTROUTING -o eth0 -j MASQUERADE
> iptables -A FORWARD -j ACCEPT -i eth0 -o eth0 -d 0/0
>
>
> Any help me???? please?
>--=20
>
>Pablo Allietti
>
>LACNIC=20
>

I suppose you have a problem with "proxy-arp".
Your iptables box does not have any interface, physical nor virtual, =
with
the address 200.40.226.70 assigned. As I can understand from your =
message
the only address assigned on the external side of your iptables box is
200.40.226.69.
In this scenario, you need a router in front of your iptables box with a
static route which directs packet for 200.40.226.70 on your external
address.
It could be necessary, or it could be a valid alternative solution, to
announce via arp the address 200.40.226.70 associated with the mac =
address
of your external gateway. To get a working proxy-arp on Linux you have =
to
complete two steps:

- first, publish via arp the address on your external interface. =
Supposing
that eth0 is your external interface and eth1 your internal interface, =
the
command is:
 arp -Ds 200.40.226.70 eth0 pub

- second, put a static route for the address to proxy toward the =
internal
network in which the natted host is. So, for you:
 route add -host 200.40.226.70 dev eth1

(The second step could be necessary even if you have a router in front =
of
your box with the correct routes).

I have a patched version of the /etc/init.d/network script for Red Hat =
Linux
which read the ARP's to publish from a file (/etc/sysconfig/static-arp)
whenever the network or the PC is started or restarted. It's a "working"
patch, so if you are using RH and think my patch could be useful for =
you,
write me and I'll send it to you.
On RH you can put the static route in /etc/sysconfig/static-routes to =
have
it applied every time you start your PC or the network.=20

Let me know if this could help you.

Iok



