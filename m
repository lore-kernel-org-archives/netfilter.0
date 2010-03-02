From: backup95 <backup95@netcabo.pt>
Subject: Re: Using NFQUEUE from userspace with seteuid
Date: Tue, 02 Mar 2010 03:32:39 +0000
Message-ID: <1267500759.24280.66.camel@r1>
References: <1267410505.18948.46.camel@r1>  <4B8C1F18.8010902@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4B8C1F18.8010902@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="macroman"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

On Mon, 2010-03-01 at 21:10 +0100, Pablo Neira Ayuso wrote:
> backup95 wrote:
> > Hello,
> >=20
> > I wrote a daemon to do packet filtering using libnetfilter-queue.
> >=20
> > It works well except that I ran into problems trying to run it
> > seteuid/setegid to an unpriviliged user.
> >=20
> > Setup and teardown proceeds as root but when I try running the main=
 loop
> > seteuid/setegid to a regular user (just processing IP addresses and
> > calling nfq_set_verdict really) everything slows to a crawl. I don'=
t get
> > any software errors (packets are apparently received and accepted/d=
enied
> > as usual) but all my connections time out or error out (not sure wh=
ich
> > yet). Like I said, works fine as root.
> >=20
> > I'm at a loss to explain this because as far as I can tell the
> > underlying netlink socket mechanism should not depend on root
> > priviledges to send messages. It's strange enough that there's a
> > significant slow down but no hard errors (and by that I mean
> > nfq_set_verdict returning a negative value).
> >=20
> > Can anyone at least please confirm that it should work fine and it =
is
> > worth investigating or else just forget it and run the whole thing =
as
> > root?
> >=20
> > Any comments would be greatly appreciated.
>=20
> Could you post the code or a sketch with the relevant section that I
> could use to reproduce the problem here?

Yes, of course, thanks. The code is now at
git://gitorious.org/bouncer/bouncer.git. I'll be glad to provide detail=
s
but after some testing I hope it won't be necessary to put you through
that trouble.

While cleaning up a few bits and pieces for a good test case I narrowed
down the problem. Seems only ports below 1024 stop working without root=
=2E
In my tests HTTP is blocked while other high ports above the 20000 rang=
e
are not. But the blocked HTTP connections don't register with the
daemon, meaning it is not receiving any netlink packets for connections
below 1024 (to be precise I have only tested port 80 so far) and those
are lost somewhere between kernel-space and user-space.

One odd thing is that my debugging logs have lines like:
bouncer-daemon: Received packet 0
bouncer-daemon: Accepted packet 0
bouncer-daemon: Received packet 1
bouncer-daemon: Accepted packet 1

etc. The integer is from struct nfqnl_msg_packet_hdr *ph->id. These ids
keep incrementing but stop at 1023 when running without root. Is there
any significance to id 1024? I don't see any connection between the id
number and the port number but it seems peculiar nonetheless. This
doesn't happen with UID 0.

Since the extra code to change effective UID is fairly trivial and the
code works otherwise I don't think that it introduced any bugs. The
problem seems to me to be about kernel permissions but my knowledge
there is lacking so I'm at a loss to explain this.=20

Jo=C3=A3o

