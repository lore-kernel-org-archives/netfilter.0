From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Help with alias interfaces
Date: Wed, 23 Jun 2004 20:22:46 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200406232022.46362.Antony@Soft-Solutions.co.uk>
References: <FLECICIIDHIEIENHHOOLIEFNCCAA.esanz@minorplanetusa.com> <200406231553.01584.Antony@Soft-Solutions.co.uk> <16601.54137.766533.681609@saint.heaven.net>
Reply-To: <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16601.54137.766533.681609@saint.heaven.net>
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

On Wednesday 23 June 2004 8:01 pm, Dick St.Peters wrote:

> Antony Stone writes:
> > The deprecated way to get multiple IPs results in pseudo-interface names
> > such as eth1:0, eth1:1 etc as you discussed.
>
> Deprecated by whom?

http://mirrors.bieringer.de/Linux+IPv6-HOWTO/conf-ipv6-in-ipv4-point-to-point-tunnels.html
(Section headings 9.3.1.1 & 9.3.1.2)
http://seclists.org/lists/honeypots/2004/Jan-Mar/0209.html
http://www.uwsg.iu.edu/hypermail/linux/kernel/0108.2/0485.html

>  I use secondary IPs a lot, and I've never before
> heard anyone call the standard way of doing them "deprecated".  Plus
> I, for one, prefer having pseduo-interface labels for manipulating
> them.  Labels are handy, especially if you use names instead of
> numbers.  (eth0:bob is as valid as eth0:1.)

That's what the "ip link set <device> name <name>" is for now :)

> > The recommended way to assign
> > multiple IPs on one interface (ip addr add a.b.c.d dev eth1) simply
> > results in multiple IPs on the interface - no strange new names appear,
> > therefore I think it is a much more obvious and clear way of doing it.
>
> This is probably a case where context and background determine what is
> more "obvious" and "clear".

Agreed.

Antony.

-- 
Ramdisk is not an installation procedure.

                                                     Please reply to the list;
                                                           please don't CC me.


