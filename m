From: "Dick St.Peters" <stpeters@NetHeaven.com>
Subject: Re: Help with alias interfaces
Date: Wed, 23 Jun 2004 16:30:46 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16601.59510.845588.723249@saint.heaven.net>
References: <FLECICIIDHIEIENHHOOLIEFNCCAA.esanz@minorplanetusa.com>
	<200406231553.01584.Antony@Soft-Solutions.co.uk>
	<16601.54137.766533.681609@saint.heaven.net>
	<200406232022.46362.Antony@Soft-Solutions.co.uk>
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200406232022.46362.Antony@Soft-Solutions.co.uk>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Antony Stone writes:

> On Wednesday 23 June 2004 8:01 pm, Dick St.Peters wrote:
> 
> > Antony Stone writes:
> > > The deprecated way to get multiple IPs results in pseudo-interface names
> > > such as eth1:0, eth1:1 etc as you discussed.
> >
> > Deprecated by whom?
> 
> http://mirrors.bieringer.de/Linux+IPv6-HOWTO/conf-ipv6-in-ipv4-point-to-point-tunnels.html
> (Section headings 9.3.1.1 & 9.3.1.2)
> http://seclists.org/lists/honeypots/2004/Jan-Mar/0209.html
> http://www.uwsg.iu.edu/hypermail/linux/kernel/0108.2/0485.html

These are deprecating the use of "ifconfig", not the use of
pseudo-interface names.  You can use pseudo-interface names with "ip":
	     ip addr add dev eth0 a.b.c.d/e label eth0:1

What's more, the author of the last of your references doesn't seem to
be aware that the labels aren't limited to numbers.  His remark about
the number of labels being limited to <10000 doesn't take into account
labels eth0:aaaa through eth0:ZZZZ.  Even that's not all; labels like
eth0:/^%# are allowed too.  I suspect non-printing characters will
work also, although I haven't tried any yet.

As additional icing on this "ip" cake, you can assign multiple IPs to
a single pseudo-interface label, making it possible to deal with
groups of IPs at once.

However, most people aren't dealing with ipv6-in-ipv4 tunnels,
honeypots, or thousands of IPs per interface, as are the references
you cite.  "ifconfig" will handle the vast majority of cases and is
simpler to use when the power of "ip" is not needed.

--
Dick St.Peters, stpeters@NetHeaven.com 

