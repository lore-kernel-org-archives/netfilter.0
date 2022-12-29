From: Martin Zaharinov <micron10@gmail.com>
Subject: Re: NFT Flowtable HW Offload
Date: Thu, 29 Dec 2022 18:11:12 +0200
Message-ID: <F8960ED3-AA4F-45F9-9E00-76E700106DD8@gmail.com>
References: <80DB4032-71C6-416B-BB13-9DE27F77E8EC@gmail.com>
 <NLwpgtobAC8slS8sdLCSLimsjkHkz8gZf-r_2me75YbQUgNTLvURrlRfhQ6kQP_vN6CptFjf3d2mNGtOyVRyt0Qb6U9sCNkMsl-uPpt4f3o=@proton.me>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:references:message-id:content-transfer-encoding:cc:date
         :in-reply-to:from:subject:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=RXTVaKaGb8VJGwDvvzDjDtFsyGkOlFJWZ402pxYiftI=;
        b=YUnX02Ya0f3Y4wU3zeOFwES8MILmu8YTF7/qeT5UgZzp+cjAhqI0NyzxsjA4vfh9iU
         kZc9wgA1WEK9nsSiMf0gRyddLLN0i0ccNURHyfALal2Ka92SHQsGvaUwi2Fca9ztvM0w
         Ay8emTIrnIsBibNnafpa4G+Ix8W/0If2XnzROa2KGWOOKKAze5z+SR3l2Tnq4XZ5xIAN
         F6cCqhZdm8rOab/bpWCNB/MRnm9Ef7fAKwevBGiBBx4yh+AWvbUhQkRnj7jRh/N5fARR
         4uYgBaMUQcbhq9JuX5YrKZCsoiGLhI+3Urd1/na+TUPnj2QC6s+KOi5Jal9Tle2Nyhe1
         dsdA==
In-Reply-To: <NLwpgtobAC8slS8sdLCSLimsjkHkz8gZf-r_2me75YbQUgNTLvURrlRfhQ6kQP_vN6CptFjf3d2mNGtOyVRyt0Qb6U9sCNkMsl-uPpt4f3o=@proton.me>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric <evil.function@proton.me>
Cc: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter <netfilter@vger.kernel.org>

Hi Eric


> On 29 Dec 2022, at 17:57, Eric <evil.function@proton.me> wrote:
>=20
> ------- Original Message -------
> On Thursday, December 29th, 2022 at 00:02, Martin Zaharinov =
<micron10@gmail.com> wrote:
>> Kernel is 6.1.1
>>=20
>> How to enablee hw offload is there need other config ?
>=20
> I'll make a guess that your kernel build config doesn't include the =
NFT_FLOW_OFFLOAD setting.  The OpenWrt list has a couple of similar =
issues with dup and connlimit not being built in resulting in errors =
like yours, so it makes me suspect the same is going on here.
>=20
> Just for reference, here is a snippet from the current OpenWrt config =
(note specifically the last line that I've included)
> =
https://github.com/openwrt/openwrt/blob/master/target/linux/generic/config=
-5.15#L4249-L4250
>=20


All this Config is set to M in my config:=20

> # CONFIG_NFT_CONNLIMIT is not set
> # CONFIG_NFT_DUP_IPV4 is not set
> # CONFIG_NFT_DUP_IPV6 is not set
> # CONFIG_NFT_FIB_IPV4 is not set
> # CONFIG_NFT_FIB_IPV6 is not set
> # CONFIG_NFT_FIB_NETDEV is not set
> # CONFIG_NFT_FLOW_OFFLOAD is not set
>=20

Software offload work and in conntrack -L i see :=20

udp      17 src=3D10.44.211.121 dst=3D203.88.5.80 sport=3D14501 =
dport=3D4500 src=3D203.88.5.80 dst=3D122.50.224.117 sport=3D4500 =
dport=3D14501 [OFFLOAD] use=3D2


but when try to switch to HW offload with add flags offload , receive =
this error

And in ethtool is set :

ethtool -k eth0

hw-tc-offload: on=20

Best regards,
m.


> Eric

