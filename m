From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Sat, 14 Sep 2013 08:40:19 -0700
Message-ID: <52348363.6080804@rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <5232B01B.2030007@atc.tcs.com> <5234678F.6010401@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <5234678F.6010401@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org

On 09/14/2013 06:41 AM, Pascal Hambourg wrote:
> Vigneswaran R a =C3=A9crit :
>> Hello Nikolaus,
>>
>> I have a doubt. It seems, rath of ebox is assigned with IP address i=
n=20
>> the range 192.168.12.0/24. However, IP address of vostro seems to be=
=20
>> 192.168.17.47 (assuming /24). Ebox doesn't have any route to this ra=
nge.=20
>> So it try to use default route via eth0.
>=20
> Correct.
>=20
>> What I assume is, 'vostro' has IP addresses in (atleast) two ranges=20
>> (192.168.12.0/24, 192.168.17.0/24). In the default routing table, th=
e=20
>> src IP is set to 192.168.12.x (for the packets originating from vost=
ro).=20
>> However, the 'tovpn' table didn't specify the src IP. So, when the=20
>> 'tovpn' table is being used, the packets may have got the src IP as=20
>> 192.168.17.x.
>>
>> I think, you can avoid this by explicitly specifying the src IP when=
=20
>> adding the route to 'tovpn' table,
>>
>>      ip route add default via 192.168.12.1 src 192.168.12.x table to=
vpn
>=20
> This won't work. It's too late. The source address has already been
> selected by the TCP layer when the packet was created and won't be
> changed when the packet is re-routed due to the mark.

I see. Out of curiosity: how is the source address selected when the
packet is created, and in which situation would the source entry in the
routing table become effective?

> Possible workarounds :
> - Add a route on ebox to let it know that 192.168.17.47 is reachable
> through rath. My favourite choice.

Yes, that would be the simplest solution. But the problem is that this
address varies depending how and where vostro got its connectivity. Or
did you mean something other than a static extra route?

> - Use SNAT to the address of the output interface on vostro.

Sounds ugly...

> - Use connection mark (connmark) by iptables on ebox so that replies =
to
> original packets received on a given interface are forwarded to the s=
ame
> interface.

I guess I'll try this. Could you give some more details? I'm not sure
how to create a rule that *changes* the outgoing interface.



Best,

   -Nikolaus

--=20
 =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB

  PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C
