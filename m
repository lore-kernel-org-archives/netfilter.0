From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: eth - NAT - Bridge - veth
Date: Fri, 27 Jun 2014 23:38:35 +0200
Message-ID: <53ADE45B.9000406@plouf.fr.eu.org>
References: <CALPbv1_LnTW-F+xagDb6MU4pOgarNH6BousUbXkuzKNixXZHbA@mail.gmail.com>	<53AD4B1F.1000705@plouf.fr.eu.org>	<CALPbv1-ur2xyv9MUe4UWR1ZeGZwaqgA40-J-8+H_vC58ie20bw@mail.gmail.com>	<53ADAF27.5070505@plouf.fr.eu.org>	<CALPbv18b4ZnynXOUW59tu1aq2=uMi54M4ZUMUhacijCN1VVcbg@mail.gmail.com>	<53ADC38D.5090805@plouf.fr.eu.org>	<CALPbv18miJQXrdn9CbwVShx4Fn8XrbVs8Hts-n0Oafy+3+xbMg@mail.gmail.com> <CALPbv189=OY0wTGYE7G5QCQ2JwtBA=VdqFYyDBH69fveHwaAfw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CALPbv189=OY0wTGYE7G5QCQ2JwtBA=VdqFYyDBH69fveHwaAfw@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Vijay Viswanathan <vijay.vishy@gmail.com>
Cc: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Vijay Viswanathan a =E9crit :
> adding -m state --state NEW,ESTABLISHED seems to do the trick.
>=20
> iptables -t nat -A PREROUTING -i eth1 -p tcp -d 10.4.38.182 --dport
> 2300 -m state --state NEW,ESTABLISHED -j DNAT --to 192.168.10.2:2300

Not in any way. The chains of the nat table see only packets in the NEW
state so this match is completely superflous. Besides, normal TCP
packets have the NEW or ESTABLISHED state.
