From: Vincent Lim <vincent.lim@nestac.com>
Subject: Re: ICMP conntrack
Date: Fri, 18 Oct 2002 18:07:11 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3DAFDD4F.C24F44B6@nestac.com>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org> <20021018082812.QQWL292.mta03-svc.ntlworld.com@there> <1034931957.8912.13.camel@elendil> <200210180952.g9I9qEL27957@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Antony Stone wrote:
> =

> On Friday 18 October 2002 10:05 am, Cedric Blancher wrote:
> =

> > Le ven 18/10/2002 =E0 10:28, Antony Stone a =E9crit :
> > > > I was wondering why I'm not getting any conntrack entires for icm=
p
> > > > connections?
> > >
> > > There is no concept of a "connection" for ICMP.
> >
> > Yes it's true, but for some, you have a request/reply concept.
> =

> Yes, I realised that was the only exception after I posted my reply.
> =

> > > A single ICMP packet is sent to indicate some situation has occurre=
d.
> > > There's no reply, there's no follow-up packet, therefore there's no=
 need
> > > to keeptrack of a "connection" for something which consists of only=
 a
> > > single packet.
> >
> > Two cases :
> >
> >       request/reply : echo, timestamp, address mask and info
> >               First packet (request) is NEW, others (replies) are
> >               ESTABLISHED ; entries have a 30s timeout.
> >               If a unsolicitated reply is received, then INVALID.
> =

> Indeed.
> =

> >       ICMP erros : ICMP payload is a quotation extracted from the IP
> >               packet that has generated the error. This quotation is
> >               used to identify the related session in conntrack table=
=2E
> >               If ICMP match an active entry, then it's RELATED. If
> >               not, it's INVALID.
> =

> Although I agree with what you've said here, it's not really relevant t=
o the
> original poster's question, because in these cases you'll still never s=
ee an
> ICMP entry in the connection tracking table.   Because the ICMP packets=
 are
> RELATED to the original connection, it's the original packet which you'=
ll see
> in the conntrack table - the ICMP replies simply get through because of=
 their
> relationship to the original packet.
> =

> > So, for ICMP requests, you have some kind of conntrack, based on ICMP=

> > sequence number. For ICMP errors, conntrack tries to associate them t=
o
> > an existing entry.
> =

> ICMP sequence number ???   What's that ?

Results of a ping to www.ncftpd.com :

64 bytes from ncftpd.com (209.197.102.38): icmp_seq=3D11055 ttl=3D44
time=3D311.029 msec
64 bytes from ncftpd.com (209.197.102.38): icmp_seq=3D11056 ttl=3D44
time=3D308.126 msec
64 bytes from ncftpd.com (209.197.102.38): icmp_seq=3D11057 ttl=3D44
time=3D308.430 msec
64 bytes from ncftpd.com (209.197.102.38): icmp_seq=3D11058 ttl=3D44
time=3D302.321 msec

And the entries in conntrack related to the above is:
icmp     1 29 src=3D192.168.1.229 dst=3D209.197.102.38 type=3D8 code=3D0
id=3D59475 src=3D209.197.102.38 dst=3D192.168.1.229 type=3D0 code=3D0 id=3D=
59475
use=3D1 =


However if I try to ping a nearer host, there would be no entry in the
conntrack table at all.

-- =

Vincent Lim
Software Engineer
NESTAC Solution Sdn Bhd
vincent.lim@nestac.com | +(6012) 659-6609

