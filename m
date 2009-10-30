From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: 64bit MARK
Date: Fri, 30 Oct 2009 10:52:00 +0100
Message-ID: <1256896320.1254.82.camel@francois.tc.commsmundi.com>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
	 <4AEA176A.6060501@trash.net>
	 <1256893245.1254.66.camel@francois.tc.commsmundi.com>
	 <4AEAAFD7.1070407@trash.net>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AEAAFD7.1070407@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On Fri, 2009-10-30 at 10:20 +0100, Patrick McHardy wrote:
> Fran=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD w=
rote:
> > On Thu, 2009-10-29 at 23:30 +0100, Patrick McHardy wrote:
> >>> Would it be possible to have 64bit MARKs with 64bit architectures=
?=20
> >>>
> >>> Apparently they are defined as "unsigned long" in linux headers, =
but
> >>> iptables limits them to 32bit.
> >> Thats from far far back. The unsigned long only exists in compatib=
ility
> >> structures, all new revisions use 32 bit. This is deliberate to ma=
ke
> >> sure they're same-sized on all architectures and rulesets don't be=
have
> >> differently.
> >=20
> > It might be an uncommon case, but many things I do need MARKs and 3=
2bits
> > is just not enough!
> >=20
> > For example, for input traffic I do marking for:
> > - ip rules (sometimes A LOT of rules)
> > - tc filters (sometimes A LOT of filters)
> > - gateway selection (ip rules for multipath)
> > - marking input interface to use in IMQ
> >=20
> > Any ideas then for someone needing more than 32bits MARK? I could u=
se
> > TOS bits (usable with ip rules and tc filters), but it's just so ug=
ly,
> > and would screw in any network using it...
> >=20
> > Could the other 32 bits be used as a MARK "category" feature availa=
ble
> > only for 64bit arch?
>=20
> No, as I said, rulesets are supposed to behave similar on all
> architectures. Since neither routing rules nor TC classifiers
> support more than 32 bit, it would be useless anyways. But you
> can usually deal with this by organizing your marking rules
> properly.
>=20
> First, all of the above support using masks for mark values,
> which might be helpful. For routing and gateway selection you
> only need the mark values at PREROUTING and OUTPUT, so you
> can reuse them afterwards. TC marking is best done in
> POSTROUTING since that doesn't interfere with routing. If
> for some reason you want to do TC classification earlier than
> that, you can use the CLASSIFY target, which doesn't use
> mark values but priority values.

Agreed, POSTROUTING is not a problem, it's more incoming traffic. I
already play a lot with masks, the problem being that I use IMQ device
that needs tc marking in PREROUTING and unfortunately does not work wit=
h
CLASSIFY.

I have systems with LOTS of ifaces, gateways and filters/rule which wor=
k
very nicely in multipath.

Currently, I'm using the 32 bits as follows:
Input Iface =3D 5 bits (up to 32 ifaces)
Gateway =3D 5 bits (up to 32 gateways)
IMQ tc mark =3D 11 bits (up to 2048 filters)
ip rule filters =3D 11 bits (up to 2048 rules)

It is quite OK for now, but I would have loved to have margin for more
rules or new features in the future (I'd like to play with NFQUEUE
things for Authentication, IDS, ... and more bits would have been cool)=
=2E

Thanks for the answer, I think I can make it trying to make more use of
u32 filters and other things. If you have any other suggestions or
ideas, I would be happy to hear them!

Saludos,
=46ran=C3=A7ois.

