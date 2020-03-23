From: Zheng konia <konianet@gmail.com>
Subject: Ipv6tov4 address Dnat
Date: Mon, 23 Mar 2020 13:35:02 +0800
Message-ID: <CAG1z+7_CKA90Yd_AFkw+Jh7zJsxWE21Vnbso7fh3y9a_wcjSFg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=LwcErEVHQqeeY4WDqFgDvYYxpULq3HS7G0RE9bo/hjs=;
        b=dbdvOBkG2xaEi68bbVSFXAADCrhemSWUS+Ir+LhSnwNwaXL78xWrTQMAfaykpR7BOp
         biXJTU2xJp2Z89MAns2aI4tRGz/6gVIqX0OE15UmC17Cvs1YMNst4PDDbngv7/BDbjRi
         +HXT5Mbp/bLc13h3BQoMreptAUhOJLxZAuQltJ+ppviUrEIZH/v4g3Artw0GYbV/A3Cf
         TZjUwfOYSfFuSym7fNu89eUqBCHT1Bw9xsHFXQqnwJiM83M3WHSI38jIS4HYzMehNSx5
         s5/TiUybOa0JOrGV+Cp9fSY0QrgnPnTnTL6LPYoCwfwbntmSPsMz7C1EC3r02uIi2+JU
         FnCw==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Netfilter Users Mailing list <netfilter@vger.kernel.org>

Hi ,

     I want to do the dnat like

            match IPV6  udp dport 9999 dnat to  IPV4:9999

     However, the rule bellow didn't work.

table inet nat {

   chain prerouting {
       type nat hook prerouting priority 100; policy accept;
                ip6 nexthdr udp udp dport 9999 dnat to  192.168.1.11:9999
        }

     chain postrouting {
         type nat hook postrouting priority 100; policy accept;
        masquerade
   }

  Could you show me how to config ipv6 dnat to ipv4 ? Thanks.

---------------
konia
2020/03/23
