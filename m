From: Nikolaus Rath <Nikolaus@rath.org>
Subject: Re: Wrong routing when combining ip rule with SNAT
Date: Wed, 18 Sep 2013 10:38:32 -0700
Message-ID: <87txhic9nr.fsf@rath.org>
References: <8761u59uit.fsf@vostro.rath.org> <52379693.80707@ngtech.co.il>
	<87li2w9scf.fsf@vostro.rath.org>
	<43783AC5-55D5-4AAE-A629-6B2C99AAC8E4@alex.org.uk>
	<5238E484.80802@plouf.fr.eu.org> <87k3ifymlk.fsf@vostro.rath.org>
	<1BE5F0A9-E67C-4870-AC63-F30FAAFEB227@alex.org.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Alex Bligh <alex@alex.org.uk> writes:
> On 18 Sep 2013, at 01:55, Nikolaus Rath wrote:
>
>> Why not? For example, the VPN node also acts as my mailserver. So
>> whenever I encounter firewalls that e.g. block everything but port 4=
43
>> and 80, I have to establish a tunnel to be able to connect to port 2=
5,
>> and then change the mail server name in my MUA to the internal name =
on
>> the VPN. Then, if I'm at a different location where I do not need th=
e
>> VPN, I have to change it back to the public hostname.
>>=20
>> That is rather annoying, and I could avoid it if I somehow get
>> the smtp connections to use the VPN gateway as well.
>
> One possibility would be to add another interface, so you are using
> separate destination IP addresses for the end of the VPN tunnel
> and 'everything else'. Remember the 'everything else' IP address
> does not need to be public, as you'll only be reaching it by
> the VPN tunnel.

Hmm. I don't get it. Could you explain in more detail?

> Another is to use policy routing and only direct the VPN traffic
> down the /32 route. This is pretty much what you were suggesting
> re the marking etc. However, I would caution that this will mean
> (e.g.) ICMP goes the 'wrong' way for at least one session. This
> will make debugging hard, may affect pMTU discovery etc. etc.,
> all of which will be bad news for reliable connections.

I think I could live with the debugging problems, but at the moment it
is not working at all because of the source ip issues (see my very firs=
t
mail that started this thread).


Best,
Nikolaus



--=20
Encrypted emails preferred.
PGP fingerprint: 5B93 61F8 4EA2 E279 ABF6  02CF A9AD B7F8 AE4E 425C

             =C2=BBTime flies like an arrow, fruit flies like a Banana.=
=C2=AB

