From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: how to harden iptables rules?
Date: Wed, 03 Mar 2010 18:41:30 +0100
Message-ID: <4B8E9F4A.9080706@plouf.fr.eu.org>
References: <20100303172001.149912au9jha5s8g@webmail.physik.uni-muenchen.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20100303172001.149912au9jha5s8g@webmail.physik.uni-muenchen.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hello,

Christoph Anton Mitterer a =E9crit :
>=20
> I'm playing around with hardening my iptables setups at the institue =
=20
> and I'd have some questions on this.
>=20
> First of all, the systems should have these default policies:
> #drop incoming packets by default
> :INPUT DROP [0:0]
> #drop forwarded packets by default
> :FORWARD DROP [0:0]
> #accept outgoing packets by default
> :OUTPUT ACCEPT [0:0]

ACCEPT as a default policy is not so much hardening IMHO.

> So non of them is itself a "firewall" or a router.

Huh ?

> What I always did until now was:
> #basic rules
> -A INPUT	--in-interface lo			-j ACCEPT

Agree.

> -A INPUT	-m state  --state ESTABLISHED,RELATED	-j ACCEPT

Mostly agree, although I would drop some ICMP types such as redirect or
source quench that may be harmful.

> -A INPUT	--protocol icmp				-j ACCEPT
>=20
> #rules for some services, e.g. allowing ssh, dns, etc.
>=20
> #reject all other incomming packets
> -A INPUT -j REJECT  --reject-with icmp-port-unreachable

--reject-with-tcp-reset is more appropriate for TCP packets. DROP is
more appropriate for ICMP packets.

> 2) Regarding ICMP, I must admit that I'm not that IP geek to know =20
> which of ICMP I should block. I want however have ping allowed.

Accept "-p icmp --icmp-types echo".

> if I block it completely (except echo-request) I also dont't get any =
=20
> ICMP error messages,

No, valid ICMP error messages have the ESTABLISHED state.

> net.ipv6.bindv6only =3D 1

This has not much to do with iptables and packet filtering.

> 3) What I never clearly understood: Do I have to handle (drop) =20
> "external packets" with:
> -a source address of 127.x.x.x or :1
> -a destination address of 127.x.x.x or :1
> -a source address that matches one of the addresses of my other =20
> interfaces (e.g. 88.88.88.88 if that is the address of eth0)

This is not critical, because the IP stack already discards such packet=
s.

> -what about other bogus addresses like 0.0.0.0 or 255.255.255.255 or =
so?
>=20
> Or does the kernel block such crap automatically? If so how?

This is done at the input and output routing decision, after PREROUTING
and before OUTPUT.

> And how would I block these things cleanly? Using addrtype?

Possibly. Or by specifying addresses explicitly.

> And how do =20
> I make sure that any "internal traffic" still comes through?

Your first rule (-i lo) handles it.

> 4) Should I generally drop packets with state=3DINVALID or perhaps no=
t =20
> for packets from/to lo?

Generally, yes. However you may make an exception on lo.

> 5) Is it necessary to do this or is it done automatically?
> -p tcp ! --syn -m state   --state NEW	-j DROP
> and (!) vice versa:
> -p tcp   --syn -m state ! --state NEW	-j DROP

The behaviour of TCP conntrack depends on the kernel version and some
kernel parameters (mainly net.netfilter.nf_conntrack_tcp_be_liberal).
--state NEW may not imply --syn and vice versa.

> 6) When I accept packets for dedicated services (e.g. ssh) I can do =20
> one of those:
> a) -A INPUT	--destination 88.88.88.88 --protocol tcp -m tcp =20
> --destination-port ssh --syn	-j ACCEPT
> (if 88.88.88.88 is the address of eth0)
> b) -A INPUT	--in-interface eth0 --protocol tcp -m tcp =20
> --destination-port ssh --syn	-j ACCEPT
> c)  -A INPUT	--protocol tcp -m tcp --destination-port ssh --syn	-j AC=
CEPT
>=20
> (c) Is probably a bad idea as it would allow ssh also on other interf=
aces
> But is there (from a security point of view) and advantage between (a=
) =20
> and (b)?

(b) also allow connecting on another interface because Linux enforces
the so-called "weak host model". It all depends on your needs. Do you
want to filter by interface, address, none or both ?
