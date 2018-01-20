From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Error: interval overlaps with previous one (with previously
 valid configuration)
Date: Sat, 20 Jan 2018 10:11:40 +0100
Message-ID: <20180120091140.25jlj6tmgf6rwzan@salvia>
References: <d3d8d2fe-aebb-73ad-8162-44a0a184a7d2@wagsky.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-devel-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d3d8d2fe-aebb-73ad-8162-44a0a184a7d2@wagsky.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jeff Kletsky <netfilter@allycomm.com>
Cc: netfilter-devel@vger.kernel.org, Netfilter Users Mailing list <netfilter@vger.kernel.org>, Phil Sutter <phil@nwl.cc>

On Fri, Jan 19, 2018 at 08:42:52PM -0800, Jeff Kletsky wrote:
> With a previously valid configuration, which "includes" files into the ma=
in
> configuration, I get error messages with the HEAD of master on January 16,
> 2018 9afd72a883e391e366a1d75bb4e1705357e078e9
>=20
> systemd[1]: Starting nftables...
> apu.allycomm.com nft[31431]: In file included from nftables.conf:396:6-34:
> apu.allycomm.com nft[31431]: ./dnat_targets.nft:45:9-23: Error: interval
> overlaps with previous one
> apu.allycomm.com nft[31431]:=A0=A0=A0=A0=A0=A0=A0=A0 ^^^^^^^^^^^^^^^
>
> Unfortunately, the error message both fails to identify what interval
> overlaps as well as failing to identify the location of the conflict.
> dnat_targets only has 23 lines. This feels like a similar problem to the
> "wrong-file" issues that were previously resolved.
>
> Guessing that the problem was caused by
>=20
> commit 9a4b513014cfdeaad6d247b72a7924b3a536cfe9
> Author: Phil Sutter <phil@nwl.cc>
> Date:=A0=A0 Wed Jan 10 21:32:04 2018 +0100
>=20
> =A0=A0=A0 src: Don't merge adjacent/overlapping ranges
>=20
> =A0=A0=A0 [...]
>=20
>=20
> I have reverted back to the previous commit
>=20
> commit 0b3ccd27e12d1df442aa3eac40a2ccb63d6c6407
> Author: Phil Sutter <phil@nwl.cc>
> Date:=A0=A0 Wed Jan 10 13:43:21 2018 +0100
>=20
> =A0=A0=A0 build: Restore per object CFLAGS
>=20
> and at least have an operational system again.
>=20
>=20
> I don't see any commits in today's master branch after the 9a4b51 commit
> that seem to relate either to the interval regression, or to the problem
> with logging.
>=20
>=20
> How can I trace down this problem?

So we have two bugs here.

1) Could you make an example for us to reproduce the misleading error
reporting? Something that we can simply run here to reproduce the
issue would be great.

2) Is there really any overlap in the set that is defined in
dnat_targets, in those 23 lines, or this error is bogus?

Thanks!
--
To unsubscribe from this list: send the line "unsubscribe netfilter-devel" =
in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
