From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with alias interfaces
Date: Wed, 23 Jun 2004 21:47:29 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406232147.29298.Antony@Soft-Solutions.co.uk>
References: <FLECICIIDHIEIENHHOOLIEFNCCAA.esanz@minorplanetusa.com> <200406232022.46362.Antony@Soft-Solutions.co.uk> <16601.59510.845588.723249@saint.heaven.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16601.59510.845588.723249@saint.heaven.net>
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

On Wednesday 23 June 2004 9:30 pm, Dick St.Peters wrote:

> Antony Stone writes:
> > >
> > > > The deprecated way to get multiple IPs results in pseudo-interface
> > > > names such as eth1:0, eth1:1 etc as you discussed.
> > >
> > > Deprecated by whom?
> >
> > http://mirrors.bieringer.de/Linux+IPv6-HOWTO/conf-ipv6-in-ipv4-point-to-p
> >oint-tunnels.html (Section headings 9.3.1.1 & 9.3.1.2)
> > http://seclists.org/lists/honeypots/2004/Jan-Mar/0209.html
> > http://www.uwsg.iu.edu/hypermail/linux/kernel/0108.2/0485.html
>
> These are deprecating the use of "ifconfig", not the use of
> pseudo-interface names.

That is precisely what I was saying is deprecated - the use of ifconfig.

One of the results of using it is that you automatically and non-optionally 
get the pseudo-interface names (which are optional if you use ip addr).

Sorry if my wording was unclear - I didn't mean to suggest that multiple names 
for interfaces are inherently a bad idea or deprecated.

> However, most people aren't dealing with ipv6-in-ipv4 tunnels,
> honeypots, or thousands of IPs per interface, as are the references
> you cite.  "ifconfig" will handle the vast majority of cases and is
> simpler to use when the power of "ip" is not needed.

I simply looked up references to support my assertion that "ifconfig eth0:0" 
etc is deprecated.   The particular reasons why these people are using 
multiple IPs on one interface are irrelevant.

I agree with you that ifconfig will handle the majority of cases.

I don't agree that it's simpler to use, but I think that's just a matter of 
opinion.

However, as I said in my earlier posting, it doesn't matter to netfilter which 
method you use to get the multiple IPs, so by all means choose whichever you 
prefer.   I don't regard it as a big deal - I was simply surprised that you 
hadn't come across this use of ifconfig as being deprecated, so I gave some 
examples.

Regards,

Antony.

-- 
This email was created using 100% recycled electrons.

                                                     Please reply to the list;
                                                           please don't CC me.


