From: "Thhoep" <thhoep@gmx.de>
Subject: Problem using fwmarks as routing key: "MASQUERADE: Route sent us somewhere else."
Date: Wed, 21 Jan 2004 18:25:22 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001c01c3e043$93583cd0$1684188d@Kiste>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

hi,

my aim: to divide 100 hosts upon 6 masqueraded adsl connections to the
internet using a linux router runnig a debian woody.

the problem: really strange behaviour of the routing/masquerading combo,
that changes with every tried kernel version. (described below)

presumption: some version mismatch or a bug in the kernel routing code,
which needs a bugfix that till now is unknown to me

my config:

masquerading is activated in "/etc/ppp/ip-up.d" using
-----------
iptables -t nat -A POSTROUTING -o $PPP_IFACE -j MASQUERADE
-----------

routing policy is defined upon reboot:
-----------
echo 1 > /proc/sys/net/ipv4/ip_forward

ip route flush table main
ip route add 192.168.1.0/24 dev eth4 table main

# routing policies for adsl
for (( i=1 ; $i<7; i++ )) ; do
    ip route flush table dsl$i
    ip route add 192.168.1.0/24 dev eth4 table dsl$i
    ip rule add fwmark $i table dsl$i
done

# dividing users
iptables -t mangle -A PREROUTING -i eth4 -s 192.168.1.10 -j MARK --set-mark
1
iptables -t mangle -A PREROUTING -i eth4 -s 192.168.1.11 -j MARK --set-mark
1
#....
iptables -t mangle -A PREROUTING -i eth4 -s 192.168.1.17 -j MARK --set-mark
2
#....  and so on
-----------

external default routes are added to the dsl? tables in "/etc/ppp/ip-up.d"
using
-----------
ip route add $PPP_REMOTE dev $PPP_IFACE src $PPP_LOCAL table $PPP_IPPARAM
ip route add default via $PPP_REMOTE dev $PPP_IFACE table $PPP_IPPARAM
ip route flush cache
-----------

versions:
kernels tried: 2.4.20 - 2.6.1
iptables 1.2.9
iproute iproute2-ss010824
pppd version 2.4.1
patches: none

PROBLEM DESCRIPTION:

if i do a ping from an internal host to an external host i can see with
tcpdump, that the ping request found its way out of ppp?, a reply is coming
in, but isn't sent out of the internal interface eth4. if i use pure
counting netfilter rules for debugging i see, that the replies get lost
between PREROUTING and FORWARD, so i assume they get lost while routing. a
"route -C -n" shows a route to the external host, but no route back from the
external to the internal. in "/var/log/kern.log" are the only
networking-related messages:
-----------
kernel: request_module: failed /sbin/modprobe -- net-pf-10. error = 256
kernel: MASQUERADE: Route sent us somewhere else.
-----------
net-pf-10 seems to be an alias for some ipv6 module. i don't use ipv6 and
therefor don't have this module. so i ignored that error. that maquerading
message could be related to my problem. formerly with an older but very
similar configuration (i think just the iptables was linked to an older
kernel, but version was the same) i got another message:
-----------
kernel: MASQUERADE: No route: Rusty's brain broke!
-----------
i can't interpret any of both.

in addition (this seems to be important): in an older configuration i didnt
use fwmarks to select the routing tables but the inbuilt "from <ip>"
directive of the "ip"-tool like this:
-----------
ip rule add from 192.168.1.10 table dsl1
-----------
and in this configuration the router WAS WORKING absolutely nice and exactly
as expected. my problem only appears when i try to use fwmarks as routing
key. (the corresponding kernal feature is enabled).

please help me! i tried very hard and very long to solve this problem (over
weeks) and if i cant solve it i have to try it with openbsd or something
like that, out of pure desperation..

with best regards,
thomas hoeppler


