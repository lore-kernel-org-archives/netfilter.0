From: Joel Newkirk <netfilter@newkirk.us>
Subject: Re: Firewall Setup on RH 9
Date: 05 Jul 2003 14:20:40 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057429240.2823.156.camel@alpha.newkirk.us>
References: <016201c33fa7$5c755eb0$660210ac@christo>
	 <n6tbgvkvn94tuq3f8m01d5rah2n97tgnol@4ax.com>
	 <1057383324.2821.34.camel@alpha.newkirk.us>
	 <0gvcgvc3jjvjmlog4a49p0lgosd9g9702c@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <0gvcgvc3jjvjmlog4a49p0lgosd9g9702c@4ax.com>
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
To: Michal Kepien <lordpopcorn@poczta.onet.pl>
Cc: netfilter@lists.netfilter.org

On Sat, 2003-07-05 at 03:30, Michal Kepien wrote:

> >With iptables FORWARD traffic never touches the INPUT or OUTPUT chains,
> >those are explicitly for INPUT and OUTPUT to and from the box itself.
> 
> I'm using the configuration I presented in the post and it works OK.
> However, if you know an easier way to achieve the same goal, please
> let me know :)

# We'll consider eth2 the 'unsecure' LAN, and use ppp0 for external
# (it could just as easily be eth0 or whatever)
INTIF1 = eth1
INTIF2 = eth2
EXTIF = ppp0
INTIP1 = 192.168.0.0/24
INTIP2 = 192.168.1.0/24
EXTIP = a.b.c.d
IPT = /sbin/iptables
ADDFWD = "$IPT -A FORWARD"
ADDIN = "$IPT -A INPUT

$IPT -F
$IPT -P INPUT DROP
$IPT -P FORWARD DROP

$ADDFWD -m state --state ESTABLISHED,RELATED -j ACCEPT
$ADDFWD -i $INTIF1 -s $INTIP1 -j ACCEPT
$ADDFWD -i $INTIF2 -s $INTIP2 -d !$INTIP1 -j ACCEPT
$ADDFWD -i $INTIF2 -d $INTIP1 -j LOG --log-level debug --log-prefix
"LAN2Prohib:"
$ADDFWD -i $INTIF2 -s !$INTIP2 -j LOG --log-level debug --log-prefix
"LAN2Spoof:"

$ADDIN -m state --state ESTABLISHED,RELATED -j ACCEPT
$ADDIN -i $INTIF1 -j ACCEPT

$IPT -t nat -A POSTROUTING -o $EXTIF -p SNAT --to $EXTIP



This will let LAN1 connect to LAN2, to the firewall box, or to the
internet without restriction.  It will let LAN2 connect ONLY to the
internet (without restriction).  It will let the firewall box connect to
anything without restriction.

Realistically this should be ACCEPTing only the required ports in
FORWARD and INPUT, and possibly OUTPUT as well.  Personally I prefer
DROP policy on OUTPUT and explicit ACCEPT of only traffic I want
outbound.  As it stands it offers security from incursions from the
internet or from LAN2, and 'masquerades' LAN1 and LAN2 behind the public
IP.  (be aware that iptables uses the target MASQUERADE to specify a
particular form of SNAT where it automatically determines the IP of the
outbound interface each time, used for dynamic IP setups.)

> Below I attach my conception of packet traffic - it is taken from the
> Linux IPCHAINS HOWTO, so it may be _not_ up-to-date. If the way
> packets are treated changed in iptables, please tell me how.

Essentially I already did... ;^)  The best tutorial, including a nice
diagram (in "Traversing of Tables and Chains"), is Oskar Andreasson's at
http://iptables-tutorial.frozentux.net .  There is a very different
diagram, as well as my own firewall script (a rather complex script that
actually IS a script, with multiple functions and parameters) at the
minimalist, incomplete http://live.newkirk.us/netfilter/index.html . 
The short of it is that a packet is inbound, goes through
nat-PREROUTING, then a routing decision is made:  thisbox?->INPUT 
else->FORWARD.

j



