From: "tian fang" <tianfang@gmail.com>
Subject: RE: Fwd: ipset and counters
Date: Mon, 6 May 2013 22:46:23 +0800
Message-ID: <003a01ce4a68$7ccb5e40$76621ac0$@com>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu> <loom.20130506T151314-549@post.gmane.org> <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language;
        bh=sOzxHIA1223yqTE3SLPlNaYf6C4a7cQDQbLwz9gsrs4=;
        b=Gp7DqBgp9r9bnJFvHghgbPwY7TkY+rX8H0qnC/vr2H7T/xmAEa8DLa00uIeJmxeEYj
         vEqxY8TwjuOlZu8gCxwtExCaOHBEXrx776/HuigbwLnL9MFSrzgExZV1zE0vWZvM+4/L
         RsVRdBr3kPPoeLcetvLwaeG57YAOJcKotGxsRTv6gLmv/1Mf+Q3dgZxEL293/827FcO3
         1RPWRJKRyiQ+DZOaYZz6aaQtzzZLEPWN2Ok2og7HqJQHxIJAw2hpwjzQAB+6IEKYfxZP
         ySbK9culZERBq80L9qNy4XqOfTZIuncpTKoR4R+uaXSbVc9wv4ct13z8Sy/jhrHaxOZe
         UPxQ==
In-Reply-To: <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu>
Content-Language: zh-cn
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: 'Jozsef Kadlecsik' <kadlec@blackhole.kfki.hu>
Cc: netfilter@vger.kernel.org



-----Original Message-----
=46rom: Jozsef Kadlecsik [mailto:kadlec@blackhole.kfki.hu]=20
Sent: 2013=C4=EA5=D4=C26=C8=D5 21:41
To: tian fang
Cc: netfilter@vger.kernel.org
Subject: Re: Fwd: ipset and counters

On Mon, 6 May 2013, tian fang wrote:

> Jozsef Kadlecsik <kadlec <at> blackhole.kfki.hu> writes:
>=20
> > > create SETNAME bitmap:ip range IP/CIDR|FROM-TO
> > >                [netmask CIDR] [timeout VALUE] [counters]
> >=20
> > So the ipset binary does support counters. Then what is the output=20
> > of "modinfo ip_set_bitmap_ip"? Also, if you had the previous ipset=20
> > kernel modules loaded in, then just installing them won't unload th=
em.
>
>     I successfully built and executed ipset 6.19 ,but when I try to=20
> run this command, I failed.
>=20
> iptables -t nat -A POSTROUTING -m set --match-set ipc src,dst -j=20
> MASQUERADE
> iptables: No chain/target/match by that name.
>=20
> could you please help me on this ?

[There's no ipset 6.19 yet.]

Did you install the kernel modules from the ipset package?

Best regards,
Jozsef
-

Jozsef
I succeeded after I sudo cp xt_set.ko
/lib/modules/3.5.0-28-generic/kernel/net/netfilter/ .=20
Thanks for your help.
But I am just alittlebit curious why can't I do it by make install.

Best regards=20
tian
=20


E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.mta.hu PGP =
key :
http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics, Hungarian Academy of Scie=
nces
          H-1525 Budapest 114, POB. 49, Hungary

