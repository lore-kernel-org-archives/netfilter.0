From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 11:53:04 +0100
Message-ID: <4982DC10.6020903@plouf.fr.eu.org>
References: <4982B7F3.4020603@cetrtapot.si> <200901300949.39955.christoph.paasch@gmail.com> <4982C494.50505@cetrtapot.si>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982C494.50505@cetrtapot.si>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Hinko Kocevar a =E9crit :
> Christoph Paasch wrote:
>>
>> On Fri January 30 2009, Hinko Kocevar wrote:
>>>
>>> Is it possible to 'port forward' ICMP requests?
>>
>> You can match the protocol on ICMP packets with -p icmp and let the =
port-
>> specific stuff out of it, as ICMP doesn't uses portnumbers. But the =
problem will=20
>> be, that your external machine won't be reachable for icmp packets. =
(as every=20
>> icmp packets will get forwarded) It may be ennoying if MTU or ping p=
ackets=20
>> doesn't reach anymore your machine. That depends on the usage of you=
r gateway.
>=20
> Yes, that is what I was afraid of. I think that gateway should still =
remain
> available for ICMP echo-reply from external network.

You must not be afraid of redirecting incoming ICMP replies or error=20
messages originally destined to the gateway to the mobile device. These=
=20
messages have the state ESTABLISHED or RELATED, while NAT rules see onl=
y=20
packets creating a new "connection", which have the state NEW. Even=20
though, you could have your DNAT rule match only the echo-request type=20
with the --icmp-type option. However, if you redirect ICMP echo request=
=20
to the device, indeed you cannot ping the gateway any more on the same=20
external address. You need a separate address.
