From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 10:19:23 +0100
Message-ID: <4982C61B.6030008@cetrtapot.si>
References: <4982B7F3.4020603@cetrtapot.si> <4982BB4D.5020708@unipex.it>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982BB4D.5020708@unipex.it>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Michele Petrazzo - Unipex srl <michele.petrazzo@unipex.it>
Cc: netfilter@vger.kernel.org

Michele Petrazzo - Unipex srl wrote:
> Hinko Kocevar wrote:
>> Hi all,
>>
>> I'm an absolute beginner on the netfilter stuff, so please bear with
>> me here.
>>
>> We have a device running linux 2.6.19 kernel with iptables installed=
=2E
>> It acts
>> a a gateway for a another mobile device that connects to linux devic=
e
>> via irda
>> port - ppp connection. I've managed to port forward telnet port to
>> mobile device
>> with the help of this page
>> http://kreiger.linuxgods.com/kiki/?Port+forwarding+with+netfilter.
>> Our customers want to be able to ping the mobile device behind the
>> linux firewall
>> and IMHO it is not possible for ICMP packets to be forwarded since i=
t
>> is a protocol
>> by itself (not a TCP/UDP style service).
>>
>>
>> Is it possible to 'port forward' ICMP requests?
>>
>=20
> Sure? Looking at firsts google reply, you can find
>=20
> iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
> iptables -t nat -A PREROUTING -i eth0 -p icmp DNAT --to-destination
> 10.2.1.1
>=20

That seems to work goo, but now the gateway can not reply to ICMP packe=
ts...

> end so on...
>=20
> Or I miss something?

I was expecting a solution where gateway would still see the ICMP reque=
sts, too.

I guess I'll use a telnet service on the mobile device in order to chec=
k if it is
alive and NAT the port on gateway to high port number eg. 2323 -> mobil=
e device
23.

Best regards,
Hinko

--=20
Hinko Ko=C4=8Devar, OSS developer
=C4=8CETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si

