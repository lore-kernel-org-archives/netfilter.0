From: venky b <bvr96@yahoo.com>
Subject: Re: help required
Date: Sun, 9 Nov 2003 08:11:22 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031109161122.8833.qmail@web10009.mail.yahoo.com>
References: <20031109152014.38501.qmail@web40205.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031109152014.38501.qmail@web40205.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: SBlaze <dagent.geo@yahoo.com>, netfilter@lists.netfilter.org

Hi,

Thanks for responding.

My requirement is as follows

I have a site with two IP subnets A and B.

A is connected to eth0 of IPtables firewall and B is
connected to eth1 interface.

For accessing machines in other locations A must cross
the firewall and go through the router in subnet B,
i.e. WAN connectivity is through subnet B.

I want to implement access control for traffic between
A and B with stateful rules as B is not trusted by A.

Rest of the traffic which is not from/to A
specifically, i.e. coming from or going to other
location should be allowed with ACCEPT target.

There are so many application servers in other
locations which will be accesed by subnet A users,
around 400.

So I do not want IPtables to keep connection tracking
entries for this traffic as it hogs the memory and
cpu.

But at the same time it should keep track of
communication betweeb A <-> B.

Is there a way to turn off/on connection tracking for
specific rules or chains ? 

Hope this make everybody clear.

Thanks,
Venkatesh



 


--- SBlaze <dagent.geo@yahoo.com> wrote:
> You need to be way more specific on what it is you
> want to know. I don't think
> anyone can really help you since your didn't provide
> any information on what it
> is you really want to provided stateful inspection
> on.
> 
> SBlaze
> 
> --- venky b <bvr96@yahoo.com> wrote:
> > Hi All,
> > 
> > Need help on a specific requirement.
> > 
> > I want to enable the stateful inspection only for
> few
> > chains.
> > 
> > I do not want iptables to maintain state inof for
> the
> > rest of the chains as it is not needed.
> > 
> > Any thoughts on this ?
> > 
> > Cheers
> > Venkatesh
> > 
> > 
> > __________________________________
> > Do you Yahoo!?
> > Protect your identity with Yahoo! Mail
> AddressGuard
> > http://antispam.yahoo.com/whatsnewfree
> > 
> 
> 
> =====
> In the absence of order there will be chaos.
> 
> __________________________________
> Do you Yahoo!?
> Protect your identity with Yahoo! Mail AddressGuard
> http://antispam.yahoo.com/whatsnewfree


__________________________________
Do you Yahoo!?
Protect your identity with Yahoo! Mail AddressGuard
http://antispam.yahoo.com/whatsnewfree

