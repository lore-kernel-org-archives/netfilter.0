From: Payam Chychi <pchychi@gmail.com>
Subject: Re: VoIP conntrack issue
Date: Wed, 14 Nov 2012 16:40:22 -0800
Message-ID: <2D55CDB0-870A-49CD-BD0D-C99935380A25@gmail.com>
References: <CABY2qi8n0ttC99_UktcT+Jwnd9WCCsvk5+ug1GXrrYbd9ixxWw@mail.gmail.com> <alpine.LNX.2.01.1211150035180.32273@nerf07.vanv.qr> <CABY2qi9AnCJDXUFxo_ocUwU0dCmUEJ4W8aMQUbVBmRcS_=5EzA@mail.gmail.com>
Mime-Version: 1.0 (1.0)
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=references:mime-version:in-reply-to:content-type
         :content-transfer-encoding:message-id:cc:x-mailer:from:subject:date
         :to;
        bh=zQZlgFlQfa68xhBxqsIE+19pwO9Lvk6FG3Io/+rPx8g=;
        b=R83ythR/m6sgdMg9bwZD/EqK6q2frUihOZa2wm7/hOC+7oVGtTN0Fe6XO+cFzMug27
         5cQUiMfLRcngWoWDmn3LNIhO+aY22TNnQfwyltXBE1bYOBxY0Ezsz8vufOQWY239n8aO
         jjjc3xIXZxLLl5WazuhxXWTHtpm1o7xoEHkzK+pOlyaGC/6ri9wYBT9LE22jyOvNzdvc
         1bOT4womM+PaSiF0hmNgTWv2b6U4AVsBYMnkDDKQIDSzNqBUTswtzFhVB/8y9tlpFSHK
         /NzafLASYfRouMDz7sTALsyQf8Ou2f12c0R+wQS+9A8u64bF58icsl2Cll01Ocd8Udza
         7xUA==
In-Reply-To: <CABY2qi9AnCJDXUFxo_ocUwU0dCmUEJ4W8aMQUbVBmRcS_=5EzA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: =?utf-8?Q?J=C3=B6rn_Krebs?= <jk@smartbyte.de>
Cc: netfilter <netfilter@vger.kernel.org>

policy based routing + nat ...?


Sent from my iPhone

On 2012-11-14, at 4:15 PM, J=C3=B6rn Krebs <jk@smartbyte.de> wrote:

> Hi,
>=20
> I think you don't get the point. I have many devices that are
> connecting to the same servers(n:m connections),
> so I cannot put any simple rule in there. Esp. because the GMX Server
> which is the second one that connects and is changing port and IP
> address all the time,
> my internal phone is changing the port, and might even change it's IP=
,
> so I cannot define a rule based on that.
> (I have mentioned that in my first post: It is working, but not when =
I
> like to use direct rtp, which for some reason is possible in every
> other network I am working in (mostly Cisco routers), but not in my
> own one, and because linux should be / is highly configurable I
> though, that this feature just has to be enabled somehow (with featur=
e
> I mean a real symmetric NAT))
>=20
> So I don't want to do "hard" changes that would one work in one situa=
tion.
>=20
> Yes I always have nf_nat_sip compiled in my kernel. It might have
> helped, but in this specific case (which isn't specific in VoIP at
> all, it's basically a standard case in that world), it doesn't seem t=
o
> work.
>=20
> I WANT A SYMMETRIC NAT!!!! -> Why doesn't anybody understand that?
> I mean I am on the netfilter list. Everyone here should know what I
> mean with the term symmetric NAT, so what is the problem?
> I more and more got the impression, that you are developing in your
> own little world, and not the world where we have different types of
> NAT.
> Most of them can be covered with netfilter/conntrack, but some cannot
> and I don't think it can be very hard to implement a symmetric NAT,
> can it?
>=20
> Please advise me on how to implement a symmetric NAT with iptables.
>=20
> What does the random flag for example on iptables do?
>=20
> What is the difference between MASQUERADE and SNAT?
> Is there any option I can give to the conntrack modules that might
> change anything?
>=20
> Thanks, Joern.
>=20
> On Thu, Nov 15, 2012 at 10:38 AM, Jan Engelhardt <jengelh@inai.de> wr=
ote:
>>=20
>> On Wednesday 2012-11-14 23:41, J=C3=B6rn Krebs wrote:
>>>=20
>>> The problem I have with case 1 is that Linux is assigning a new ext=
ernal port.
>>> So and my router Case 1 looks more like this:
>>> A:5000 <-> router:5000 <-> C
>>> A:5000 <-> router:1030 <-> D
>>> Which causes a big issue with my VoIP setup!
>>> (VoIP is negotiating the ports inside the SIP protocol. They are no=
t
>>> detected and they are fixed and not detected on the fly)
>>=20
>> Are you sure you have tried loading nf_nat_sip, like I mentioned
>> in the thread[1] on netfilter@ ? Or the extra DNAT rule?
>>=20
>> [1] http://marc.info/?l=3Dnetfilter&m=3D135289221821117&w=3D2
>>=20
>>> (Hope I made my case clear)
>>=20
>> (The conntrack -E dump made a lot more sense to me.)
>> --
>> To unsubscribe from this list: send the line "unsubscribe netfilter-=
devel" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>=20
>=20
>=20
> --=20
> Bye Bye, J=C3=B6rn Krebs
> --------------------------------------------
> 64 Queen St., Blackstone 4304
> Phone: +61731363381
> Mobile: +61431068955
> Telefon: +495516345347
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" =
in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
