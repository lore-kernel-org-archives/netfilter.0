From: Yuwen Dai <yuwen.dai@windriver.com>
Subject: Re: how to drop a TCP segment with specific sequence
Date: Mon, 13 Feb 2012 09:50:26 +0800
Message-ID: <1329097826.2704.3.camel@localhost>
References: <1328760028.2710.5.camel@localhost>
	 <20120211092421.GC6946@tosh.sltosis.org>
Reply-To: <yuwen.dai@windriver.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20120211092421.GC6946@tosh.sltosis.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: SamLT <sam@sltosis.org>
Cc: netfilter@vger.kernel.org

=E5=9C=A8 2012-02-11=E5=85=AD=E7=9A=84 10:24 +0100=EF=BC=8CSamLT=E5=86=99=
=E9=81=93=EF=BC=9A
> On Thu, Feb 09, 2012 at 12:00:28PM +0800, Yuwen Dai wrote:
> > Dear all,
> >=20
> > I'm simulating an network environment that some TCP segments are
> > missing. So I want to use iptables to drop these segments. How to w=
rite
> > a rule to drop a segment with a specific sequence number from a hos=
t?
>=20
> I suppose you can start playing around with --u32 ?

Thanks.  I'll study how to use "--u32" option.

Best regards,
Yuwen

>=20
>=20
> > Thanks in advance.
> >=20
> > Best regards,
> > Yuwen Dai
> >=20
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html


