From: Aleksey Kashin <aleksey.kashin@gmail.com>
Subject: Re: [xtables-addons] problem with TEE and Debian Lenny (Unknown arg (null))
Date: Wed, 25 Jan 2012 22:59:43 +0600
Message-ID: <CAPJYFP8+cgufrGQmxbsAPkwOCkTX+ByqLxbqQKpWFxeiag-dBA@mail.gmail.com>
References: <CAPJYFP-XLLoupqx9t9+C98S887Hr7yDe-oZ0--2fHOcFzOM1hg@mail.gmail.com>
	<alpine.LNX.2.01.1201242220140.5731@frira.zrqbmnf.qr>
	<CAPJYFP_j990ES_TSNNz6WgH39C091ciE-ybFvgH0TZyL2O2y2w@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type:content-transfer-encoding;
        bh=wtfjq8D+n8i43wylTG0GcI8f8fDZmFVikva5Wbc7rGw=;
        b=wmZWpzexlpqsQSSDlRlcG6tbTc3cUYeQVSA0Vl5EO8D78NiV2iMMcmEXWoXQN5x0hV
         DivEbHA86T03rhBk5oVlxlivsYK6lkRS17/lsPBZLGlt+r5IZ/x2zP7J48YmYojVd6yn
         s+G9p73wiqnp9BZPP53OzC6Brmg4VOVsnVAoA=
In-Reply-To: <CAPJYFP_j990ES_TSNNz6WgH39C091ciE-ybFvgH0TZyL2O2y2w@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: netfilter@vger.kernel.org

I solved this problem. In the compiled xtables-addons-common package
was not libxt_TEE.so because in the file debian/rules from
xtables-addons source package was following strings:
        # do not build TEE (see #592237)
        sed -i 's/build_TEE=3Dm/build_TEE=3Dn/' mconfig

I commented out this string and it's worked.

Thank you.

2012/1/25, Aleksey Kashin <aleksey.kashin@gmail.com>:
> Hello.
>
> I've compiled and installed iptables 1.4.8 from src-package debian
> squeeze and I got another error:
>
> # iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.99.2.3=
7
> iptables v1.4.8: unknown option `--gateway'
> Try `iptables -h' or 'iptables --help' for more information.
>
> # dpkg -l | grep iptables
> iptables                                          1.4.8-3
>
> Thank you.
>
> 2012/1/25, Jan Engelhardt <jengelh@medozas.de>:
>> On Tuesday 2012-01-24 18:24, Aleksey Kashin wrote:
>>
>>>Hello.
>>>
>>>I'm using Debian Lenny amd64. I need clone traffic to another server=
=2E
>>>I'm trying to use TEE module from xtables-addons, but I've got this
>>>error:
>>># modprobe xt_TEE
>>># iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.99.2.=
37
>>>iptables v1.4.2: Unknown arg `(null)'
>>>Try `iptables -h' or 'iptables --help' for more information.
>>>
>>>What does it mean? Can anyone help me with this problem?
>>>
>>>I use the following software:
>>>- Debian Lenny amd64 5.0.8 with 2.6.26-2-vserver-amd64 kernel
>>>- iptables - 1.4.2-6
>>>- xtables-addons-common - 1.26-2
>>>- xtables-addons-modules-2.6.26-2-vserver-amd64 - 1.26-2+2.6.26-27
>>
>> As per the INSTALL file of xt-a, version 1.26 requires iptables 1.4.=
3.
>> This dependency is probably not properly recorded in the
>> xtables-addons-common-1.26-2 package, but starting with iptables
>> 1.4.12.2, the deps are properly propagated to xt-a.
>>
>
>
> --
> =F3 =D5=D7=C1=D6=C5=CE=C9=C5=CD,
> =EB=C1=DB=C9=CE =E1=CC=C5=CB=D3=C5=CA
>


--=20
=F3 =D5=D7=C1=D6=C5=CE=C9=C5=CD,
=EB=C1=DB=C9=CE =E1=CC=C5=CB=D3=C5=CA
