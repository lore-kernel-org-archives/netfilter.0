From: Jonathan Tripathy <jonnyt@abpni.co.uk>
Subject: Re: Bridges
Date: Tue, 24 Aug 2010 19:34:03 +0100
Message-ID: <4C74109B.9070704@abpni.co.uk>
References: <4C6B10CA.4090604@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org> <4C704924.3080909@abpni.co.uk> <alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr> <4C70E853.6050107@abpni.co   .uk> <alpine.LSU.2.01.1008221108160.26133@obet.zrqbmnf.qr> <4C70E 9A2.3040907@abpni.co.uk> <4C719073.7090506@plouf.fr.eu.org> <4C7194
 D3.7070803@abpni.co.uk> <4C722FAF.5030203@plouf.fr.eu.org> <4C72D7AA.1090206@abpni.co.uk> <4C73DABD.7080007@plouf.fr.eu.org> <4C740347.3010508@abpni.co.uk> <4C740A66.9000400@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C740A66.9000400@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>, netfilter@vger.kernel.org


On 24/08/10 19:07, Pascal Hambourg wrote:
> Jonathan Tripathy a =E9crit :
>   =20
>> On 24/08/10 15:44, Pascal Hambourg wrote:
>>     =20
>>> Jan's diagram pointed to by Karel Rericha explains paths in the IP =
layer
>>> and the link layer. However bridge-netfilter (the capability to sen=
d
>>> bridged packets through {ip,arp,ipv6}tables chains whereas they are=
 not
>>> processed by the IP stack) makes things a bit more complicated.
>>>       =20
>> I think what I am getting confused with is how am I able to use the
>> FORWARD chain in iptables with my bridge setup, even though forwardi=
ng
>> is disabled?
>>     =20
> Because of netfilter-bridge which allows to pass bridged packets thro=
ugh
> iptables chains. See the "link layer" part of the diagram, where
> bridging takes place. This behaviour can be controlled by sysctls in
> /proc/sys/net/bridge/ (see Documentation/networking/ip-sysctl.txt).
>   =20
Ah I see. Just some special magic in netfilter-bridge.

So bottom line: no non-bridged IP traffic can get into the FORWARD chai=
n=20
without IP forwarding being enabled? And also, bridged traffic can not=20
cross bridges unless forwarding is enabled (hence Linux is being used a=
s=20
a router itself), or there is a router of some sort in the middle?

Cheers
