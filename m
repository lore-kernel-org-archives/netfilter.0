From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Issue migrating "iptables -m socket --transparent" into nftables
Date: Tue, 18 Aug 2020 12:17:04 +0200
Message-ID: <20200818101704.GA11030@salvia>
References: <30147982.tmreYhUOsE@deimos>
 <20200817193406.GE15804@breakpoint.cc>
 <3052032.WrxeKnI8BP@deimos>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <3052032.WrxeKnI8BP@deimos>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Nirgal =?iso-8859-1?Q?Vourg=E8re?= <contact_vgernf@nirgal.com>
Cc: Florian Westphal <fw@strlen.de>, netfilter@vger.kernel.org, Balazs Scheidler <bazsi77@gmail.com>

On Tue, Aug 18, 2020 at 01:25:45AM +0200, Nirgal Vourg=E8re wrote:
> Maybe there's some magic in the old transparent module, that silently add=
 some conditions?

Balazs cannot reply to the mailing list for some reason. He sent me
this privately:

"The original iptables "socket" match had an extra check so that it wouldn't
match listener sockets, at least by default (that is if --nowildcard is not
specified).

I don't see however how "outbound masqueraded connection" could be
impacted. The "socket transparent 1" expression should require that the
socket being matched has IP_TRANSPARENT setsockopt set. Are those
connections also initiated by haproxy?

In any case, I think the check to ignore wildcard bound listener sockets is
definitely missing, however I am not sure how to properly add it to
nftables. If I added it to the socket match implementation that might break
a few currently well behaving use-cases.

This is the check that is in iptables -m socket:

                wildcard =3D (!(info->flags & XT_SOCKET_NOWILDCARD) &&
                            sk_fullsock(sk) &&
                            inet_sk(sk)->inet_rcv_saddr =3D=3D 0);

And then if --transparent is used, these sockets are not accepted / the
rule does not match."
