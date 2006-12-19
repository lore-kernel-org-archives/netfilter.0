From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Interesting article about punching holes in firewalls...
Date: Tue, 19 Dec 2006 12:07:02 +0100 (CET)
Message-ID: <Pine.LNX.4.64.0612191128180.11364@blackhole.kfki.hu>
References: <45860240.2040102@riverviewtech.net>
	<1166426813.8007.10.camel@anduril.intranet.cartel-securite.net>
	<4587B400.6080206@rtij.nl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4587B400.6080206@rtij.nl>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Martijn Lievaart <m@rtij.nl>
Cc: Mail List - Netfilter <netfilter@lists.netfilter.org>, Cedric Blancher <blancher@cartel-securite.fr>, Grant Taylor <gtaylor@riverviewtech.net>

Hi,

On Tue, 19 Dec 2006, Martijn Lievaart wrote:

> I do assume in all this that the only ICMP traffic matching RELATED are
> true ICMP errors (afair host/net unreachable and fragmentation needed).
> If this also opens up say ICMP redirect[1] we may have a slight problem.
> It is possible netfilter does this to accomodate bridging setups. Anyone
> can comment on this? If this opens up the connection for any other ICMP
> traffic, I think that's a bug.

The ICMP types for which the packet may be flagged as RELATED are

- destination-unreachable
- source-quench
- time-exceeded
- parameter-problem
- redirect

*if* the inner packet corresponds to an already existing connection.

But he hole punching technique described in the article[1] has nothing to 
do with RELATED connections. There are applications running on the client 
machines which do initiate the connections from behind the firewall and if 
any outgoing connection is allowed by the local policy, the "punching" 
naturally succeeds.

If the "enemy" behind the (fire)walls, nothing much can be done.

The article must be corrected at one place: the claim: "After an 
outgoing SYN packet the firewall / NAT router will forward incoming 
packets with suitable IP addresses and ports to the LAN even if they fail 
to confirm, or confirm the wrong sequence number (ACK). Linux firewalls at 
least, clearly fail to evaluate this information consistently." is 
outdated and not true for 2.6 kernels.

[1]: http://www.heise-security.co.uk/articles/print/82481

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

