From: "Joey" <Joey@Web56.net>
Subject: RE: help with whitelist
Date: Tue, 10 Feb 2009 09:58:41 -0500
Message-ID: <000101c98b90$1112b540$33381fc0$@net>
References: <000001c98af5$d31f3c30$795db490$@net> <49919410.9040906@freemail.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49919410.9040906@freemail.hu>
Content-Language: en-us
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: IPTables <netfilter@vger.kernel.org>

Sorry I forgot the=20

-A LOG_ASIAN -j DROP

Any idea on why the accept isn=92t working?

> -----Original Message-----
> From: G=E1sp=E1r Lajos [mailto:swifty@freemail.hu]
> Sent: Tuesday, February 10, 2009 9:50 AM
> To: Joey
> Cc: IPTables
> Subject: Re: help with whitelist
>=20
> Hi,
>=20
> Am I blind or there is no DROP/REJECT target at all???
>=20
> Swifty
>=20
> Joey =EDrta:
> > Hello All,
> >
> >
> >
> > Im having a problem with a whitelist I am trying to implement and
apparently
> > we still block IP's on the whitelist.
> >
> >
> >
> > First I execute the whitelist like so:
> >
> >
> >
> > :CIDR-WHITE-LIST - [0:0]
> >
> > :LOG_WHITE-LIST - [0:0]
> >
> > -A CIDR-WHITE-LIST -s 1.2.3.4 -j LOG_WHITE-LIST
> >
> > -A LOG_WHITE-LIST -j LOG --log-prefix "CIDR-WHITE-LIST"
> >
> > -A LOG_WHITE-LIST -j ACCEPT
> >
> > -A SMTP_TRAFFIC -j CIDR-WHITE-LIST
> >
> >
> >
> > Then the blacklist like so:
> >
> > :CIDR-ASIAN - [0:0]
> >
> > :LOG_ASIAN - [0:0]
> >
> > :SMTP_TRAFFIC - [0:0]
> >
> > -A INPUT -p tcp -m tcp --dport 25 -m state --state NEW -j SMTP_TRAF=
=46IC
> >
> > -A CIDR-ASIAN -s 2.3.4.5 -j LOG_ASIAN
> >
> > -A LOG_ASIAN -j LOG --log-prefix "SPAM-BLOCK-CIDR-ASIAN"
> >
> > -A SMTP_TRAFFIC -j CIDR-ASIAN
> >
> >
> >
> > I am basically blocking port 25 traffic to blocked IP's.
> >
> > I must be missing something stupid, but cant see it.
> >
> >
> >
> > Any help is greatly appreciated!
> >
> >
> >
> > Thanks!
> >
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe netfilter=
" in
> > the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html
> >
> >


