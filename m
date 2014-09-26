From: Maarten Vanraes <maarten@ba.be>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Fri, 26 Sep 2014 16:02:37 +0200
Message-ID: <1548623.uVd0b5ANDY@localhost>
References: <1955116.aThXd60LEg@localhost.localdomain> <3545996.7GKZQHL5tP@localhost> <542567B2.4060800@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <542567B2.4060800@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Op vrijdag 26 september 2014 15:18:42 schreef Pascal Hambourg:
> Maarten Vanraes a =E9crit :
> > Op woensdag 24 september 2014 15:38:26 schreef Eliezer Croitoru:
> >> VOIP and STREAMING are beasts!!!
> >> There are modules which analyze them and also recognize them but y=
ou
> >> will need to enable them first.
> >=20
> > what kind of modules do you know that help conntracking this kind o=
f
> > stuff?
>=20
> For SIP : nf_conntrack_sip. There is a nf_conntrack_<protocol> helper
> for each supported "complex" protocol (FTP, IRC, PPTP...). Their purp=
ose
> is to set the state of the first packet of the data connection to
> RELATED, and copy the connmark of the control connection to the data
> connection. On a box doing NAT, you also need the related
> nf_nat_<protocol> module.
>=20
> > and... what about ipv6 and multiple ISPs? (but without natting, but=
 still
> > no bgp or something), won't i still have the same problem?
>=20
> Yes.


awesome, this makes it totally clear... thx!
--=20
BA NV
IT & Security
