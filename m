From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Netfilter Performance when using MAC filter
Date: Thu, 01 Nov 2007 11:05:10 +0100
Message-ID: <4729A4D6.2020106@plouf.fr.eu.org>
References: <54ea295d0710310923x1e5eff5cy6d70445d90d9e56e@mail.gmail.com>	 <1193855211.18366.73.camel@grateful.d.umn.edu>	 <4728D541.9010308@plouf.fr.eu.org> <1193859183.5142.2.camel@grateful.d.umn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1193859183.5142.2.camel@grateful.d.umn.edu>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Matt Zagrabelny a =E9crit :
> On Wed, 2007-10-31 at 20:19 +0100, Pascal Hambourg wrote:
>=20
>>Matt Zagrabelny a =E9crit :
>>
>>>If so, you can do MAC filtering (performance shouldn't matter as the=
 MAC
>>>address is in the link header)
>>
>>Can you please elaborate about the relationship beween filtering=20
>>performance and the address layer ?
>=20
> There is nothing to elaborate on. ;)
>=20
> The frame contains the MAC address. This is what iptables will be
> looking at. If the box running iptables is on the same network/vlan a=
s
> the rest of the traffic it is expecting to filter, then it will have =
MAC
> addresses of actual hosts, however, if traffic is coming from a
> different network/vlan then said traffic will have been routed and th=
e
> frame will have changed, thus the MAC address will be the MAC of the
> network boundary, namely the router/gateway.

Sorry, but I still do not see the point in "performance shouldn't matte=
r=20
as the MAC address is in the link header". Performance (read : speed) i=
s=20
mostly related to the number of rules, isn't it ?
