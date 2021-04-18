From: =?UTF-8?Q?Pekka_J=C3=A4rvinen?= <pekka.jarvinen@gmail.com>
Subject: nftables port forward on DHCP interface to static IP
Date: Sun, 18 Apr 2021 18:59:42 +0300
Message-ID: <CABvnMci0-E23tAVE3MVgToSdbNuECqtMOe2wWimMmqZ9HZ9dHg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to
         :content-transfer-encoding;
        bh=+8FteVRHEYrnbAzO9qmHcSL0TMQE1/FCoCf+B2MaqJ4=;
        b=D//Zv744l7ZV7aFK9dvnRc5R8Ky7dbiD+Z/fO+R5of9wh4TgtrEQMJ+aKxW1qGLlMC
         nVtKwuY6VKrRuGhs+PkotHiLUUM7P+gTNoOhKyUs2Z/+B1OEZ9/eCtF2aroz18O/vDc4
         rwSck6sg4/DTVONMNV06s4GLxmVtFFoNEvW5FAF3shWHSPhyYHAlsWDy9nKDyZRhHIx8
         Ycp7ObM5z/v5cwFg8bgneK7dQNFT9EwlAu+Dh0fRU41jvbOcR0Inny6AhgnJA7W+GULl
         Kzn/GThxdqHZ4BQHmO/g0S5WyEHz2bIHHOTAd++LZMA8U/sYp/Yu6LOW2LeVzPlXOwem
         9eag==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

Hi,

I'm trying to setup port forward for interface which uses DHCP. I
don't want to reference the interface's public IP in a rule. Is it
possible? My attempt:

iifname $wanif tcp dport {12345} dnat ip to 192.168.1.11

Error: Could not process rule: No such file or directory

Kernel 5.11.2.

define wanif =3D wan0
define lanif =3D lan0
define home_net =3D 192.168.1.0/24
define home_net_gw =3D 192.168.1.1

table inet filter {
  # ...

  chain prerouting {
    type nat hook prerouting priority dstnat; policy accept;
    ct state invalid drop
  }

  chain postrouting {
    type nat hook postrouting priority srcnat; policy accept;
    ct state invalid drop
    oifname $wanif masquerade persistent comment "MasqNAT"
    drop
  }
}

--=20
Pekka J=C3=A4rvinen
