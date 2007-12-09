From: =?ISO-8859-1?Q?Leonardo_Rodrigues_Magalh=E3es?= 
	<leolistas@solutti.com.br>
Subject: Re: how to do a MAC-based filtering for NAT
Date: Sun, 09 Dec 2007 19:33:04 -0200
Message-ID: <475C5F10.6010601@solutti.com.br>
References: <9a9df61d0712082111s90a5fa3o4d272b2c1dacc1f1@mail.gmail.com>	 <475BD20F.6030206@solutti.com.br> <9a9df61d0712090618ha74fa7dte9b89c8d8177408f@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <9a9df61d0712090618ha74fa7dte9b89c8d8177408f@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: "netfilter@vger.kernel.org >> netfilter ML" <netfilter@vger.kernel.org>



Deephay escreveu:
> On Dec 9, 2007 7:31 PM, Leonardo Rodrigues Magalh=E3es
> <leolistas@solutti.com.br> wrote:
>  =20
>>     Yes it works if you have the correct rules.
>>
>>     Are these 2 FORWARD rules your only rules ????? If no, please po=
st
>> your full ruleset.
>>
>>     If yes ..... i can clearly see 2 problems.
>>
>>     You have not told us about your scenario, but i'll suppose you h=
ave
>> the simple scenario of a linux box with 2 NICs, forwarding packets
>> between NICs. The --mac-source rule you made WILL work. But you're
>> clearly missing some rule that allow packets to came back, the repli=
es.
>> You're allowing the packet to go out, but not allowing replies to ge=
t
>> back. So, 'it will not work'. Based on your scenario, you certainly =
need
>> some rules to allow the return traffic.
>>
>>     And if these are your only 2 rules, then you're simply forwardin=
g,
>> there's no NAT rule here. Packets will be forwarded but the original=
 ip
>> address will be kept, that means, no Network Address Translation (NA=
T)
>> will occur. You would need some '-t nat -A POSTROUTING' rule for doi=
ng
>> the Source NAT.
>>    =20
>
> Hi, I am using one NIC with PPPoE and
>
>  =20
    OK ... the tipical 2 interfaces situation. One real NIC interface=20
and other logical PPPoE interface. Probably eth0 and ppp0, is that righ=
t ???

> iptables -t nat -A POSTROUTING -j MASQUERADE
>
> as the NAT rules.
>
>  =20
    OK ... so you have the NAT rule.

> Is there a solution in this kind of situation? thanks for the help!
>  =20
    Yes .... supposing eth0 is your internal NIC and ppp0 is your=20
external interface, simply having a rule

iptables -A FORWARD -i ppp0 -o eth0 -j ACCEPT

    would be enough for allowing all the 'reply' packets to came back=20
and thus allowing your traffic base on MAC source to work.

    Please try that.


--=20


	Atenciosamente / Sincerily,
	Leonardo Rodrigues
	Solutti Tecnologia
	http://www.solutti.com.br

	Minha armadilha de SPAM, N=C3O mandem email
	gertrudes@solutti.com.br
	My SPAMTRAP, do not email it




