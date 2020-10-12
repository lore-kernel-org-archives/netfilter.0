From: Florian Westphal <fw@strlen.de>
Subject: Re: [nftables] Log to DNAT rule
Date: Mon, 12 Oct 2020 13:08:36 +0200
Message-ID: <20201012110836.GH5723@breakpoint.cc>
References: <dfc15fba-2fff-a658-c4db-fc0a64603fb6@bersol.info>
 <1b8888e3-f368-73d0-c8cc-b4e04ff4901a@bersol.info>
 <CAKcfE+aM_r4J9t=8GnjhXbZfBeDj7B2_66O_CYeY94NpvWcxOw@mail.gmail.com>
 <d847854e-8457-fc84-dca7-f1a4fedb978a@bersol.info>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d847854e-8457-fc84-dca7-f1a4fedb978a@bersol.info>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Alberto <alberto@bersol.info>
Cc: netfilter@vger.kernel.org

Alberto <alberto@bersol.info> wrote:
> >     I'm starting with nftables, and I want to log SSH inputs, but I hav=
e SSH
> >     port in another port with "prerouting" with this rule:
> >=20
> >     -----------------------------------------------
> >     table ip my-nat {
> >     =A0 chain PREROUTING {
> >     =A0=A0=A0=A0=A0 type nat hook prerouting priority 0; policy accept;
> >     =A0=A0=A0=A0=A0 iifname "enp1s0" tcp dport 9999 dnat to 192.168.1.3=
:22
> >     <http://192.168.1.3:22>
> >     =A0 =A0 =A0 ...

> >     But this log any try to 22 port (there are thousands daily), and I =
want
> >     log only conections to 9999 port, because only on this port, return
> >     login.
> >=20
> >     If my Inputs rule are the following...
> >=20
> >     -----------------------------------------------
> >     =A0=A0=A0=A0 ...
> >     =A0=A0=A0=A0 iifname "enp1s0" tcp dport 9999 ct state new log prefi=
x "[NFTABLES]
> >     SSH: " accept
> >     =A0=A0=A0=A0 iifname "enp1s0" tcp dport 22 ct state new accept
> >     =A0=A0=A0=A0 ...
> >     -----------------------------------------------
> >=20
> >     It log nothing.

iifname "enp1s0" meta l4proto tcp ct state new ct original proto-dst 9999 l=
og prefix "[NFTABLES] SSH: " accept
