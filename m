From: =?ISO-8859-1?Q?Fran=E7ois?= Delawarde 
	<fdelawarde@wirelessmundi.com>
Subject: Re: 64bit MARK
Date: Fri, 30 Oct 2009 11:22:58 +0100
Message-ID: <1256898178.1254.101.camel@francois.tc.commsmundi.com>
References: <1256835945.1254.46.camel@francois.tc.commsmundi.com>
	 <4AEA176A.6060501@trash.net>
	 <1256893245.1254.66.camel@francois.tc.commsmundi.com>
	 <4AEAAFD7.1070407@trash.net>
	 <1256896320.1254.82.camel@francois.tc.commsmundi.com>
	 <4AEAB811.7000707@trash.net>
	 <1256897706.1254.97.camel@francois.tc.commsmundi.com>
	 <4AEABD57.7050001@trash.net>
Reply-To: fdelawarde@wirelessmundi.com
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AEABD57.7050001@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Patrick McHardy <kaber@trash.net>
Cc: netfilter@vger.kernel.org

On Fri, 2009-10-30 at 11:17 +0100, Patrick McHardy wrote:
> Fran=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=
=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD=EF=BF=BD wrote:
> > On Fri, 2009-10-30 at 10:55 +0100, Patrick McHardy wrote:
> >> Well, one more. You don't need any mark values for the input inter=
face,
> >> both routing rules and TC classifiers (flow, route, meta) support =
iif
> >> classification directly.
> >=20
> > I unfortunately do not need it for routing rules which works nice, =
but
> > for TC classifiers, and apparently it does not work with those, may=
be I
> > don't know how to use them.
> >=20
> > # tc filter add dev imq0 parent 1: iif eth0 flowid 1:2
> > Unknown filter "iif", hence option "eth0" is unparsable
>=20
> tc filter add ... route fromif ... classid ...
>=20
> should work.

You're my heroe, I just gained 5 out of the precious 32bits!!

Thanks a lot,
=46ran=C3=A7ois.

