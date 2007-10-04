From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: conntrack ctstate - multiple ISP links
Date: Thu, 04 Oct 2007 15:58:24 +0200
Message-ID: <4704F180.5000200@plouf.fr.eu.org>
References: <4704A472.5080609@darkstar.nom.za> <4704C15E.9090203@plouf.fr.eu.org> <4704EB43.2000902@darkstar.nom.za>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4704EB43.2000902@darkstar.nom.za>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter <netfilter@vger.kernel.org>

[Please send your reply on the list so everyone can see it]

Paulo Andre a =E9crit :
>>
>>> Apparently I need this to get multiple isp links working correctly =
on=20
>>> a FW. Packets entering interface eth2/eth3 all still leaving eth1,=20
>>> default GW.
>>
>> Can you elaborate ?
>=20
> The incoming packets are not leaving out of the correct interfaces,=20
> someone else has suggested that I need to use iptables as below:
>=20
> iptables -t mangle -N alreadyestablished
> iptables -t mangle -A alreadyestablished -j CONNMARK --restore-mark
>=20
> iptables -t mangle -A PREROUTING -m connmark ! --mark 0 -j=20
> alreadyestablished
> iptables -t mangle -A PREROUTING -m ctstate --conntrack NEW -i eth1 -=
j=20
> CONNMARK --set-mark 11
> iptables -t mangle -A PREROUTING -m ctstate --conntrack NEW -i eth2 -=
j=20
> CONNMARK --set-mark 12
>=20
> and then iproute2 to route based on the 'mark'.
> Would this be the correct solution?

The principle is correct.

> I am trying to get ctstate working so that I can test this

The syntax is wrong. The correct syntax is "-m conntrack --ctstate NEW"=
=2E
Besides, this just does the same as "-m state --state NEW".
