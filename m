From: Emilio Augusto Lazo Zaia <emiliolazozaia@gmail.com>
Subject: Re: end iptables support
Date: Mon, 5 Oct 2020 01:46:28 -0400
Message-ID: <dd3f6bee-3e39-48ae-586f-80f96e8da03d@gmail.com>
References: <660c1cff-64a9-13d3-e219-713d0cd44bd8@gmail.com>
 <91dc6d18-670e-4435-38b7-3998666ae772@thelounge.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:references:from:message-id:date:user-agent:mime-version
         :in-reply-to:content-transfer-encoding:content-language;
        bh=jn06/AWVMqZqXVL+kwczTIFspLSzgETzTawcQjIdJic=;
        b=MvbMLexXn+oL5cLbVX6L2eBxTjWGefXjFhb9MGL87FtEW5678L8zyLMkYedHX6LbBl
         ileQ7Ijcdfzkmardk2P70HFIb2lDN89JMLw3MsdRwldCKR3Ul/hVx94Q008ckvAGLL7q
         zbkAYANUkwfTBrGXHCI6s2/oHXOUw5WayGZMktkHj8RfngFbUQ21lEgQdEAWN9ckaOsp
         xbYYtVKjwRdaST16fxa0G5C2cUR3B6TqGX5e6hCda0kpsjXB9cg8Mv22YylzEq4LObHS
         1wELgmkmyN5+/uVukASUYAUH5taWSkB3UrynicWqE8Sss2TJhWyqxO0ZGj3ptgRum9Em
         ScaQ==
In-Reply-To: <91dc6d18-670e-4435-38b7-3998666ae772@thelounge.net>
Content-Language: en-US
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: Reindl Harald <h.reindl@thelounge.net>, netfilter@vger.kernel.org

Thanks. But I'm using recent match. I can't switch to nftables if recent ma=
tch is not supported yet...


Emilio Augusto Lazo Zaia

On 3/10/20 8:58 a.=C2=A0m., Reindl Harald wrote:
>
> Am 03.10.20 um 07:40 schrieb Emilio Augusto Lazo Zaia:
>> When is supposed to be dropped the iptables support in Linux kernel in f=
avor of nft? Currently I'm using iptables in many servers!
> in 99% of all cases with a recent distribution you can just switch to
> iptables-nft and are done
>
> at boot (it can restore iptables-legacy rules):
> /usr/sbin/iptables-nft-restore /etc/sysconfig/iptables
>
> after that:
> alternatives --config iptables
> alternatives --config arptables
> alternatives --config ebtables
>
> switch to nft backend and now your well known "iptables" commands will
> use the "nft" backend behind the scenes
>
> done that months ago on all Fedora 31 servers here while iptables-nft is
> the default starting with Fedora 32
>
>
