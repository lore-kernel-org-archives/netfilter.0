From: gaaimen1997 <gaaimen1997@protonmail.com>
Subject: Translating iptables rules with TTL, HL and physdev to nftables
Date: Sat, 04 Mar 2023 07:46:10 +0000
Message-ID: <hqPvtHzm3I0cxzrsj43wW11hd31Sxw36pN25SObh8dvW-0HotwJyND64l-aj9I4hR-yZyxxAnQabaueZNKo2haeejKFSI8AkB4Jgh0UG8i8=@protonmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
        s=protonmail3; t=1677915984; x=1678175184;
        bh=Id5NMwjU3gxvk0HIEA76E0rynL3FQ0TQywuNgQoYNio=;
        h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
         Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
        b=Gzsda6J0wgFUv7/5A9NNTJg7NBOliiOB7qwnjSlghWr5ffkeWFrXpRZK2oFYI4XZ7
         Gv/7a5Sqkiorrb+m99EFwYvqLF5coeF4T1+KgAIbCKRxRFja7qTjpLhqS6DBxfhep3
         1+i0KnKWfA/QYEE17XGRkDTak2Gd7Y9FU8pv5EvlbT0EecYk8JqxguZPXrrquIr1r3
         IEUb1+ZylTMdIPa+y2JbFI81NTABkqREQhpQDrhn8qVvlQkkrPUsmTuN04AoGtarM/
         ZnCVedAaxjwJZLGZzULqoYsFxmBoamgmNg3JSBos+682VDmZrayC/Oc6HEBEKEzVZC
         x2jCUW7PjtkTw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Hi,=20
I am translating iptables and ip6tables rules to nftables rules to set up m=
y portable router. However, the following commands did not translate correc=
tly when I used iptables-translate (ip6tables-translate)
=20
iptables -t mangle -A POSTROUTING -o eth0 -j TTL --ttl-inc 1
ip6tables -t mangle -A POSTROUTING -o eth0 -j HL --hl-inc 1
=20
iptables -t mangle -I POSTROUTING -m physdev --physdev-out usb0 -j TTL --tt=
l-inc 1
ip6tables -t mangle -I POSTROUTING -m physdev --physdev-out usb0 -j HL --hl=
-inc 1
=20
For the ttl and hl modules, I tried "ip ttl set 88" and "ip6 hoplimit set 9=
9" on my own, and they worked fine. However, I am unable to increase or dec=
rease ttl (or hoplimit) as --ttl-inc or --ttl-dec.
=20
=20
The first two rules and the last two rules operate under different conditio=
ns and they won't work simultaneously.
System: Debian 11, nftables v0.9.8 (E.D.S.)
=20
Can you help me with the correct nftables rules?
Thank you in advance!
