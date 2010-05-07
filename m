From: Richard Feng <rfeng@wurldtech.com>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 7 May 2010 09:22:00 -0700
Message-ID: <201005070922.00629.rfeng@wurldtech.com>
References: <201005061651.40203.rfeng@wurldtech.com> <4BE3E41F.7030601@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE3E41F.7030601@plouf.fr.eu.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On May 7, 2010 02:57:51 am Pascal Hambourg wrote:
> Hello,
>=20
> Richard Feng a =E9crit :
> >=20
> > I am using Linux 2.6.29. I have the problem for using 'conntrack'=20
> > (version:0.9.14) to block the traffic.
> > Using the following command as example:
> >   conntrack -D -s 1.1.1.1 -d 2.2.2.2
> > After execution, it appears the connection info was deleted -
> >   conntrack -L | grep 1.1.1.1 -- shows the entry was deleted.
> >=20
> > However, the connection is still active
>=20
> What do you mean exactly ?
> The conntrack tool only deals with netfilter connection tracking, not
> with the actual connection (e.g. it won't send RST's in order to tear=
 it
> down). How it may affect the actual connection depends on the iptable=
s
> ruleset.
>=20
It says it can block traffic in the=20
document "http://conntrack-tools.netfilter.org/manual.html#conntrack".
Maybe the doc is outdated? What should I do if I want to break current=20
connection? Using 'cutter'?



