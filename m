From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: rule is ignored for the localhost
Date: Tue, 17 Jun 2008 16:03:47 +0200
Message-ID: <4857C443.8080502@plouf.fr.eu.org>
References: <86ff9a9a0806161241r65b5a734o2b0ebc8e2ef0c4fe@mail.gmail.com> <4856D1DB.9050107@riverviewtech.net>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4856D1DB.9050107@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

Hello,

Grant Taylor a =E9crit :
> On 06/16/08 14:41, Artem Y. Pervin wrote:
>=20
>> I want to do a simple thing. I want some port of the external=20
>> interface to redirect TCP traffic to the private network.
>> So, I have the following rule sequence:
>>=20
>> # Port forwarding
>> iptables -t nat -I PREROUTING -i $EXTIF -p tcp --dport 30099 -j DNAT
>> --to 192.168.10.119:22
>> iptables -t nat -I PREROUTING -i lo -p tcp --dport 30099 -j DNAT --t=
o
>> 192.168.10.119:22
>=20
> At a quick glance your rules seem to be ok.

I beg to differ. AFAIK packets routed through the loopback interface=20
don't go through the nat/PREROUTING chain, so the latter rule will neve=
r=20
match any packet. My understanding is that only packets creating a new=20
yet unconfirmed connection go through the nat chains, and the connectio=
n=20
is confirmed right after the POSTROUTING chains, before the packet is=20
looped back into the PREROUTING chains. I have the feeling that=20
conntrack and NAT on loopback is somehow dodgy.

So the rule must be added to the OUTPUT chain :

iptables -t nat -I OUTPUT -o lo -p tcp --dport 30099 -j DNAT --to=20
192.168.10.119:22
