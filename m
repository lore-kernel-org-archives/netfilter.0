From: "Pieter De Wit" <Pieter.DeWit@vodacom.co.za>
Subject: RE: DNAT and local hosts
Date: Tue, 8 May 2007 08:09:52 +0200
Message-ID: <C3FA62B1A90D7440B9B6C7C31895994F03663A35@zadbn02100.vodacom.corp>
References: <C3FA62B1A90D7440B9B6C7C31895994F03663A32@zadbn02100.vodacom.corp>	<Pine.LNX.4.61.0705071801150.17280@yvahk01.tjqt.qr>
	<C3FA62B1A90D7440B9B6C7C31895994F08041C@zadbn02100.vodacom.corp>
	<46401311.2000507@rchq.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
In-Reply-To: <46401311.2000507@rchq.co.za>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="windows-1252"
To: Ray Leach <spoons@rchq.co.za>
Cc: netfilter@lists.netfilter.org

Thought so - the other way is to run portfwd and use it to forward the
port "back to C1" - it would have helped if they had an input chain on
-t nat :)

Thanks any ways=20

-----Original Message-----
From: Ray Leach [mailto:spoons@rchq.co.za]=20
Sent: 2007/05/08 08:05
To: Pieter De Wit
Cc: Jan Engelhardt; netfilter@lists.netfilter.org
Subject: Re: DNAT and local hosts

Pieter De Wit wrote:
> *BEEP* *BUZZ* I know - but it's for a closed source app that I need to

> do this - and it takes the address from the server, the protocol=20
> doesn't carry it it :)
>=20
>=20
> -----Original Message-----
> From: Jan Engelhardt [mailto:jengelh@linux01.gwdg.de]
> Sent: Mon 2007/05/07 18:01
> To: Pieter De Wit
> Cc: netfilter@lists.netfilter.org
> Subject: Re: DNAT and local hosts
> =20
>=20
> On May 7 2007 17:54, Pieter De Wit wrote:
>> Now, all connections are routed out via FW:ppp0 and at NAT'ed. There=20
>> is a rule that allows connections to ppp0 on port 1234 and DNAT's=20
>> them to C1. When C2 makes a connection to 1.2.3.4:1234 it fails with=20
>> "Connection refused" since there is no "server" listening on the=20
>> firewall's ppp0,port 1234.
>=20
> *BEEP* *BUZZ* *ERROR*. You have a direct connection between C1 and C2.
>=20
>=20
> Jan

There is no routing between C1 and C2, so your firewall never sees the
traffic between the 2.

Put C1 and C2 on two seperate physical networks and connect them through
firewall to get routing to happen, then you can use iptables to do
NATing between them.

Else put two interfaces into your firewall, give each interface an ip
address in the same subnet, configure bridging between the two, put C1
on the end of one interface and C2 on the other if, then look into
ebtables.
=93This e-mail is sent on the Terms and Conditions that can be accessed b=
y Clicking on this link http://www.vodacom.co.za/legal/email.jsp "

