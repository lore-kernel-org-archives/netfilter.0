From: Mart Frauenlob <mart.frauenlob@chello.at>
Subject: Re: icmp forward
Date: Fri, 30 Jan 2009 12:36:59 +0100
Message-ID: <4982E65B.10509@chello.at>
References: <4982B7F3.4020603@cetrtapot.si> <200901300949.39955.christoph.paasch@gmail.com> <4982C494.50505@cetrtapot.si> <4982DC10.6020903@plouf.fr.eu.org> <4982E363.6070005@cetrtapot.si>
Reply-To: netfilter@vger.kernel.org
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4982E363.6070005@cetrtapot.si>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Hinko Kocevar wrote:
> Pascal Hambourg wrote:
>  =20
>> Hello,
>>
>> Hinko Kocevar a =C3=A9crit :
>>    =20
>>> Christoph Paasch wrote:
>>>      =20
>>>> On Fri January 30 2009, Hinko Kocevar wrote:
>>>>        =20
>>>>> Is it possible to 'port forward' ICMP requests?
>>>>>          =20
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
>>>>        =20
>>> Yes, that is what I was afraid of. I think that gateway should stil=
l
>>> remain
>>> available for ICMP echo-reply from external network.
>>>      =20
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
>>    =20
>
> Not quite sure what it is all about, but is it doing something like:
> # ifconfig eth0:1 172.31.64.121 netmask 255.255.254.0 up
>
> And later..
> # iptables -A FORWARD -p icmp --icmp-type echo-request -j ACCEPT
> # iptables -t nat -A PREROUTING -i eth0 -p icmp -j DNAT --to-destinat=
ion 10.1.1.2
>
>  =20
try:

iptables -t nat -A PREROUTING -i eth0 -d 172.31.64.121 -p icmp -j DNAT =
--to-destination 10.1.1.2


> This is not what I expected - shouldn't the request destined for eth0=
:1 be
> answered by the gateway device?
>  =20

