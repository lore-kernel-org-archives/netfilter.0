From: Johannes Ernst <johannes.ernst@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Wed, 28 Oct 2015 21:51:11 -0700
Message-ID: <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com> <20151028231533.GA2371@salvia>
Mime-Version: 1.0 (Mac OS X Mail 9.0 \(3094\))
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=from:content-type:mime-version:subject:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=yBQHhLJ8F5mxGBSaxsJS3Y6YpRuK4o/uXvust86dN9Q=;
        b=ysB/8NSwDa5yQ1LuIf5naRDy5GnoBND3FSCfLghvX27/6PNWWJcyQxJW8TOwx/j0dV
         3wEPp8NemQXK0XWI2MOjb8YprOYrrT1p/dHJhl2C+tEE4bF0lm+EwnxEOZaZI7iUPtxe
         fAGENyKeEIYVxkDk8q6aiEuobRA8M/B47z7omdcx+IfySCGtK7s2OBvUi8GklCQBuiLY
         h38bOLPtPxw07Eec8QNCbszss5r9XpHNFkbjHUEAOJx85CVTNNeb0+rza/PMTGuqQqJr
         0b6ezKFow7T2+kxypr8fw5+4M25cLnkRZtX9OIGy7NdLnOBPwO+GKCnEJjp7mtTLeAmZ
         RhXw==
In-Reply-To: <20151028231533.GA2371@salvia>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

> On Oct 28, 2015, at 16:15, Pablo Neira Ayuso <pablo@netfilter.org> wr=
ote:
>=20
> You can probably contribute these examples to the wiki. Or I'd be
> happy to get more or less generic scripts as examples that we can
> place in the wiki.

Once I figured out how to do what I want to do, I will definitely put i=
t somewhere where others can find it.

>> Now I=E2=80=99m attempting to add masquerading, and I=E2=80=99m fail=
ing:
>>> nft add table nat
>>> nft add chain nat prerouting { type nat hook prerouting priority 0 =
\; }
>>> nft add chain nat postrouting { type nat hook postrouting priority =
0 \; }
>>> nft add rule nat postrouting masquerade
>> <cmdline>:1:1-35: Error: Could not process rule: No such file or dir=
ectory
>> add rule nat postrouting masquerade
>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>=20
>> 1. This is copied straight from the wiki [1]. What am I doing wrong?
>=20
> The lines above work fine here.
>=20
> Masquerading was added in 3.18, what kernel version are you using?

I=E2=80=99m on Arch, Linux 4.2.2 or thereabouts.

> Moreover, make sure you also compiled masquerading support for nf_tab=
les:
>=20
> CONFIG_NFT_MASQ=3Dm

Ahh, that might be it. The Arch build script is here [2] and I don=E2=80=
=99t see anything that looks like CONFIG_NFT_MASQ. I=E2=80=99ll recompi=
le tomorrow and see where that leads us.

The other thing I=E2=80=99m still missing is where to attach the masque=
rade keyword. Is it on the incoming or outgoing interface or automagic?=
 E.g. if my box has two interfaces (enp2s0, upstream to ISP with DHCP) =
and (enp3s0, LAN, static IP assignment), do I need to say something lik=
e =E2=80=9Ciifname enp2s0 masquerade=E2=80=9D?

Also, the example has a separate table =E2=80=98nat=E2=80=99. Can I jus=
t put the nat chain into my inet filter table, or does this have to be =
a separate table?

Thank you!


Johannes.

[2] https://projects.archlinux.org/svntogit/packages.git/tree/trunk/PKG=
BUILD?h=3Dpackages/nftables

