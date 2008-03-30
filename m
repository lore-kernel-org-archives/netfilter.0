From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: CONNMARK and ip rule fwmark
Date: Sun, 30 Mar 2008 18:10:16 +0200
Message-ID: <47EFBB68.1020107@plouf.fr.eu.org>
References: <046B6BE8F9E1409CAF96941CED215BD0@shs1> <bd29d6543567ecfd7c483671f163d14e@localhost> <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Jan Engelhardt a =E9crit :
>=20
> On Sunday 2008-03-30 13:23, Franck JONCOURT wrote:
>=20
>> What about using the nat table to add your mark on a whole connectio=
n
>> instead of using the mangle table ?
>=20
> Using the nat table to 'simulate' -m conntrack --ctstate NEW, that's
> just a gross hack IMO.

I agree that the use of the nat table for any purpose not related to NA=
T=20
should be avoided. However the advantage of the nat table is that it=20
sees only one packet per connection, while "-m conntrack --ctstate NEW"=
=20
or "-m state --state NEW" may match multiple packets per connection,=20
e.g. duplicate TCP SYN or all UDP sent packets in the original directio=
n=20
before the first packet sent in the return direction.

>>> If I remove "fwmark 71" in the "ip rule add" command, then it is wo=
rking,
>>> but has side effects with the following:
>>>
>>> # iptables -t nat -A PREROUTING -p TCP -d publicip -j DNAT --to 10.=
4.0.1
>>>
>>> My observations seem to tell me, that ip rule is evaluated BEFORE=20
>>> iptables rules are applied, so the mark is not set yet.
>=20
> See http://jengelh.hopto.org/images/nf-packet-flow.png , routing=20
> decision takes place in the middle. (It's called _PRE_ROUTING_ for a=20
> reason.)

My understanding is that the side effects mentioned by the OP apply to=20
the return packets of DNATed connections, which go through the OUTPUT=20
chains. The diagram show that a routing decision occurs before the=20
OUTPUT chains, but a rerouting may occur because of a mark or=20
destination NAT.
