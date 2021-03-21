From: "etkaar" <lists.netfilter.org@prvy.eu>
Subject: Script to manage a simple DynDNS whitelist based firewall using nftables
Date: Sun, 21 Mar 2021 15:07:42 +0100
Message-ID: <5q9cd7kjj.3vbhNZ@prvy.eu>
Reply-To: <lists.netfilter.org+0cv5jfgzts@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=prvy.eu; s=20180701;
        t=1616335662; bh=TnltIXf3v96JJU1Kc3TYcphyUzob2BkDBQnVsty1bt8=;
        h=Date:From:Reply-To:To:Subject:From;
        b=LzFifXwHnd0fwqNeAHJvzJjKUt2HBq0EpZWpkAmZlu2bvInimiiZy9ztRS4FkmKlw
         n8qbh5gJxlbayAAyIeAPdWpua1csrfNdTZO/3TWnEuythCzIKse73iR0eWyODZbGGN
         Cj7UrWAtv4Efdu5EEYn6XyizWNHr/3Z9ZDgvh2ywwzQfK9GQtqOQCU2GgpboyWMe/R
         z3YLR7k47OMsR1f4sbkTkgHFRQMC0RTasdxIvv8bcqj7qLKCcvyyNw560QKn/coBJW
         2fgp07MR47EaRx3NRSZ9cyZAuBFg/fTxmgJaVyHPJsghq5eaYAjmKkJytmPKEOMxyE
         f4dSfgwmh8RRA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello!=0A=0AFirst, I want to thank the nftables team for all the work. I mo=
ved from iptables to nftables about a year ago. I manage many servers and t=
he way I go is simple and classic:=0A=0A1) All incoming traffic is dropped =
per default policy. One exception: Not for connections I opened (ct state e=
stablished,related accept).=0A2) Required ports for public services are ope=
ned then. But only, if it is required for them to be public (see 3).=0A3) I=
f those ports in 2) are only required to be used by a predictable group of =
persons or servers, I use a whitelist which is periodically updated.=0A=0AS=
imple examples are to only open the remote MariaDB port for a specific stat=
ic server IPv4 address and allowing SSH only for a specific DynDNS hostname=
 (which can deliver both a IPv4 and IPv6 address).=0A=0AThats why I made a =
lightweight Dash script (MIT License) I want to share with you:=0Ahttps://g=
ithub.com/etkaar/nftables-managing-script=0A=0AThe script is aware that sub=
nets in concatenated sets (for the whitelist) are not available yet in Debi=
an 10 Buster (nftables 0.9.0) and will automatically enable it in nftables =
> 0.9.4.=0A=0AThe good thing with nftables is, that the ruleset can be atom=
ically updated - of course, the script is aware of that (I don't know if at=
omic updates were ever possible in iptables to be honest).=0A=0AI hope it i=
s okay for you if I share that here and especially, that it may be helpful =
for some people out there :) Maybe it makes the slow transition to nftables=
 easier.=0A=0A--etkaar

