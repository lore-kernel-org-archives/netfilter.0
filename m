From: Arturo Borrero Gonzalez <arturo.borrero.glez@gmail.com>
Subject: Re: Masquerading with selectively open ports -- nftables
Date: Thu, 29 Oct 2015 09:11:03 +0100
Message-ID: <CAOkSjBiQ3uGZW9-mUXqGp8xFbfjwHnGd0T=S_1-Qhm0q+cq-cQ@mail.gmail.com>
References: <E3A2E5F1-41EB-41BA-A45D-7FEF5680DC15@gmail.com>
 <20151028231533.GA2371@salvia> <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-type:content-transfer-encoding;
        bh=U2yGK97qNIJ5OJ3wywacAbU3krrX52TyQS4Zc6M+bjU=;
        b=B0L07pHS2xPUzmgSZ2WSq+EBQI5tB3kT4IMobqfWWRNv8bmSSgOXnjkNJzt9RF4wh4
         +sZcG8COzE3+zb1lmESsPte+zveHXMRybZuhvYMdHIRCYsaTxWg9vvC++OjL6D7PjqEc
         5hpvNNuKjtvTyEdD6Ly6r30vKEXyuVYeCzjsL7zbZsRT/bAg17qdapSQ8gQuetqmKyOJ
         EPJ/NsTGUBO+bksLRJkZTRgl2S+3BitssDqwidgg5jSe1LkC2ZnANjJjrFNWHN6VBZVt
         RwCQk0VcpBJ5InXibD/PgUNlNHax0zI8JraBcChwyRx1bP3/O8vDL8j5SjamMXNWIkrN
         77gQ==
In-Reply-To: <17D2CE38-D4D5-4838-9749-B1FBC907E239@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: Johannes Ernst <johannes.ernst@gmail.com>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, Netfilter Users Mailing list <netfilter@vger.kernel.org>

On 29 October 2015 at 05:51, Johannes Ernst <johannes.ernst@gmail.com> =
wrote:
>> On Oct 28, 2015, at 16:15, Pablo Neira Ayuso <pablo@netfilter.org> w=
rote:
>>
>> You can probably contribute these examples to the wiki. Or I'd be
>> happy to get more or less generic scripts as examples that we can
>> place in the wiki.
>
> Once I figured out how to do what I want to do, I will definitely put=
 it somewhere where others can find it.
>
>>> Now I=E2=80=99m attempting to add masquerading, and I=E2=80=99m fai=
ling:
>>>> nft add table nat
>>>> nft add chain nat prerouting { type nat hook prerouting priority 0=
 \; }
>>>> nft add chain nat postrouting { type nat hook postrouting priority=
 0 \; }
>>>> nft add rule nat postrouting masquerade
>>> <cmdline>:1:1-35: Error: Could not process rule: No such file or di=
rectory
>>> add rule nat postrouting masquerade
>>> ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
>>>
>>> 1. This is copied straight from the wiki [1]. What am I doing wrong=
?
>>
>> The lines above work fine here.
>>
>> Masquerading was added in 3.18, what kernel version are you using?
>
> I=E2=80=99m on Arch, Linux 4.2.2 or thereabouts.
>
>> Moreover, make sure you also compiled masquerading support for nf_ta=
bles:
>>
>> CONFIG_NFT_MASQ=3Dm
>
> Ahh, that might be it. The Arch build script is here [2] and I don=E2=
=80=99t see anything that looks like CONFIG_NFT_MASQ. I=E2=80=99ll reco=
mpile tomorrow and see where that leads us.
>

this config option is from the linux kernel, for example:

% grep CONFIG_NFT_ /boot/config-4.2.0-1-amd64
CONFIG_NFT_EXTHDR=3Dm
CONFIG_NFT_META=3Dm
CONFIG_NFT_CT=3Dm
CONFIG_NFT_RBTREE=3Dm
CONFIG_NFT_HASH=3Dm
CONFIG_NFT_COUNTER=3Dm
CONFIG_NFT_LOG=3Dm
CONFIG_NFT_LIMIT=3Dm
CONFIG_NFT_MASQ=3Dm
CONFIG_NFT_REDIR=3Dm
CONFIG_NFT_NAT=3Dm
CONFIG_NFT_QUEUE=3Dm
CONFIG_NFT_REJECT=3Dm
CONFIG_NFT_REJECT_INET=3Dm
CONFIG_NFT_COMPAT=3Dm
CONFIG_NFT_CHAIN_ROUTE_IPV4=3Dm
CONFIG_NFT_REJECT_IPV4=3Dm
CONFIG_NFT_CHAIN_NAT_IPV4=3Dm
CONFIG_NFT_MASQ_IPV4=3Dm
# CONFIG_NFT_REDIR_IPV4 is not set
CONFIG_NFT_CHAIN_ROUTE_IPV6=3Dm
CONFIG_NFT_REJECT_IPV6=3Dm
CONFIG_NFT_CHAIN_NAT_IPV6=3Dm
CONFIG_NFT_MASQ_IPV6=3Dm
# CONFIG_NFT_REDIR_IPV6 is not set
CONFIG_NFT_BRIDGE_META=3Dm
CONFIG_NFT_BRIDGE_REJECT=3Dm


> The other thing I=E2=80=99m still missing is where to attach the masq=
uerade keyword. Is it on the incoming or outgoing interface or automagi=
c? E.g. if my box has two interfaces (enp2s0, upstream to ISP with DHCP=
) and (enp3s0, LAN, static IP assignment), do I need to say something l=
ike =E2=80=9Ciifname enp2s0 masquerade=E2=80=9D?
>

masquerading is a kind of source NAT, so only works in the output
path. In think you need this: 'oifname enp2s0 masquerade' in the nat
postrouting chain.

> Also, the example has a separate table =E2=80=98nat=E2=80=99. Can I j=
ust put the nat chain into my inet filter table, or does this have to b=
e a separate table?
>

In nftables tables has no special semantic apart of storing chains.
Beware of families however, I doubt the inet family can hold NAT
stuff.

--=20
Arturo Borrero Gonz=C3=A1lez
