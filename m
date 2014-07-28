From: =?UTF-8?B?w4FsdmFybyBOZWlyYSBBeXVzbw==?= <alvaroneay@gmail.com>
Subject: Re: nftables: no table for ipv6
Date: Mon, 28 Jul 2014 18:08:28 +0200
Message-ID: <53D6757C.7090801@gmail.com>
References: <53D67106.2070600@thwitt.de>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=message-id:date:from:user-agent:mime-version:to:subject:references
         :in-reply-to:content-type:content-transfer-encoding;
        bh=5WiLea/jKnez40TMH0nQJyc1HwHT4SgqGZRCtcMxRsg=;
        b=FBE8U2cy7ldpn//ppXSurEMjWb1syADEB+ilu/GYwLdjHl0YiS0kGN5pJ6qlK1QwMz
         95DKqqM2Gel5T6FCMK8nKg88FIJLag0dWkTG6jG0e1GURk7EDcZdSgVcTzlmP85PlhJh
         2RScFj8MVKwN7exVCBsEQic0EK8oZlVwB2zDfIQA3kPUHBp06ghG/bDcbfR1W0wUNVQ4
         b+fjtW+/aUHZwW7t2tW0lWJvn1IqeOmrlRi3O+E6O6LBwYsjt2yBWx0+JBwZE/B0PqJw
         u3QZVsqCuWmKgRnNjs64CuckJ5X0/zlvUmi8evEbM/+GXzRX9iwnYj9uipaVFN6kxsnZ
         UZjA==
In-Reply-To: <53D67106.2070600@thwitt.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Thomas Witt <lists@thwitt.de>, netfilter@vger.kernel.org


Hello Thomas

El 28/07/14 17:49, Thomas Witt escribi=C3=B3:
> Hi, I am trying to configure nftables on a new server.
>
> I can add tables for ip4:
>
> # nft add table ip filter
>
> but not for ip6 or inet:
>
> # nft add table ip6 filter6
> # nft add table inet filterboth
> # nft list tables

If you write nft list tables, you will see only the tables of ipv4. Try=
=20
with nft list tables ip6 for ipv6 or nft list tables inet for inet.

Try with that and tell me the result.

I hope that I have helped you.

> table filter
>
> So, a table gets added for ipv4, but not for v6. What do I need to do=
 in
> order for nft to support ip6? And why does nft returns 0 instead of a=
n
> error?
>
> Versions:
> nftables-0.3
> libmnl-1.0.3
> libnftnl-1.0.2

Regards

Alvaro
