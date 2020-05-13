From: =?UTF-8?B?0IbQstCw0L0g0KnQtdGA0LHQtdC5?= <ivan@intraffic.ua>
Subject: Dynamic list for net's
Date: Wed, 13 May 2020 20:40:15 +0300
Message-ID: <CAPLRfGJXvrwpROcjAsxb-7=dASRO1j0h+UbwKUDhXi1zXV48_g@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intraffic-ua.20150623.gappssmtp.com; s=20150623;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=5fionR1buap8CNzgOKJb8l62eV/8c5ek99MztJT5NVw=;
        b=fwBRnrHQwKaDDrRUMxXro+p/HMcy72UrFYlcfFvz07xMin25cYM7/b609hRqaIkuM0
         G8jP0rUbPGQaCceTAmKSx3sxmKY05XYLT9PqsMSqwvtPQpqhLdgFWT8DuuSZq/X/2Y0J
         JETTRrlE/cqzsQZkG18DPO+fNcZ6Cc5Vr3bUhLZh2WFKygVQEcAaNPGmwGlLclftOQgt
         QtG+DTYNd+Xf3qCI2cTRI/l9bzKMACgUwA59Xy32SFJwB2ZaS3K6T5dFLm8RD1U86ufw
         Kg3o7m3RLcHIIAcPPQAnBgha41+thMjfV/ShMurWnitP0Z0ZKb6SyTA7dmMtz8TGxnqy
         9Olw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"
To: netfilter@vger.kernel.org

Hi all

I have question about "SET"

I read this block on manpage:
>
> Using anonymous sets to accept particular subnets and ports.
>
>
> nft add rule filter input ip saddr { 10.0.0.0/8, 192.168.0.0/16 } tcp dpo=
rt { 22, 443 } accept
>
> Named sets are sets that need to be defined first before they can be refe=
renced in rules. Unlike anonymous sets, elements can be added to or removed=
 from a named set at any time. Sets are referenced from rules using an @ pr=
efixed to the sets name.
>
> Using named sets to accept addresses and ports.
>
>
> nft add rule filter input ip saddr @allowed_hosts tcp dport @allowed_port=
s accept


But i can't use network how elements in set. because only ipv4_addr or
ipv6_addr types are supported.

How can I do it in other way?

I need to check large lists of networks ( more than 40k in one list )
I used to do this with ipset:
Example:
create net_allow hash:net family inet hashsize 1024 maxelem 65536
add net_allow X.X.X.X/X

I am trying this with "vmap".but it doesn=E2=80=99t look very easy and I ne=
ed
to use "jump" in rules


Regards
Ivan

P.S. Sorry for my English
