From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?=
	 =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: Re: How to drop existing connections
Date: Mon, 07 Apr 2008 12:28:19 +0300
Message-ID: <1207560499.5879.22.camel@casper.meteor.dp.ua>
References: <316483.74640.qm@web65716.mail.ac4.yahoo.com>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <316483.74640.qm@web65716.mail.ac4.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Vitaly <vitaly_il@yahoo.com>
Cc: netfilter@vger.kernel.org

=F7 =F0=CE=C4, 07/04/2008 =D7 02:05 -0700, Vitaly =D0=C9=DB=C5=D4:
> --- Karim Asif <karimas@kfupm.edu.sa> wrote:
>=20
> > Using iptables?
> > just add a drop rule having src/dest ip addressess
> > and ports and protocol on
> > top of other rules.
>=20
> Probably I wasn't clear - I want to kill existing,
> already opened connection.=20
> Now, after reading some articles/threads, it seems
> that only utils like tcpkill, cutter can do this...

You can use conntrack utility to remove conntrack entry, if you also
drop INVALID packets with iptables this will let you kill connection.

> >=20
> > ----- Original Message -----=20
> > From: "Vitaly" <vitaly_il@yahoo.com>
> > To: <netfilter@vger.kernel.org>
> > Sent: Monday, April 07, 2008 11:30 AM
> > Subject: How to drop existing connections
> >=20
> >=20
> > > I'd like to kill all existing connections to the
> > > specific IP/port. What is the simpliest way to do
> > > this?
> > >
> > > Thanks,
> > > Vitaly
> > >
> > >
> > >=20
> > >
> >
> _____________________________________________________________________=
_______________
> > > You rock. That's why Blockbuster's offering you
> > one month of Blockbuster=20
> > > Total Access, No Cost.
> > > http://tc.deals.yahoo.com/tc/blockbuster/text5.com
> > > --
> > > To unsubscribe from this list: send the line
> > "unsubscribe netfilter" in
> > > the body of a message to majordomo@vger.kernel.org
> > > More majordomo info at=20
> > http://vger.kernel.org/majordomo-info.html=20
> >=20
> >=20
>=20
>=20
>=20
>       _______________________________________________________________=
_____________________
> You rock. That's why Blockbuster's offering you one month of Blockbus=
ter Total Access, No Cost. =20
> http://tc.deals.yahoo.com/tc/blockbuster/text5.com
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.=
ua>

