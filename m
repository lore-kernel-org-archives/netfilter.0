From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 13:44:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221344.48025.Antony@Soft-Solutions.co.uk>
References: <4087ACE0.1020006@uk.thalesgroup.com> <200404221312.50864.Antony@Soft-Solutions.co.uk> <200404221324.39201.lists@edeca.net>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404221324.39201.lists@edeca.net>
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

On Thursday 22 April 2004 1:24 pm, David Cannings wrote:

> On Thursday 22 April 2004 13:12, Antony Stone wrote:
> > On Thursday 22 April 2004 12:30 pm, Fisher Alex wrote:
> > > I have two sets of systems.  Each system has about 30 IP addresses
> > > spread across various bits of hardware.  The two systems are
> > > identical (ie have the same 30 IP addresses).  The addresses are all
> > > part of the class C subnet 192.168.0.*
> >
> > However, if someone is adamant that you need to set up network
> > connectivity between machines with such an unfriendly combination of IP
> > addresses, I suggest you simply set up multiple host-specific routes on
> > the netflter machine, telling it where to find each different
> > 192.168.0.* destination address, and don't have a standard
> > 192.168.0.0/24 route on that system.
>
> From what I understand of the question both system 1 and system 2 have the
> same pool of 192.168.x.x addresses, such as in a failover setup.  Surely
> then this still would not work, as each would have two host-specific
> routes and the kernel chooses the first one it gets to in the routing
> table.

Hm, yes, on closer reading of Alex's specification, I think you might be 
right, in which case simple routing is not what he needs.  (Indeed, Alex's 
latest posting which I've just seen confirms this).

I suspect something along the lines of the Linux Virtual Server is more 
appropriate. http://www.linuxvirtualserver.org

However, the fact that *both* sets of backend systems are using exactly the 
same IP addresses is still going to remain a horrible problem.

> That's not a netfilter issue though, it's a routing one and what
> to do would depend on whether you want fail over, load balancing across
> the two systems, etc.  Whether or not that's the right way to go about
> doing it, I don't know.

I think you're right on all counts here:
1. It's not a netfilter problem
2. whether failover or loadbalancing is required makes a difference to the 
solution
3. whether this is the right way to go about it is questionable

Regards,

Antony.

-- 
Programming is a Dark Art, and it will always be. The programmer is
fighting against the two most destructive forces in the universe:
entropy and human stupidity. They're not things you can always
overcome with a "methodology" or on a schedule.

 - Damian Conway, Perl God

                                                     Please reply to the list;
                                                           please don't CC me.


