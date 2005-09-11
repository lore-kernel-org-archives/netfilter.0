From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Fwd: Route packets from an interface to another
Date: Sun, 11 Sep 2005 17:32:12 -0400
Message-ID: <65aa6af90509111432525f4bd6@mail.gmail.com>
References: <1224.83.227.26.235.1126295484.squirrel@webmail.2lug.se>
	<200509091636.37287.rob0@gmx.co.uk>
	<2646.83.227.27.100.1126300683.squirrel@webmail.2lug.se>
	<200509092345.40386.rob0@gmx.co.uk> <43258442.4000009@wildcash.com>
	<65aa6af905091114314108597e@mail.gmail.com>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <65aa6af905091114314108597e@mail.gmail.com>
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

What is it you want to achieve? I don't see any firewall configuration
at all.... your route is wide open... so to speak.

In case you want to enable forwarding from the lan boxes to internet,
just enable forward, masquerade output and that's it. Creating two
separate routing tables is not a must. Once the network interfaces
come up, they set the route.... just make sure the default gateway is
set as well.

On 9/12/05, Rudi Starcevic <tech@wildcash.com> wrote:
> Hi,
>
> I do something like this with the script below.
>
> Please let me know if you see a better way to do this
> than I am using below.
>
> Thanks.
> Kind regards,
> Rudi.
>
>
> #!/bin/sh
>
> echo "Network Setup Start"
>
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
>
> echo "Setup NIC 0"
> ip addr add 192.168.2.7/24 dev eth0 brd +
>
> echo "Setup NIC 1"
> ip addr add 192.168.3.7/24 dev eth1 brd +
>
> ip addr list
> ip route list
>
> echo "Setup Default Route [ inet table ]"
> ip route add default via 192.168.2.1 proto static table inet
>
> echo "Setup LAN Route [ implan table ]"
> ip route add 192.168.3/24 via 192.168.3.7 proto static table implan
>
> ip route list
>
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
>
> echo "Flushing ip route cache"
> ip route flush cache
>
> #iptables -vL
> #iptables -t nat -vL
>
> exit 0
>
>
>
>

