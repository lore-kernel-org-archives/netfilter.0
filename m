From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: ICMP conntrack
Date: Fri, 18 Oct 2002 10:52:03 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200210180952.g9I9qEL27957@vulcan.rissington.net>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org> <20021018082812.QQWL292.mta03-svc.ntlworld.com@there> <1034931957.8912.13.camel@elendil>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1034931957.8912.13.camel@elendil>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

On Friday 18 October 2002 10:05 am, Cedric Blancher wrote:

> Le ven 18/10/2002 =E0 10:28, Antony Stone a =E9crit :
> > > I was wondering why I'm not getting any conntrack entires for icmp
> > > connections?
> >
> > There is no concept of a "connection" for ICMP.
>
> Yes it's true, but for some, you have a request/reply concept.

Yes, I realised that was the only exception after I posted my reply.

> > A single ICMP packet is sent to indicate some situation has occurred.
> > There's no reply, there's no follow-up packet, therefore there's no n=
eed
> > to keeptrack of a "connection" for something which consists of only a
> > single packet.
>
> Two cases :
>
> 	request/reply : echo, timestamp, address mask and info
> 		First packet (request) is NEW, others (replies) are
> 		ESTABLISHED ; entries have a 30s timeout.
> 		If a unsolicitated reply is received, then INVALID.

Indeed.

> 	ICMP erros : ICMP payload is a quotation extracted from the IP
> 		packet that has generated the error. This quotation is
> 		used to identify the related session in conntrack table.
> 		If ICMP match an active entry, then it's RELATED. If
> 		not, it's INVALID.

Although I agree with what you've said here, it's not really relevant to =
the=20
original poster's question, because in these cases you'll still never see=
 an=20
ICMP entry in the connection tracking table.   Because the ICMP packets a=
re=20
RELATED to the original connection, it's the original packet which you'll=
 see=20
in the conntrack table - the ICMP replies simply get through because of t=
heir=20
relationship to the original packet.

> So, for ICMP requests, you have some kind of conntrack, based on ICMP
> sequence number. For ICMP errors, conntrack tries to associate them to
> an existing entry.

ICMP sequence number ???   What's that ?

Antony.

--=20

If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

