From: Patrick Leslie Polzer <leslie.polzer@gmx.net>
Subject: DNAT problem
Date: Sat, 29 May 2004 17:25:36 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040529172536.6df75cca.leslie.polzer@gmx.net>
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


Hello again,

a DNAT problem is coming up.
My firewall setup (simplified for testing) is currently as follows:


### <snip> ###

##### FILTER table #####
# policies
$ipt -P FORWARD ACCEPT
$ipt -P   INPUT ACCEPT
$ipt -P  OUTPUT ACCEPT

$ipt -F
$ipt -F FORWARD
$ipt -F   INPUT
$ipt -F  OUTPUT


##### NAT table #####
# flush chains
$ipt -t nat -F  PREROUTING
$ipt -t nat -F POSTROUTING
$ipt -t nat -F      OUTPUT

# masquerading on ppp0 and vortex
$ipt -t nat -A POSTROUTING -o   ppp0 -j MASQUERADE
$ipt -t nat -A POSTROUTING -o vortex -j MASQUERADE

# dnat
$ipt -t nat -A PREROUTING -i ppp0 -p tcp --dport 80 -j DNAT --to-destination 192.168.35.191:80

### </snip> ###


The last line is working with

--dport 8080

but isn't with

--dport 80

What's going on there?


Kind regards,

Leslie

