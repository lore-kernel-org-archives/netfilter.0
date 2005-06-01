From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Firewall with only one eth0 device: possible?
Date: Wed, 01 Jun 2005 10:28:05 -0500
Message-ID: <429DD405.5090104@riverviewtech.net>
References: <429DD095.6020108@gmx.ch>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <429DD095.6020108@gmx.ch>
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

Roman wrote:
> Thanks for the hint, Grant
> 
> I found some documentation on that in the datasheet of realtek 8309
> switch controller and on a support page of zyxel.
> The realtek datasheet says that there are 4 tag/untag modes in that chip
> but does not tell you when the tagging or untagging is done (ingress or
> egress?)
> On zyxel support page was stated that tagging will be done on ingress an
> untagging on egress if any tag changing is done at all. The zyxel
> approach sound good to me.
> 
> I hope all switch conntroller manufacturer implemented the IEEE 802.1q
> standard the same way. I do not know how much freedom there is the
> interpret 802.1q in different ways.
> 
> Do you or someone know what happens if tagged ethernet frames leave the
> switch ports A (VLAN1) and C (VLAN2, port B was the path to the uClinux
> eth0.1 /eth0.2) and VLAN unaware clients are hooked to this network
> segment? Will they cope with the VLAN frames and understand them? Or
> will they confuse the unaware devices and get dropped?

I think what you are asking about is covered under what is called egress filtering.  The way that I configured my switch (D-Link DES-3226L (worked great)) was to establish an 802.1q trunk (implies VLAN tagging) on the switch port(s) that connected to the router. I used egress filtering on all the other ports to tell the switch to NOT send 802.1q tags on any traffic leaving so as to prevent confusion to devices that don't know a thing about 802.1q VLANs.  Basically every port on the switch belongs to one VLAN, except the port(s) that connect to the router, and have been configured to send basic ethernet frames just like you would get out of a $15 hub.  The 802.1q trunked port(s), by the very nature of the trunking, will send (802.1q) VLAN tags in the ethernet frame header to indicate which VLAN the ethernet frame is from.  Your router will then receive these frames with the 802.1q and kno
 w which interface to send them to (eth0.1 or eth0.2).

I hope this helps you and answers some questions.  If you need more help I'd be glad to do so.  F.y.i. I do not have access to the DES-3226L to look at the config any more so I can't get you a copy, but I could help you regenerate one from scratch if need be.  I can play with VLAN tagging on my home router with a Cisco Catalyst 5000 at the house thus I can help you get your vconfig script correct.



Grant. . . .

