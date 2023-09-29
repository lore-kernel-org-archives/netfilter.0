From: "Kerin Millar" <kfm@plushkava.net>
Subject: Re: ipset swap to nftables set
Date: Fri, 29 Sep 2023 15:41:51 +0100
Message-ID: <198a0e49-7406-45b8-9e7b-4c074a7b31dc@app.fastmail.com>
References: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1695998532; x=1696084932; bh=IrUWacBoUU+XJIYuWoD9shI6t
        0YmbybyZ8gq/5ZPgBc=; b=AyANVaW1v0KCo51Dr6Gssmin2yS6wC33mFvd0It7e
        PKCR/QiUN+ltWbqG54HeJqEgB+iWVOd5aFLmiw54QRkbt60MbaUZvDFxa6OBLBUV
        pj7vM7k404mXpcctxASFlzIrlqmY/o4iy2FqxJ3NvBdnK+fMLWyj/Pj/sbeePGap
        Q4+zbHLAFWQJ1+FxZKbLl69bO/vHlHxgYIiQLMea6qsjhI+Sxi9Vr3SPxT1MxgQT
        I0J9toAvZFUX11InMPZjLztDDVcSr04RmIYB+sJ48qULZkN+tFmwMEf+QGYjY9a8
        nBx8pru6Zq8oASPZahMja2Buf/EmdCpO/SCZ30DXK0Afg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1695998532; x=1696084932; bh=IrUWacBoUU+XJIYuWoD9shI6t0YmbybyZ8g
        q/5ZPgBc=; b=DkurxQcsTT+tYA0IpWMxJy7cnZp+iGnSKyqBgRBJBqYfJcYgaly
        HEMZcAskivDxXiyObDhnwvcV9EMNVRLOwigbzR3OXr96CfhOR8hfLIyQbWLUoOwk
        amV6ezltSk92yoaAkBR26oPHPA7GvLqXNFXte8p11PvRTaHdTIjCMUJvfi5xNabG
        uHEs1iMsOH9voHUGi4qh4UAM5KZ3e/P2dMxVx0H1lZXfdjWMckDDj/UWIRNdJtj2
        4cwvxdCGrzazMrZAghgl8TSIZd55M+37aigGuz3/87IaPAGAoZWNU8gv/d1LYYih
        ETCuhaiYcy4k4A2XTdwv9MK9+GbuUUmSLQQ==
In-Reply-To: <befa0f8e-e76f-8671-81b1-587351b0cf53@gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org
Cc: marek <cervajs64@gmail.com>

On Fri, 29 Sep 2023, at 2:44 PM, marek wrote:
> hi,
>
> i'm using in production ipset swap with ~3000 ip addr
>
> i.e.
>
> - change coming from customer (new ips, old ips deprecated)
>
> - generation of new list /etc/sysconfig/ipset-new
>
> - swap ipset-new with ipset
>
> transaction is near real-time
>
>
> now i'm moving from RHEL7 to RHEL9 (rocky, kernel 5.14, nftables 1.0.4=
)=20
> and trying move from ipset to nftables sets
>
> nft add set ip filter blackhole { type ipv4_addr\; comment \"drop all=20
> packets from these hosts\" \; }
> fill the set
>
> now the new flow is
>
> - change coming from customer (new ips, old ips deprecated)
>
> - nft flush set ip filter blackhole
>
> - nft add element ip filter blackhole { X }=C2=A0=C2=A0 (bash for loop)

Executing nft repeatedly will certainly be slow, if that is what you are=
 currently doing. I'd be interested to know what you are using for to it=
erate over precisely because there's a fair chance that your use of for =
is an anti-pattern to begin with.

>
>
> it tooks 10sec
>
> can you recommend better way? (performance similar to ipset swap)

Yes, definitely. However, I would prefer to see some of the existing cod=
e first. This will make it easier to provide clear guidance as to how to=
 modify your script. In particular, please make it clear where the input=
 data comes from, and the precise format of this data.

--=20
Kerin Millar
