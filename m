From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: advanced routing with NAT: returning UDP traffic
Date: Fri, 26 Sep 2014 15:18:42 +0200
Message-ID: <542567B2.4060800@plouf.fr.eu.org>
References: <1955116.aThXd60LEg@localhost.localdomain> <2942322.0b85jGZzF5@localhost> <5422BB42.6040707@ngtech.co.il> <3545996.7GKZQHL5tP@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3545996.7GKZQHL5tP@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Maarten Vanraes <maarten@ba.be>
Cc: netfilter@vger.kernel.org

Maarten Vanraes a =E9crit :
> Op woensdag 24 september 2014 15:38:26 schreef Eliezer Croitoru:
>> VOIP and STREAMING are beasts!!!
>> There are modules which analyze them and also recognize them but you
>> will need to enable them first.
>=20
> what kind of modules do you know that help conntracking this kind of =
stuff?

=46or SIP : nf_conntrack_sip. There is a nf_conntrack_<protocol> helper
for each supported "complex" protocol (FTP, IRC, PPTP...). Their purpos=
e
is to set the state of the first packet of the data connection to
RELATED, and copy the connmark of the control connection to the data
connection. On a box doing NAT, you also need the related
nf_nat_<protocol> module.

> and... what about ipv6 and multiple ISPs? (but without natting, but s=
till no=20
> bgp or something), won't i still have the same problem?

Yes.
