From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Wed, 18 Sep 2013 19:29:46 -0700
Message-ID: <87eh8lk0h1.fsf@vostro.rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il>
	<87li2w9scf.fsf@vostro.rath.org>
	<43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk>
	<5238E484.80802@plouf.fr.eu.org> <87k3ifymlk.fsf@vostro.rath.org>
	<1BE5F0A9-E67C-4870-AC63-F30FAAFEB227@alex.org.uk>
	<87txhic9nr.fsf@rath.org>
	<E91E34E7-300C-42D0-A80E-53D62E6991DF@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Alex Bligh <alex@alex.org.uk> writes:
> On 18 Sep 2013, at 18:38, Nikolaus Rath wrote:
>
>>>> Why not? For example, the VPN node also acts as my mailserver. So
>>>> whenever I encounter firewalls that e.g. block everything but port=
 443
>>>> and 80, I have to establish a tunnel to be able to connect to port=
 25,
>>>> and then change the mail server name in my MUA to the internal nam=
e on
>>>> the VPN. Then, if I'm at a different location where I do not need =
the
>>>> VPN, I have to change it back to the public hostname.
>>>>=20
>>>> That is rather annoying, and I could avoid it if I somehow get
>>>> the smtp connections to use the VPN gateway as well.
>>>=20
>>> One possibility would be to add another interface, so you are using
>>> separate destination IP addresses for the end of the VPN tunnel
>>> and 'everything else'. Remember the 'everything else' IP address
>>> does not need to be public, as you'll only be reaching it by
>>> the VPN tunnel.
>>=20
>> Hmm. I don't get it. Could you explain in more detail?
>
> Assume your tunnel endpoint is 192.200.0.1 - i.e. a public IP.
> Your challenge is that you want the packets constituting the
> tunnel itself to go out one interface (direct to 192.200.0.1
> over the internet). But you want your packets to 192.200.0.1:25
> to go over the VPN. Correct?

Correct.

> So, assume you are not using 10.100.100.0/24. Add an interface
> (I believe a loopback interface will do) with IP
> address 10.100.100.1/24 on your VPN endpoint box. Ensure SMTP
> etc. is listening on that interface too.
>
> On your vpn client, do not use 192.200.0.1:25 (which by your own
> admission will only work if you connect over the VPN). Rather
> use 10.100.100.1:25. Use a default route over the VPN, but
> route 192.200.0.1/32 to the nexthop the previous (native) default,
> i.e. to the upstream router.

Well, but the 10.100.100.1 address is also only going to work when the
VPN is up. So it wouldn't be enough to change the routing table, I'd
have to either activate the VPN permanently or change the mailserver ip
every time I (de-)activate the VPN.

Yes, it can be done. But I'm curious if there really isn't any solution
that would avoid that.

Best,

   -Nikolaus

--=20
 =C2=BBTime flies like an arrow, fruit flies like a Banana.=C2=AB

  PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C

