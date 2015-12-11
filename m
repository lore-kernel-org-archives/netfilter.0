From: Satish Patel <satish.txt@gmail.com>
Subject: Re: block ip fragmented packet
Date: Fri, 11 Dec 2015 07:53:12 -0500
Message-ID: <ADD0C2D1-9082-4F33-AFBE-637A3778B5B8@gmail.com>
References: <CAPgF-frhssFMAxB0M=qA1Y1jCxjScO7+3JE7=i9FaXu37HCLOw@mail.gmail.com> <CAEzD07+oCs_W6P760okms=g38HEM_YuGNFx_-YodYDX328D6qA@mail.gmail.com> <566A85EE.4030502@plouf.fr.eu.org>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:in-reply-to:mime-version:content-transfer-encoding
         :content-type:message-id:cc:from:subject:date:to;
        bh=uGzMANtfHXtI1NXMWE9Og9z23X+A7NhKGhcjn9Vmidc=;
        b=Vn21ClU+TItptBKuf5fDPxpt6eBBA8eaoW8BQIAZ2bieE4Jtd/QG/oG9XYwf1ifMHj
         cX4SiqZL8JrfLYRrlYC72tPEAvmsqL2nnJZOGyUUlSgbz06Z2aMWtjDS7Va0+zSP3oqh
         Jg8JcRoozPWcqc5MUA/W54GqzEZdxaR/vO3SrHijRp+wd9VVLQfOb/Lf7Jv1UOEeJhqJ
         lbQ3uMfMpv9rrEjdfyIgcdI9UiGhaBN4Xr2N8AEUQ54DOv0dYfPmBeJ/nd6f5PvwmcQw
         WKpzEZBsiu2p0A0MIom8TQeJ+rIz6k0M1twpoq28Ap/y/DpoVOc4kGjRSrS9DUHXHKOF
         gx+A==
In-Reply-To: <566A85EE.4030502@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Pascal Hambourg <pascal@plouf.fr.eu.org>
Cc: Anton Danilov <littlesmilingcloud@gmail.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

I'm testing this rule from remote machine and sending fragmented packet=
 using hping3 utility.=20

-f  iptables option is not going to work if conntrack there.=20

I don't know why it's so hard for iptable to block something like this.=
=20

If I use tc filter then it works. But I wanted to block using iptables.=
=20

--
Sent from my iPhone

> On Dec 11, 2015, at 3:14 AM, Pascal Hambourg <pascal@plouf.fr.eu.org>=
 wrote:
>=20
> Anton Danilov a =C3=A9crit :
>> Hello.
>> Local originated packets aren't passed through raw/PREROUTING chain
>> To test your rule you should use raw/OUTPUT chain.
>=20
> It may not work either, because packets are not fragmented yet in the
> OUTPUT chain at least when conntrack is active (not sure when it isn'=
t).
