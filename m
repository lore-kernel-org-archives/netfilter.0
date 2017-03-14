From: Eric Leblond <eric@regit.org>
Subject: Re: Modifying NFQUEUE rules in flight
Date: Tue, 14 Mar 2017 09:08:15 +0100
Message-ID: <1489478895.15907.6.camel@regit.org>
References: <20170314011838.GA9432@imp.flyn.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20170314011838.GA9432@imp.flyn.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: "W. Michael Petullo" <mike@flyn.org>, netfilter@vger.kernel.org

Hi,

On Mon, 2017-03-13 at 21:18 -0400, W. Michael Petullo wrote:
> I have a question about the use of NFQUEUE from userspace.
>=20
> Imagine two firewall rules:
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0(A): NFQUEUE tcp -- imp x.x.x.x tcp dpt:http NFQU=
EUE num 0
>=20
> and
>=20
> =A0=A0=A0=A0=A0=A0=A0=A0(B): NFQUEUE tcp -- imp x.x.x.x tcp dpt:http NFQU=
EUE num 1
>=20
> I am interested in making the callback associated with rule
> (A)/NFQUEUE 0
> remove rule (B) and replace it (usng firewalld/dbus in my case)
> with another, more specific rule. For example, perhaps the callback
> for
> NFQUEUE 0 would rewrite rule (B) to include a source port. I am
> further
> interested in having this new rule apply to the packet being
> processed.

I don't think you can do this. What you could do a push a packet mark
at verdict time on rule A. With a filter on mark on rule B, it will
only match when rule A wants it to match.

BR,
--
Eric Leblond <eric@regit.org>
