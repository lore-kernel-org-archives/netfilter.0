From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: iptables SNAT and sip "REGISTER"
Date: Thu, 11 Sep 2003 11:11:12 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15C297@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: Arnt Karlsen <arnt@c2i.net>, netfilter@lists.netfilter.org

A common VoIP protocol being used is H323 which NetMeeting also uses. =
tcpdump ports 389,522,1503,1720,1731,8080,1469 to see if packets are =
going through any of these ports. If they are then there's a good chance =
it's H323 and you need the p-o-m patch for H323 to get it working =
through NAT..

-----Original Message-----
From: Arnt Karlsen [mailto:arnt@c2i.net]
Sent: Thursday, September 11, 2003 10:38 AM
To: netfilter@lists.netfilter.org
Subject: Re: iptables SNAT and sip "REGISTER"


On Tue, 09 Sep 2003 08:21:06 +0900,=20
Zen Kato <zenkato@pis.bekkoame.ne.jp> wrote in message=20
<20030909082106I.zenkato@pis.bekkoame.ne.jp>:

> Hi Arnt,
>=20
> Thank you for your comment.
> I upgraded to RHL-7.3 linux-2.4.20-20.7 and iptables-1.2.8-8.72.3.

..excellent.

> SIP UAs could send and receive "REGISTER", "INVITE", "200 OK",=20
> "ACK" and udp media packets via .100.30. So, DNAT/SNAT of iptales-
> 1.2.8 works fine, but both sip phones can not have "audio"?!
>=20
> Both sip phones worked fine when I tested using non-NAT with a local
> sip proxy. I don't know why this case does not work.

..pass, I dunno much about VoIP.  This works in your lan but=20
not across your firewall?  Does it conflict with nat?

--=20
..med vennlig hilsen =3D with Kind Regards from Arnt... ;-)
...with a number of polar bear hunters in his ancestry...
  Scenarios always come in sets of three:=20
  best case, worst case, and just in case.



