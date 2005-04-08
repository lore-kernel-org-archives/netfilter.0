From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Linux firewall + NAT Traversal + IPsec
Date: Fri, 8 Apr 2005 14:35:21 -0500
Message-ID: <007b01c53c72$1af688f0$f5001eac@riverview.office>
References: <200504081239.j38Cd8Gb011881@smtp26.wxs.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Sietse van Zanen <sietse@wizdom.nu>, netfilter@lists.netfilter.org

If I understood John correctly he is wanting to use his Linux IPSec firewall
/ NAT router as one end of the IPSec VPN tunnel.  If that is indeed the case
then yes Linux can be configured to do so.  You will need to look at
FreeS/WAN (dyeing / defunct (as I know it)) and / or OpenS/WAN (alive and
kicking very strongly).  There are some interoprability incompatabilities
between different IPSec implementations between FreeS/WAN / OpenS/WAN and
other vendor's IPSec VPN products.  I personaly know that I have gotten
OpenS/WAN (version unknown at the moment) to work with Linksys BFEVP41
(first version) routers as long as I keep a ping flowing through the VPN.



Grant. . . .

> As far as I know, you would not need anything on the Linux box.
>
> It will all depend on whether the clients and server IPSEC implementation
> support IPSEC NAT T(raversal).
>
> Microsofts IPSEC implementation does. But has some drawbacks.


