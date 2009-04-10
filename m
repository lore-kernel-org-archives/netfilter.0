From: =?ISO-8859-2?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: The death of policy  (WAS -> Re: [ANNOUNCE] Release of iptables-1.4.3.2)
Date: Fri, 10 Apr 2009 12:54:54 +0200
Message-ID: <49DF257E.3020702@freemail.hu>
References: <49D9E9A6.7010303@netfilter.org> <49DA0F49.4090802@conversis.de> <49DAD5E0.9020303@caf.com.tr> <49DDB24A.80400@chello.at> <49DDF84E.2010302@caf.com.tr> <49DEF36A.8010509@chello.at>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <49DEF36A.8010509@chello.at>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@vger.kernel.org

Mart Frauenlob =EDrta:
> More continuous would be IMHO:
>
> - filter table - DROP allowed and right - DROP policy =3D good
> - mangle table - DROP  prohibited - DROP policy =3D prohibited
> - nat table - DROP prohibited - DROP policy =3D prohibited
> - raw table - DROP allowed and right for avoiding conntrack - DROP=20
> policy =3D prohibited
If I follow you then I would say that we do not need any policy in=20
mangle, nat, raw table...
Just simply accept any packet..
> Again, why allow, what is considered wrong?
> If you know what you are doing, filtering in the nat table will do=20
> what you want, because you know about the special behaviour.
> Only the lack of knowledge makes things go wrong.
(nod)
> And that is the point. If you know iptables, you do your filtering in=
=20
> the filter table, or in the raw table (to avoid conntrack for some=20
> blacklist kind of stuff).
Maybe we could delete that conntrack entry if we drop a packet in the=20
filter table...

> Many of them are unexperienced. Therefor the concept should be clear,=
=20
> continuous and error messages should be understandable.
(nod)
> Preventing the user from doing nonsense. It's about the security, not=
=20
> some trivial thing...
(nod)(nod)
>
> Well, just thoughts about my favorite software... :)
>
lol

One more thing...
If there is no policy in the tables (except filter) then the ACCEPT=20
target is (MAYBE) useless in those tables...

Swifty

