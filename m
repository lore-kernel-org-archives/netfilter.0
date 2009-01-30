From: Hinko Kocevar <hinko.kocevar@cetrtapot.si>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 12:35:03 +0100
Message-ID: <4982E5E7.1060803@cetrtapot.si>
References: <4982B7F3.4020603@cetrtapot.si> <200901300949.39955.christoph.paasch@gmail.com> <4982C494.50505@cetrtapot.si> <4982DC10.6020903@plouf.fr.eu.org> <4982E363.6070005@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982E363.6070005@cetrtapot.si>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

Hinko Kocevar wrote:
> Pascal Hambourg wrote:
>> Hello,
>>
>> Hinko Kocevar a =C3=A9crit :
>>> Christoph Paasch wrote:
>>>> On Fri January 30 2009, Hinko Kocevar wrote:
>>>>> Is it possible to 'port forward' ICMP requests?
>>>> You can match the protocol on ICMP packets with -p icmp and let th=
e
>>>> port-
>>>> specific stuff out of it, as ICMP doesn't uses portnumbers. But th=
e
>>>> problem will be, that your external machine won't be reachable for
>>>> icmp packets. (as every icmp packets will get forwarded) It may be
>>>> ennoying if MTU or ping packets doesn't reach anymore your machine=
=2E
>>>> That depends on the usage of your gateway.
>>> Yes, that is what I was afraid of. I think that gateway should stil=
l
>>> remain
>>> available for ICMP echo-reply from external network.
>> You must not be afraid of redirecting incoming ICMP replies or error
>> messages originally destined to the gateway to the mobile device. Th=
ese
>> messages have the state ESTABLISHED or RELATED, while NAT rules see =
only
>> packets creating a new "connection", which have the state NEW. Even
>> though, you could have your DNAT rule match only the echo-request ty=
pe
>> with the --icmp-type option. However, if you redirect ICMP echo requ=
est
>> to the device, indeed you cannot ping the gateway any more on the sa=
me
>> external address. You need a separate address.
>=20
> Not quite sure what it is all about, but is it doing something like:
> # ifconfig eth0:1 172.31.64.121 netmask 255.255.254.0 up
>=20
> And later..
> # iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
> # iptables -t nat -A PREROUTING -i eth0 -p icmp -j DNAT --to-destinat=
ion 10.1.1.2
>=20

My bad, should be:
iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
iptables -t nat -A PREROUTING -d 172.31.64.121 -p icmp -j DNAT --to-des=
tination 10.1.1.2

And then pinging both IPs from a local area network host produces desir=
ed result:

Gateway:
=2E.......
64 bytes from 172.31.64.121: icmp_seq=3D233 ttl=3D64 time=3D1.14 ms
64 bytes from 172.31.64.121: icmp_seq=3D234 ttl=3D64 time=3D1.03 ms
64 bytes from 172.31.64.121: icmp_seq=3D235 ttl=3D64 time=3D1.03 ms
64 bytes from 172.31.64.121: icmp_seq=3D236 ttl=3D64 time=3D1.37 ms
64 bytes from 172.31.64.121: icmp_seq=3D237 ttl=3D64 time=3D1.05 ms
64 bytes from 172.31.64.121: icmp_seq=3D238 ttl=3D64 time=3D1.50 ms
64 bytes from 172.31.64.121: icmp_seq=3D239 ttl=3D64 time=3D1.05 ms
64 bytes from 172.31.64.121: icmp_seq=3D240 ttl=3D64 time=3D1.04 ms

Mobile device:
=2E.............
64 bytes from 172.31.64.126: icmp_seq=3D236 ttl=3D127 time=3D72.0 ms
64 bytes from 172.31.64.126: icmp_seq=3D237 ttl=3D127 time=3D31.0 ms
64 bytes from 172.31.64.126: icmp_seq=3D238 ttl=3D127 time=3D51.7 ms
64 bytes from 172.31.64.126: icmp_seq=3D239 ttl=3D127 time=3D63.8 ms
64 bytes from 172.31.64.126: icmp_seq=3D240 ttl=3D127 time=3D75.2 ms

Thanks to everyone who helped!

Best regards,
Hinko

--=20
Hinko Ko=C4=8Devar, OSS developer
=C4=8CETRTA POT, d.o.o.
Planina 3, 4000 Kranj, SI EU
tel     ++386 (0) 4 280 66 03
e-mail  hinko.kocevar@cetrtapot.si
http    www.cetrtapot.si

