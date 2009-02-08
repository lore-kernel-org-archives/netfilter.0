From: "Tim Ritberg" <tim_rit@gmx.de>
Subject: Re: Incoming packet in wrong chain
Date: Sun, 08 Feb 2009 23:44:30 +0100
Message-ID: <20090208224430.207240@gmx.net>
References: <20090208171752.32010@gmx.net> <498F4E63.8050603@inl.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <498F4E63.8050603@inl.fr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

> For Netfilter connection tracking, a NEW TCP connection does not have=
 to
> start with a SYN packet. If
> /proc/sys/net/netfilter/nf_conntrack_tcp_loose is set to 1 (default),
> Netfilter will try to pick up connection. By this mean, it is possibl=
e
> to recover a connection (in some fail-over case for example), but it
> introduces this looking-weird-at-first behaviour.
>=20
> BR,
> - --
> Eric Leblond <eleblond@inl.fr>

because of that netfilter put it in INPUT-Chain?
and I wonder why it occurs randomly.
Should I switch  to nf_conntrack_tcp_loose 0?

--=20
Psssst! Schon vom neuen GMX MultiMessenger geh=F6rt? Der kann`s mit all=
en: http://www.gmx.net/de/go/multimessenger01
