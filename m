From: Roman <maillists@gmx.ch>
Subject: Re: Re: Firewall with only one eth0 device: possible?
Date: Wed, 01 Jun 2005 17:13:25 +0200
Message-ID: <429DD095.6020108@gmx.ch>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Thanks for the hint, Grant

I found some documentation on that in the datasheet of realtek 8309 
switch controller and on a support page of zyxel.
The realtek datasheet says that there are 4 tag/untag modes in that chip 
but does not tell you when the tagging or untagging is done (ingress or 
egress?)
On zyxel support page was stated that tagging will be done on ingress an 
untagging on egress if any tag changing is done at all. The zyxel 
approach sound good to me.

I hope all switch conntroller manufacturer implemented the IEEE 802.1q 
standard the same way. I do not know how much freedom there is the 
interpret 802.1q in different ways.

Do you or someone know what happens if tagged ethernet frames leave the 
switch ports A (VLAN1) and C (VLAN2, port B was the path to the uClinux 
eth0.1 /eth0.2) and VLAN unaware clients are hooked to this network 
segment? Will they cope with the VLAN frames and understand them? Or 
will they confuse the unaware devices and get dropped?

Thanks for any further advice


Roman

