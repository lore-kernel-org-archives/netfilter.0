From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Problem with address forwarding
Date: Mon, 03 Dec 2007 15:12:25 +0100
Message-ID: <47540EC9.6080303@plouf.fr.eu.org>
References: <20071203125238.GN4452@jnamobiled.ite.pl> <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <57523.217.166.60.19.1196689813.squirrel@ma.rtij.nl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Martijn Lievaart a =E9crit :
> <citaat van=3D"Jakub Nadolny">
>=20
>>I try to do simple address:port forwarding and I can not get it
>>working. I want to have all traffic send to
>>some.internet.address:some_port to be forwarded to 192.168.155.123:80=
=2E
>>
>>So I guess following rule should work fine:
>>iptables -t nat -A PREROUTING -p tcp -d some.internet.address --dport=
 1234
>>-j DNAT --to 192.168.155.123:80
>>
>>But when afterthat I enter some.internet.address:1234 in firefox I ca=
n
>>not see webpage which is located at 192.168.155.123. It tries to conn=
ect
>>but there is no result.
>>
>>What could be the reason of that?
>=20
> If you are doing this from the same network the webserver is on, this=
 will
> not work. The return traffic is going straight back to the client ins=
tead
> of being 'Natted-back' by the firewall.

That's when the DNAT is done on a router and the browser and the server=
=20
are on the same side of the router. The workaround is to SNAT the=20
DNAT-ed connection in the POSTROUTING chain as it is forwarded back to=20
the LAN. Take care to SNAT only connections from the local network, not=
=20
those from the internet because it hides the original source address.

If you are not doing the port forwarding on a router but on the box the=
=20
web browser is running on, the DNAT must be done in the OUTPUT chain=20
instead of PREROUTING.
