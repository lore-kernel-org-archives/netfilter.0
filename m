From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: Netfilter and Poptop ( and stuff ... )
Date: Mon, 10 Oct 2005 06:29:16 -0500
Message-ID: <200510100629.16485.rob0@gmx.co.uk>
References: <20051010062902.A7C34F4DA@sorry.no-ip-here.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20051010062902.A7C34F4DA@sorry.no-ip-here.net>
Content-Disposition: inline
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
Cc: poptop-server@lists.sourceforge.net

On Monday 2005-October-10 01:28, Seferovic Edvin wrote:
> I would like allow my VPN users internet access, but not to all

This seems odd. Didn't they already have Internet access to connect to 
your pptpd?

> machines on the internal network. So I have to use NAT on the tunnel
> endpoints ( ppp+ interfaces ), right?

SNAT allows clients to use non-public IP addresses. It is one condition 
which must be satisfied, but it is not all. You also must have rules in 
FORWARD to DROP/REJECT traffic to the internal network from ppp+ and 
then to ACCEPT traffic from ppp+ to anywhere.

> I wanted to make this easy as possible, but as always - I took the
> wrong turn... probably by choosing Firewall Builder to help me get my
> firewall set up. I achived everything, but I cannot configure ppp+
> interfaces in FW-Builder? Does anyone has a hint for me? Is this

Type the command at the command line?

> possible anyway ( please don't tell me I have to configure 150 ppp
> interfaces in FW-Builder ) ???

I am not familiar with it. If you are saying that it rejects the ppp+ 
syntax to specify all PPP interfaces, then indeed that sounds like a 
serious bug

> I suppose it would be more secure to enter a firewall rule every time
> a ppp interface comes up ( by using scripts like ip-up from pppd )?

That would be appropriate for more fine-grained control. If all ppp+ 
traffic is to be treated the same, I think a single blanket rule makes 
more sense.

> Do I have to enter a NAT rule for each interface then? Any

No.

> performance thought when having 150+ interfaces at the same time?

Not terribly efficient, but I doubt you would see a performance impact 
with that.

> Nevertheless I would also like to redirect http traffic going from a
> NATed ppp+ interface to my squid process - how does this combined
> rule looks like?

The example in the squid documentation is perfect, just adjust it to 
suit your needs. You might want -s sourcerange/netmask and of course 
the input interface, -i ppp+. If by "combined" you mean the same rule 
as is doing the SNAT, no, that is not so. The HTTP proxying is done 
using DNAT or REDIRECT target in the PREROUTING chain. SNAT is in 
POSTROUTING.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

