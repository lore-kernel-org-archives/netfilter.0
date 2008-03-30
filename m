From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: CONNMARK and ip rule fwmark
Date: Sun, 30 Mar 2008 20:58:38 +0200
Message-ID: <47EFE2DE.80202@plouf.fr.eu.org>
References: <046B6BE8F9E1409CAF96941CED215BD0@shs1> <bd29d6543567ecfd7c483671f163d14e@localhost> <alpine.LNX.1.10.0803301648110.28605@fbirervta.pbzchgretzou.qr> <47EFBB68.1020107@plouf.fr.eu.org> <alpine.LNX.1.10.0803301849080.28605@fbirervta.pbzchgretzou.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.1.10.0803301849080.28605@fbirervta.pbzchgretzou.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Jan Engelhardt <jengelh@computergmbh.de>
Cc: netfilter@vger.kernel.org

Jan Engelhardt a =E9crit :
>=20
> On Sunday 2008-03-30 18:10, Pascal Hambourg wrote:
>=20
>> I agree that the use of the nat table for any purpose not related
>> to NAT should be avoided. However the advantage of the nat table is
>> that it sees only one packet per connection, while "-m conntrack
>> --ctstate NEW" or "-m state --state NEW" may match multiple packets
>> per connection, e.g. duplicate TCP SYN or all UDP sent packets in
>> the original direction before the first packet sent in the return
>> direction.
>=20
> That's nonsense -- the nat table sees every packet that is IPCT_NEW:

The nonsense would be that the nat table sees packets which don't creat=
e=20
a new connection, because this would be totally useless.

> iptables -t nat -A OUTPUT -d 134.76.13.21 -p tcp --syn -j LOG
> --log-prefix "[nat] "
> iptables -t filter -A OUTPUT -d 134.76.13.21 -p tcp --syn -j LOG
> --log-prefix "[filt] "
> iptables -t filter -A OUTPUT -d 134.76.13.21 -p tcp --syn -j DROP

This test is bogus because the final DROP deletes the conntrack entry=20
(the packet is dropped before the connection is confirmed) so each=20
packet appears to create a new connection and goes through the nat tabl=
e.
