From: Thomas Jacob <jacob@internet24.de>
Subject: Re: Block LAN DHCP broadcast
Date: Mon, 16 Jul 2007 16:17:17 +0200
Message-ID: <1184595437.17688.72.camel@localhost>
References: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <3130eec50707160652r7fe3285amfafc695b45ee4800@mail.gmail.com>
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

Assuming that all your hosts are connected to a single broadcast-domain
LAN,
that your firewall box is the layer 3 default gateway for
internet-connections for your hosts and that you're talking about
preventing all other hosts on this lan to respond to dhcp broadcasts,
that's pretty much impossible.

DHCP packets are not passing through your router box on their way
between
an assumed evil dhcp host and your normal hosts.

You could try to find some sort of filter options in your switching
hardware
to control the flow of broadcasts and/or dhcp packets.

Or you could try using some form of dhcp authentication.

Or you could have a seperate VLAN for each of your hosts
and only allow them to communicate via your router
(possibly creating a performance bottle neck though...)


On Mon, 2007-07-16 at 07:52 -0600, Gnarlodious wrote:
> Hello and thank you for the help.
> 
> I am running iptables v1.3.7 on a LAN router and I need to block DHCP
> requests. New machines on the router should be prevented from
> broadcasting DHCP, forcing only that router to handle DHCP.
> 
> Can this be done? Seems like I have been trying for days without success.
> 
> -- Gnarlie
> http://Gnarlodious.com/



