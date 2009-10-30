From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: 64bit MARK
Date: Fri, 30 Oct 2009 10:00:45 +0100
Message-ID: <1256893245.1254.66.camel@francois.tc.commsmundi.com>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
	 <4AEA176A.6060501@trash.net>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AEA176A.6060501@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On Thu, 2009-10-29 at 23:30 +0100, Patrick McHardy wrote:
> Fran=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD w=
rote:
> > Hello,
> >=20
> > Would it be possible to have 64bit MARKs with 64bit architectures?=20
> >=20
> > Apparently they are defined as "unsigned long" in linux headers, bu=
t
> > iptables limits them to 32bit.
>=20
> Thats from far far back. The unsigned long only exists in compatibili=
ty
> structures, all new revisions use 32 bit. This is deliberate to make
> sure they're same-sized on all architectures and rulesets don't behav=
e
> differently.

It might be an uncommon case, but many things I do need MARKs and 32bit=
s
is just not enough!

=46or example, for input traffic I do marking for:
- ip rules (sometimes A LOT of rules)
- tc filters (sometimes A LOT of filters)
- gateway selection (ip rules for multipath)
- marking input interface to use in IMQ

Any ideas then for someone needing more than 32bits MARK? I could use
TOS bits (usable with ip rules and tc filters), but it's just so ugly,
and would screw in any network using it...

Could the other 32 bits be used as a MARK "category" feature available
only for 64bit arch?

Thanks,
=46ran=C3=A7ois.

