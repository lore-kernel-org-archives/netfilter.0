From: Aleksey Kashin <aleksey.kashin@gmail.com>
Subject: Re: [xtables-addons] problem with TEE and Debian Lenny (Unknown arg (null))
Date: Wed, 25 Jan 2012 09:08:48 +0500
Message-ID: <CAPJYFP_j990ES_TSNNz6WgH39C091ciE-ybFvgH0TZyL2O2y2w@mail.gmail.com>
References: <CAPJYFP-XLLoupqx9t9+C98S887Hr7yDe-oZ0--2fHOcFzOM1hg@mail.gmail.com>
	<alpine.LNX.2.01.1201242220140.5731@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :cc:content-type:content-transfer-encoding;
        bh=nJ9iLiI+EcEKZawy+FHZlVZM+bq+R4TL/wNkCP/7O6w=;
        b=RjpQYOvWkKtp3x30eJ+IYdlQLiBmoxDSY4NwgLnL2JsH8INQUTWXNIVHr9/fKFOvBs
         IxZ5YqZH9xNoQKx/DByIAAGb3DjHjgfntYpzWwnVhlb+FMb72G1rZciGH+hSSIaXPxj1
         K8mtDsljcBJPXUvugonX0inNZM60foV3jvaQI=
In-Reply-To: <alpine.LNX.2.01.1201242220140.5731@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="koi8-r"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org

Hello.

I've compiled and installed iptables 1.4.8 from src-package debian
squeeze and I got another error:

# iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.99.2.37
iptables v1.4.8: unknown option `--gateway'
Try `iptables -h' or 'iptables --help' for more information.

# dpkg -l | grep iptables
iptables                                          1.4.8-3

Thank you.

2012/1/25, Jan Engelhardt <jengelh@medozas.de>:
> On Tuesday 2012-01-24 18:24, Aleksey Kashin wrote:
>
>>Hello.
>>
>>I'm using Debian Lenny amd64. I need clone traffic to another server.
>>I'm trying to use TEE module from xtables-addons, but I've got this
>>error:
>># modprobe xt_TEE
>># iptables -t mangle -A PREROUTING -i eth0 -j TEE --gateway 10.99.2.3=
7
>>iptables v1.4.2: Unknown arg `(null)'
>>Try `iptables -h' or 'iptables --help' for more information.
>>
>>What does it mean? Can anyone help me with this problem?
>>
>>I use the following software:
>>- Debian Lenny amd64 5.0.8 with 2.6.26-2-vserver-amd64 kernel
>>- iptables - 1.4.2-6
>>- xtables-addons-common - 1.26-2
>>- xtables-addons-modules-2.6.26-2-vserver-amd64 - 1.26-2+2.6.26-27
>
> As per the INSTALL file of xt-a, version 1.26 requires iptables 1.4.3=
=2E
> This dependency is probably not properly recorded in the
> xtables-addons-common-1.26-2 package, but starting with iptables
> 1.4.12.2, the deps are properly propagated to xt-a.
>


--=20
=F3 =D5=D7=C1=D6=C5=CE=C9=C5=CD,
=EB=C1=DB=C9=CE =E1=CC=C5=CB=D3=C5=CA
