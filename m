From: Tom Eastep <teastep@shorewall.net>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 02 Feb 2005 08:49:42 -0800
Message-ID: <420104A6.6080308@shorewall.net>
References: <186AC876521E0F46BDE77079A6567FD06F5FBA@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <186AC876521E0F46BDE77079A6567FD06F5FBA@la-ncc-ms1nsabb.losangeles.afspc.ds.af.mil>
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
To: Hudson Delbert J Contr 61 CS/SCBN <Delbert.Hudson@LOSANGELES.AF.MIL>
Cc: netfilter@lists.netfilter.org

Hudson Delbert J Contr 61 CS/SCBN wrote:
> tom,
> 
> why ?
> 
> to what end, this topology ?
> 
> please enlightenment as to the value added ?
> 

See http://shorewall.net/myfiles.htm for a description of my
firewall/router's environment. In general, I prefer to use Proxy ARP for
a DMZ rather than NAT because it allows DMZ servers to have the same IP
address whether accessed from local or external clients.

The DMZ interface (eth0 in my case) needs an IP address -- what address
to give it? There seem to be two choices:

	a) Select an RFC 1918 address in some currently unused network.
	b) Use the firewall's external IP address.

By using b), the existing PTR record can serve both interfaces so that
traffic from the firewall to the server appears to come from the correct
host (gateway.shorewall.net).

In general, consider this:

   <upstream router -- address A.B.C.x>
                  |
                  |
    <gateway router -- address A.B.C.y>
                  |
     ---------------------------
     |   |   |    |    |   |   |

         Network A.B.C.0/24

Assume that the upstream router routes A.B.C.0/24 via the gateway router
A.B.C.y.

The gateway router can be configured as follows:

	External interface A.B.C.y/32
	Host route to A.B.C.x on external interface (no gateway)
	Default route via A.B.C.x
	Internal interface   A.B.C.y/24
	Net router to A.B.C.254/24 on Internal interface (no gateway)

So the gateway router only requires one IP address rather than two yet
it is addressable from both sides.

-Tom	
-- 
Tom Eastep    \ Nothing is foolproof to a sufficiently talented fool
Shoreline,     \ http://shorewall.net
Washington USA  \ teastep@shorewall.net
PGP Public Key   \ https://lists.shorewall.net/teastep.pgp.key


