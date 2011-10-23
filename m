From: "Nikolay S." <nowhere@hakkenden.ath.cx>
Subject: Re: tag process's future sockets for iptables rules?
Date: Sun, 23 Oct 2011 23:20:58 +0400
Message-ID: <1319397658.9866.6.camel@hakkenden.homenet>
References: <1RHeWb-0000Qb-4M@internal.tormail.net>
	 <alpine.LNX.2.01.1110222242100.17728@frira.zrqbmnf.qr>
	 <1RI1gs-000H1O-OY@internal.tormail.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1RI1gs-000H1O-OY@internal.tormail.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "p. awa" <pawa@tormail.net>
Cc: netfilter@vger.kernel.org

=D0=92 =D0=92=D1=81=D0=BA, 23/10/2011 =D0=B2 17:18 +0000, p. awa =D0=BF=
=D0=B8=D1=88=D0=B5=D1=82:
> > >| netfilter_add_tag("public-addresses-proxied-via-tor");
> > >| netfilter_add_tag("internal-addresses-directly");
> > >| netfilter_remove_tag("proxy-dns");
> > >| execlp("wget", ...);
> >
> > A socket option, SO_MARK, for use with setsockopt/getsockopt.
>=20
> but setsockopt is per socket. i'm looking for something that is
> per process (and inherited by children - in the example, wget).
> this is to replace what i do at the moment, namely
>=20
> | setgid(123);
> | execlp("wget", ...);
>=20
> and
>=20
> # iptables ... -m owner --gid-owner 123 ...

Well, you could do interposition of libc's socket() with LD_PRELOAD, an=
d
call setsockopt SO_MARK in the wrapper.

> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


