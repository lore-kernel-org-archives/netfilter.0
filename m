From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: Redirecting DNS Not Working
Date: Sat, 16 Feb 2013 12:35:15 +0100
Message-ID: <511F6EF3.5090506@plouf.fr.eu.org>
References: <CAFURDX-tc6+LgpcUhAeOE3i2=uh=bjjVaCHTGvZbO_Ty2+zV_A@mail.gmail.com> <1360946103.2251.2.camel@andylaptop>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1360946103.2251.2.camel@andylaptop>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Andrew Beverley <andy@andybev.com>
Cc: John Corps <envoys@gmail.com>, netfilter@vger.kernel.org

Hello,

Andrew Beverley a =E9crit :
> On Fri, 2013-02-15 at 11:24 -0500, John Corps wrote:
>>
>> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p tcp -m tcp --dpor=
t
>> 53 -j REDIRECT --to-ports 53
>> iptables -t nat -A PREROUTING -s 192.168.1.0/24 -p udp -m udp --dpor=
t
>> 53 -j REDIRECT --to-ports 53
>=20
> If you want to redirect the requests to the local server, then you'll
> need to use the DNAT target instead. All you're doing in your rules i=
s
> changing to port 53 a packet that is destined to port 53 (so nothing =
at
> all).

Nonsense. You should read the manpage more carefully.

QUOTE
 REDIRECT
 This  target is only valid in the nat table, in the PREROUTING and OUT=
-
 PUT chains, and user-defined chains which are only  called  from  thos=
e
 chains.   It redirects the packet to the machine itself by changing th=
e
 destination IP  to  the  primary  address  of  the  incoming  interfac=
e
 (locally-generated packets are mapped to the 127.0.0.1 address).
END OF QUOTE
