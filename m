From: "Deepak Seshadri" <dseshadri@broadbandmaritime.com>
Subject: RE: Policy Misunderstanding: RTFM Guidance Requested.
Date: Wed, 1 Sep 2004 09:27:22 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <200409011323.i81DNQAi040521@jkcpub.iserver.net>
References: <8ca42282040901045464650094@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <8ca42282040901045464650094@mail.gmail.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: 'Mike' <1100100@gmail.com>, netfilter@lists.netfilter.org


Hi Mike,

If the default policy on your mangle & Nat chain is set to DROP & if you
have no rules to classify traffic in these tables, all your packets will get
dropped here. They will not make it to the FILTER table.

In your commands, first you have set the default policy to DROP on all
chains in the filter table. Then you have set policies to accept all the
traffic in the INPUT & OUTPUT chains. I do not get this. If you are aiming
to accept all packets in the INPUT & OUTPUT chain you might as well set the
default policy in these chains to ACCEPT.

My suggestion would be to set the default policy on the chains in mangle &
Nat to ACCEPT.
Set the default policy on the chains in filter to DROP.

I will email you a diagram on the packet flow inside the kernel. Probably
that would make things easier in understanding where each chain exists
inside the kernel.

Regards,
Deepak


Deepak Seshadri

-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Mike
Sent: Wednesday, September 01, 2004 7:55 AM
To: netfilter@lists.netfilter.org
Subject: Policy Misunderstanding: RTFM Guidance Requested.

I have a linux box acting as router/firewall for my home network.
It runs Gentoo Linux, kernel 2.4.26 and iptables 1.2.10.
eth0 -> Internet
eth1 -> Lan

I thought I had seen others on this list discuss starting with a
completely closed router that denies all traffic - INPUT, OUTPUT, and
FORWARD; filter, nat, and mangle.  Yet, when I reset my firewall
Policies to initially DROP all INPUT, OUTPUT, and FORWARD traffic, and
then append these policies with filter or nat rules, the policies
still overrule and stop all traffic.

I've read the man page a few times and have found a few tutuorials on
the net, but I'm still missing the fundamental understanding of how
policies do/do not affect iptables rules.

Can I get an RTFM push in the right direction on this subject.
Thanks for your time and patience.

Mike

Maybe I should post the firewall so you can see there are no glaring
errors in my syntax:

ENABLE_FORWARDING_IPv4="yes"

IPTABLES=/sbin/iptables
DEPMOD=/sbin/depmod
MODPROBE=/sbin/modprobe

$DEPMOD -a
$MODPROBE ip_tables
$MODPROBE ip_conntrack
$MODPROBE ip_conntrack_ftp
$MODPROBE ip_conntrack_irc
$MODPROBE iptable_nat
$MODPROBE ip_nat_ftp

echo "   Enabling forwarding.."
echo "1" > /proc/sys/net/ipv4/ip_forward

echo "   Enabling DynamicAddr.."
echo "1" > /proc/sys/net/ipv4/ip_dynaddr

echo "   Flushing any pre-existing filter rules or conditions."
$IPTABLES -t filter -F
$IPTABLES -t nat -F
$IPTABLES -t mangle -F

echo "   Set the filter/nat/mangle packet Matching Table Policy."
$IPTABLES -t filter -P INPUT DROP
$IPTABLES -t filter -P OUTPUT DROP
$IPTABLES -t filter -P FORWARD DROP
$IPTABLES -t nat -P PREROUTING DROP
$IPTABLES -t nat -P POSTROUTING DROP
$IPTABLES -t nat -P OUTPUT DROP
$IPTABLES -t mangle -P INPUT DROP
$IPTABLES -t mangle -P OUTPUT DROP
$IPTABLES -t mangle -P FORWARD DROP
$IPTABLES -t mangle -P PREROUTING DROP
$IPTABLES -t mangle -P POSTROUTING DROP

echo "   INPUT/OUTPUT Rules for Routerbox."
$IPTABLES -t filter -A INPUT -j ACCEPT
$IPTABLES -t filter -A OUTPUT -j ACCEPT

echo "   FORWARD Rules for data allowed IN and OUT of the LAN."
$IPTABLES -t filter -A FORWARD -i eth0 -o eth1 -m state --state
ESTABLISHED,RELATED -j ACCEPT
$IPTABLES -t filter -A FORWARD -i eth0 -o eth1 -m state --state NEW -j
ACCEPT


echo "   Allowing HTTP and SSH Access."
$IPTABLES -t filter -A INPUT -p tcp -i eth0 --dport 22 -m state
--state NEW -j ACCEPT
$IPTABLES -t filter -A INPUT -p tcp -i eth0 --dport 80 -m state
--state NEW -j ACCEPT

echo "   Enabling NAT MASQUERADE."
$IPTABLES -t nat -A POSTROUTING -o eth0 -j MASQUERADE

echo "   Prevent remote machines from spoofing internal IP addresses."
$IPTABLES -t filter -A INPUT -i eth0 -s 199.201.13.0/24 -j REJECT

echo "   Do not respond to remote Pings."
$IPTABLES -t filter -A INPUT -p icmp --icmp-type echo-request -j DROP



