From: David Cannings <lists@edeca.net>
Subject: Re: Is this possible?
Date: Thu, 22 Apr 2004 13:24:39 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200404221324.39201.lists@edeca.net>
References: <4087ACE0.1020006@uk.thalesgroup.com> <200404221312.50864.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404221312.50864.Antony@Soft-Solutions.co.uk>
Content-Disposition: inline
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

On Thursday 22 April 2004 13:12, Antony Stone wrote:
> On Thursday 22 April 2004 12:30 pm, Fisher Alex wrote:
> > I have two sets of systems.  Each system has about 30 IP addresses
> > spread across various bits of hardware.  The two systems are
> > identical (ie have the same 30 IP addresses).  The addresses are all
> > part of the class C subnet 192.168.0.*
> However, if someone is adamant that you need to set up network
> connectivity between machines with such an unfriendly combination of IP
> addresses, I suggest you simply set up multiple host-specific routes on
> the netflter machine, telling it where to find each different
> 192.168.0.* destination address, and don't have a standard
> 192.168.0.0/24 route on that system.

=46rom what I understand of the question both system 1 and system 2 have th=
e=20
same pool of 192.168.x.x addresses, such as in a failover setup.  Surely=20
then this still would not work, as each would have two host-specific=20
routes and the kernel chooses the first one it gets to in the routing=20
table.  That's not a netfilter issue though, it's a routing one and what=20
to do would depend on whether you want fail over, load balancing across=20
the two systems, etc.  Whether or not that's the right way to go about=20
doing it, I don't know.

David

