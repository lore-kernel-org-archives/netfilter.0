From: Dave Taht <dave.taht@gmail.com>
Subject: pedit "pass" nonfunctional on ingress?
Date: Mon, 10 Jul 2023 17:23:10 -0600
Message-ID: <CAA93jw5Vk+ZX+GVS=EaFxpyuw_c5c5NJ9=jwJa8sNZkDih9bzw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1689031402; x=1691623402;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=SWVitc5xdRfaDHcK5+ltw0q61AvKGoMCuBVg8Dez34g=;
        b=Jw+giiMOa1V6dz8lNdNm0EqHn4YSWEp4ki4sryc/awit3s/pHrolaDfbDUCooi3yZ0
         SdUlxcspdxrua7ctqsYTfN8ut+o4CEnhIzKohSyFOBCJNxP4kKUEoCIo+1HIlSEZdVid
         0/mYncv09OyyAzJdW9yobzurYRy05gwnV1d4MVdfhb/ut6WuwmCdn9/NrbbzqXQSYHaV
         R3/zR6By2dCi2K2mRggxIudiy1gLY/i1WEk5hwQ3zE9j2+hqxea5iMhZLJjrinFmD/nn
         syzbVRTtRl6oJyvtho+GDWL6OlfcmSSefbUjA1UQ077lk4sYxOLMDYrYKFEjjX2TMJ5w
         Pnfw==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@vger.kernel.org

#!/bin/sh

IFACE=3Deth0
IP=3D147.28.149.223 # example
sudo tc qdisc del dev $IFACE ingress handle ffff:
sudo tc qdisc add dev $IFACE ingress handle ffff:
sudo tc filter add dev $IFACE protocol ip parent ffff: u32 match ip
src $IP action pedit ex munge ip dsfield set $((15 << 2)) retain 0xfc
# pass is the default

exit

# My understanding of this new to me tc filter facility is that it
should munge the inbound packet and still transit the stack

# But it doesn't. All packets from this address start failing.
# It does show a match, tho.

# root@dallas:~# tc -s -d filter show dev eth0 parent ffff:
# filter protocol ip pref 49152 u32 chain 0
# filter protocol ip pref 49152 u32 chain 0 fh 800: ht divisor 1
# filter protocol ip pref 49152 u32 chain 0 fh 800::800 order 2048 key
ht 800 bkt 0 terminal flowid ??? not_in_hw
  match 931c95df/ffffffff at 12
        action order 1:  pedit action pass keys 1
         index 1 ref 1 bind 1 installed 277 sec used 0 sec firstused 277 se=
c
         key #0  at ipv4+0: val 003c0000 mask ff03ffff
        Action statistics:
        Sent 22764 bytes 271 pkt (dropped 0, overlimits 0 requeues 0)
        backlog 0b 0p requeues 0

# it doesn't. I can see it matchingon kernel 5.15, but the data does
not go anywhere...
--

--=20
Podcast: https://www.linkedin.com/feed/update/urn:li:activity:7058793910227=
111937/
Dave T=C3=A4ht CSO, LibreQos
