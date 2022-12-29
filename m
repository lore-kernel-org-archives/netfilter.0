From: Eric <evil.function@proton.me>
Subject: Re: NFT Flowtable HW Offload
Date: Thu, 29 Dec 2022 15:57:21 +0000
Message-ID: <NLwpgtobAC8slS8sdLCSLimsjkHkz8gZf-r_2me75YbQUgNTLvURrlRfhQ6kQP_vN6CptFjf3d2mNGtOyVRyt0Qb6U9sCNkMsl-uPpt4f3o=@proton.me>
References: <80DB4032-71C6-416B-BB13-9DE27F77E8EC@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=proton.me;
        s=protonmail; t=1672329451; x=1672588651;
        bh=Saj2hVZGb7fdGBRYsVqnzE87B2yXl7HAQIcK5OiXOas=;
        h=Date:To:From:Cc:Subject:Message-ID:In-Reply-To:References:
         Feedback-ID:From:To:Cc:Date:Subject:Reply-To:Feedback-ID:
         Message-ID:BIMI-Selector;
        b=MP0Vy356tWWVXB+hBM9jS1DNis2pB+uyLfPKwlWrR04RZxZZWhDUGSghQvl9tnngm
         uJXH36kMuV2IpG2AvW7sh1gyN+HySWVrFhbfdWjEZP1J+I5dErP6wUwUgrA1XrLZkJ
         Q4kED4hVYSUpgdww1DxUTiVrpeQubr/LcS7+4axDvysiblOYvoEkPK3vudFH6MNmJE
         E3DXjsmbklQm+QwRTX+IZ/Cjetam8HmHn1aoZZOWEURuDkm0B7d2liSeXXkfV823wV
         wrLDbJiXJI9xpNnCq6oAyLIyCZhXr8ZLOJgPj0CAXGsue0fXGfy+34gzvBHNQXVZ1k
         iZ6vQOM/K0Vgw==
In-Reply-To: <80DB4032-71C6-416B-BB13-9DE27F77E8EC@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Martin Zaharinov <micron10@gmail.com>
Cc: Florian Westphal <fw@strlen.de>, pablo@netfilter.org, Paolo Abeni <pabeni@redhat.com>, netfilter <netfilter@vger.kernel.org>

------- Original Message -------
On Thursday, December 29th, 2022 at 00:02, Martin Zaharinov <micron10@gmail=
.com> wrote:
> Kernel is 6.1.1
>=20
> How to enablee hw offload is there need other config ?

I'll make a guess that your kernel build config doesn't include the NFT_FLO=
W_OFFLOAD setting.  The OpenWrt list has a couple of similar issues with du=
p and connlimit not being built in resulting in errors like yours, so it ma=
kes me suspect the same is going on here.

Just for reference, here is a snippet from the current OpenWrt config (note=
 specifically the last line that I've included)
https://github.com/openwrt/openwrt/blob/master/target/linux/generic/config-=
5.15#L4249-L4250

# CONFIG_NFT_CONNLIMIT is not set
# CONFIG_NFT_DUP_IPV4 is not set
# CONFIG_NFT_DUP_IPV6 is not set
# CONFIG_NFT_FIB_IPV4 is not set
# CONFIG_NFT_FIB_IPV6 is not set
# CONFIG_NFT_FIB_NETDEV is not set
# CONFIG_NFT_FLOW_OFFLOAD is not set

Eric
