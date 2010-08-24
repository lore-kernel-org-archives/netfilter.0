From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridges
Date: Tue, 24 Aug 2010 20:07:34 +0200
Message-ID: <4C740A66.9000400@plouf.fr.eu.org>
References: <4C6B10CA.4090604@abpni.co.uk> <4C6C5B87.9070906@abpni.co.uk> <alpine.LSU.2.01.1008190025100.29243@obet.zrqbmnf.qr> <4C6C63EF.7060305@abpni.co.uk> <4C6C6731.50401@plouf.fr.eu.org> <4C6C67A6.9010405@abpni.co.uk> <4C6C6AED.3090008@plouf.fr.eu.org> <4C6C70B6.7050200@abpni.co.uk> <4C6CDC91.6060804@plouf.fr.eu.org> <4C6D7C42.9060409@abpni.co.uk> <4C6D857B.1070906@plouf.fr.eu.org> <4C6D87E3.9080207@abpni.co.uk> <4C6D9E9F.3080507@plouf.fr.eu.org> <4C6DA0F1.80909@abpni.co.uk> <4C6DAA53.70702@plouf.fr.eu.org> <4C6DB5FD.8030607@abpni.co.uk> <4C6E42A6.9080308@plouf.fr.eu.org> <4C704924.3080909@abpni.co.uk> <alpine.LSU.2.01.1008220122410.30882@obet.zrqbmnf.qr> <4C70E853.6050107@abpni.co   .uk> <alpine.LSU.2.01.1008221108160.26133@obet.zrqbmnf.qr> <4C70E 9A2.3040907@abpni.co.uk> <4C719073.7
 090506@plouf.fr.eu.org> <4C7194D3.7070803@abpni.co.uk> <4C722FAF.5030203@plouf.fr.eu.org> <4C72D7AA.1090206@abpni.co.uk> <4C73DABD.7080007@plouf.fr.eu.org> <4C740347.3010508@abpni.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C740347.3010508@abpni.co.uk>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Jonathan Tripathy <jonnyt@abpni.co.uk>
Cc: netfilter@vger.kernel.org

Jonathan Tripathy a =E9crit :
> On 24/08/10 15:44, Pascal Hambourg wrote:
>>
>> Jan's diagram pointed to by Karel Rericha explains paths in the IP l=
ayer
>> and the link layer. However bridge-netfilter (the capability to send
>> bridged packets through {ip,arp,ipv6}tables chains whereas they are =
not
>> processed by the IP stack) makes things a bit more complicated.
>=20
> I think what I am getting confused with is how am I able to use the=20
> FORWARD chain in iptables with my bridge setup, even though forwardin=
g=20
> is disabled?

Because of netfilter-bridge which allows to pass bridged packets throug=
h
iptables chains. See the "link layer" part of the diagram, where
bridging takes place. This behaviour can be controlled by sysctls in
/proc/sys/net/bridge/ (see Documentation/networking/ip-sysctl.txt).
