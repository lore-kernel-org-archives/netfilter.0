From: Kelly Setzer <Kelly.Setzer@placemark.com>
Subject: Re: Purpose of self-referential rule
Date: Wed, 26 Feb 2003 08:55:48 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030226145548.GC28230@placemark.com>
References: <20030224160628.GH4316@placemark.com> <200302260903.58241.netfilter@newkirk.us>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <200302260903.58241.netfilter@newkirk.us>
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
To: netfilter@lists.netfilter.org

On Wed, Feb 26, 2003 at 09:03:58AM -0500, Joel Newkirk wrote:
> On Monday 24 February 2003 11:06 am, Kelly Setzer wrote:
> > I've been experimenting with gShield trying to learn the ins and outs
> > of iptables.  One of the rules is generates is:
> >
> > iptables -A INPUT -s 192.168.6.0/24 -d 192.168.6.0/24 -i eth1 -j
> > ACCEPT
> >
> > The source and dest are correct for my internal network, and eth1 is
> > the internal net.  My question is, when would the firewall ever see a
> > packet that could possible match this?
> >
> 
> What's the IP of eth1?  This is the INPUT chain, so it's for traffic 
> targeted at the firewall box itself.  Having a destIP listed with a /24 
> is a little odd, though, unless you are DHCP assigned IP or some such 
> where it won't know the IP when the rule is generated, or it may change.

The eth1 interface has a statically assigned address of 192.168.6.1.
Another respondent mentioned that it's only use (as INPUT rule) would
be allow traffic directly to the firewall.  DHCP is used to assign
addresses to windows clients on this network.  In any case, it seems a
little weak to allow clients full access to the firewall - way too
open.

I suppose I should try removing the rule and seeing if anything
breaks.

thanks all,
Kelly

--
Kelly Setzer, System Administrator/Architect - Placemark Investments
14180 Dallas Pkwy, Suite 200, Dallas, TX 75240
kelly.setzer@placemark.com  http://www.placemark.com
(972)404-8100x41 (work)       (214) 287-3464 (cell)


