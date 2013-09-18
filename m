From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Tue, 17 Sep 2013 17:55:51 -0700
Message-ID: <87k3ifymlk.fsf@vostro.rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il>
	<87li2w9scf.fsf@vostro.rath.org>
	<43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk>
	<5238E484.80802@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Pascal Hambourg <pascal@plouf.fr.eu.org> writes:
> Alex Bligh a =C3=A9crit :
>>=20
>> I don't think you need iptables. The way I've always done it is:
>> * Default route to the VPN device
>> * /32 route for the VPN endpoint out the physical interface to
>>   the previous default route
>
> This does not meet the following OP's requirement :
>
>>> The hard part is to also tunnel non-VPN connections to the VPN node
>>> itself. In other words how do I make sure that every connection to =
the
>>> external ip of the VPN node is tunneled through its internal ip --
>>> except for the packets that form the tunnel itself?
>
> However I am not sure this is a sensible requirement.

Why not? For example, the VPN node also acts as my mailserver. So
whenever I encounter firewalls that e.g. block everything but port 443
and 80, I have to establish a tunnel to be able to connect to port 25,
and then change the mail server name in my MUA to the internal name on
the VPN. Then, if I'm at a different location where I do not need the
VPN, I have to change it back to the public hostname.

That is rather annoying, and I could avoid it if I somehow get
the smtp connections to use the VPN gateway as well.

Admittedly, I could just run the VPN all the time, but I don't think
this makes the whole idea unsensible.

>>> My idea was install a default route to the internal ip of the VPN n=
ode,
>>> use iptables to mark the VPN connections and then set up a special
>>> routing table for those.
>
> Sounds good. Make sure that packets related to the VPN connection (e.=
g.
> ICMP error messages) are routed outside the tunnel too. I guess that =
can
> be done with connmark (connection mark).

Well, that was the idea that led to my original question. It doesn't
work, because the packets go out with the wrong source ip
address. Apparently, at the time that the source ip address is
determined, the connection hasn't been marked yet, so it takes the
source ip from the wrong routing table.


Best,

   -Nikolaus

--=20
 =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB

  PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C

