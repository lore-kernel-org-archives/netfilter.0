From: =?iso-8859-1?Q?Herv=E9?= <herve@lucidia.net>
Subject: Re: Two NICS with same IP and same client IP
Date: Wed, 2 Feb 2005 20:47:32 -0000 (GMT)
Message-ID: <57788.192.168.144.1.1107377252.squirrel@192.168.144.1>
References: <27594E8BA9D5CA458F5EF87D88B6B48F019948@pxtvjoexd01.pxt.primeexalia.com>
	<18348031.1107363459685.JavaMail.rct@kale>
	<200502021841.35410.bob@zooid.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <200502021841.35410.bob@zooid.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter  <netfilter@lists.netfilter.org>

> On Wednesday 02 February 2005 16:57, Herv=E9 wrote:
>
>> Basically, the network interface where the packet originated has to
>> somehow be remembered at the routing stage. I only see source address
>> mangling to do that...
>>
>
> It would seem that if you add two additional IPs to the NFS machine (on=
 a
> dummy interface) and do a local DNAT to those IPs based on the incoming
> nic,
> that the correct routing tables/rules would be all that is needed to ro=
ute
> the return packets to the correct network.
>
> Have a look at
>
>    http://www.policyrouting.org/PolicyRoutingBook/ONLINE/TOC.html
>
> for the concepts and examples.  Chapter 5, in particular, covers the
> routing
> concepts your solution will need.
>
> Note that ProxyARP uses the same ip on two interfaces and depends on th=
e
> proper routing table entries to do the right thing.
>
>
> --
>
> Bob Tellefson
> Java network application development & hosting
>
Yup, that's what I started doing, but I still have to modify the source
address somehow, so the return packet is routed according to that
address...

In fact, conceptually, I really want a router between each client and my
server:

Client1 (a.b.c.d) -> (a.b.c.1) Router (x.y.z.1) -|-> (x.y.z.3) Server
Client2 (a.b.c.d) -> (a.b.c.1) Router (x.y.z.2) -|

This does all: same client IPs, unique server for all the clients IP (and
only one NIC).

And that's probably what I'm going to do, not just conceptually!

But I have to say that I would have liked to do it all on the one machine=
,
rather than needing to go through routers.

Thanks for the link as well, I need to read through it carefully before
giving up my first idea (I hate giving up ;-)

Herve.


