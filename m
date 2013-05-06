From: "tian fang" <tianfang@gmail.com>
Subject: RE: Fwd: ipset and counters
Date: Mon, 6 May 2013 22:03:06 +0800
Message-ID: <003901ce4a62$71136530$533a2f90$@com>
References: <51752B00.8090908@metu.edu.tr> <51753143.8090908@metu.edu.tr> <alpine.DEB.2.00.1304221554230.16792@blackhole.kfki.hu> <5175432F.2060304@metu.edu.tr> <alpine.DEB.2.00.1304221921001.19576@blackhole.kfki.hu> <loom.20130506T151314-549@post.gmane.org> <alpine.DEB.2.00.1305061535250.12392@blackhole.kfki.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=x-received:from:to:cc:references:in-reply-to:subject:date
         :message-id:mime-version:content-type:content-transfer-encoding
         :x-mailer:thread-index:content-language;
        bh=e1EFLYRCY5J5DDYHORkQ7WA5IJbkx2FzcDo78CWMCz4=;
        b=KIvhijz2R3F+I5qEtHi/0WvDMu+uk9eA6hjwj4SsQ16/T510/v67+EziMBub4gdUja
         TAy5JD6Dpo1IpeE2PA06nhMb2f8AeUH77rReAuIEbWo+Oi1hCsL47F3ev52g2ciNj9ay
         qjSZYifw36IsZ6Vyzx9aRX3r5NarBxDalpGICnADL85MLsCPGnJMriT0rd6o0dUtsi/A
         J+gi84Qj69JwwyK2hTjaEEzIwgl0n7+h6jN3VSRWGD0kGxtgsAL/6oJ94h+/7O4MePt1
         EPmEpn5Q8NAWSMM3UUM9opVcryuCutockWqyCJj2PVWLZ3A887fz6zEZpBN4Z0pAE/sC
         n+qA==
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
Thanks for your quick reply.
   I just follow your README file :make and make modules , then make in=
stall
& modules_install.

I want the counters features, so I git cloned the latest code.

Please help!
Best regards

