From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Conntrackd and Stats
Date: Thu, 1 Aug 2013 11:54:06 +0200
Message-ID: <20130801095406.GA11906@localhost>
References: <ebed8973f57495e3091005d880fcb4ca@justnet.pl>
 <1375345894.11948.5.camel@ice-age.regit.org>
 <d22255983d977623c2cb29dedbd9e717@justnet.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <d22255983d977623c2cb29dedbd9e717@justnet.pl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: "Adam N." <adam.n@justnet.pl>
Cc: Eric Leblond <eric@regit.org>, netfilter@vger.kernel.org

On Thu, Aug 01, 2013 at 11:23:09AM +0200, Adam N. wrote:
> W dniu 01.08.2013 10:31, Eric Leblond napisa=C5=82(a):
>=20
> >Hi,
> >
> >Le jeudi 01 ao=C3=BBt 2013 =C3=A0 09:46 +0200, Adam N. a =C3=A9crit =
:
> >
> >>Hello everyone, At the beginning I would like to thank everyone
> >>for the work put into the project netfilter.
> >
> >Thanks Adam :)
> >
> >>We use conntrackd projekt to save NAT connections. Recently we
> >>noticed that with the change of the kernel version also changed
> >>format logs( disappeared amount of transferred packets and
> >>bytes). My question is: Is it possible to restore the record
> >>containing the number of packets and bytes transferred in
> >>connection?
> >
> >You can do
> >echo "1" > /proc/sys/net/netfilter/nf_conntrack_acct
> >
> >If you want to have start time of the conntrack entries, you can
> >also do
> >
> >echo "1" > /proc/sys/net/netfilter/nf_conntrack_timestamp
>=20
> Thank you very much
> you know in what version of the kernel was presented
> nf_conntrack_timestamp?
>=20
> In order not to ask unnecessary questions in the future, are
> somewhere information about such changes, except for the kernel
> sources :)

See Documentation/networking/nf_conntrack-sysctl.txt in recent
kernels.

Kernel timestamping is there since 2.6.39. Accounting for conntrack
since long time ago (I can find it in 2.6.27 as an optional
extension that you can enable on demand via /proc interface).

Regards.
