From: "etkaar" <lists.netfilter.org@prvy.eu>
Subject: nftables =?UTF-8?Q?=3E=3D=20=30=2E=39=2E=38=3A=20atomic=20update=20=28nft?=
 =?UTF-8?Q?=20-f=20=2E=2E=2E=29=20of=20a=20set=20not=20possible=20any=20mo?=
 =?UTF-8?Q?re?=
Date: Tue, 04 Jan 2022 17:31:13 +0100
Message-ID: <5tg3b13w5.PCaY2G@prvy.eu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=prvy.eu; s=20180701;
        t=1641313874; bh=OTsozMyirJuWT1YP6BgHCNY9RPhBLkU9CRU0X0dC6OA=;
        h=Date:From:To:Subject:From;
        b=DsLG9chLmafK1ih4EsjGGR5PQZBUpTg+QRljG/J71IIMpsmKteUKv4GBV9yv3ivuG
         o5M4ibKkkXhvZAM9uNFgh2a7sm0g11WaCSNykqCrMU09Bzk+z6ov3YskFj09t8N8VX
         /co4ONib+0gBi7GYmAVYZaY/t5962dABiFbZPohrYZb1VvTmkcQdtfIFri7Y+v0Lq+
         ExLM/LoHu9Bzk7cmfQV5Qc0j5oH+ye+ECsXGd9uIuv7hX1CPn87jSMChIZVgcjHvis
         zE8f+aePJ7vGx53YdX64dCcZr0QLESKBn37kLsPlq8DJw1fakzRY0pIREKRXxmb9EK
         cAws/s4MUMyUQ==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

Dear colleagues,=0A=0Agiven is following perfectly working ruleset (nft lis=
t ruleset), which drops almost all of the IPv4 traffic, but grants access t=
o port 22 (SSH) for two IPv4 addresses provided by the set named 'whitelist=
_ipv4_tcp':=0A=0A+++=0Atable inet filter {=0A=09set whitelist_ipv4_tcp {=0A=
=09=09type inet_service . ipv4_addr=0A=09=09flags interval=0A=09=09elements=
 =3D { 22 . 111.222.333.444,=0A=09=09=09=C2=A0 =C2=A0 =C2=A022 . 555.666.77=
7.888 }=0A=09}=0A=0A=09set whitelist_ipv4_udp {=0A=09=09type inet_service .=
 ipv4_addr=0A=09=09flags interval=0A=09}=0A=0A=09set blacklist_ipv4 {=0A=09=
=09type ipv4_addr=0A=09=09flags interval=0A=09}=0A=0A=09chain default_input=
 {=0A=09=09type filter hook input priority filter + 1; policy drop;=0A=09=
=09ip saddr @blacklist_ipv4 drop=0A=09=09ct state established,related accep=
t=0A=09=09ct state invalid drop=0A=09=09iifname "lo" accept=0A=09=09ip prot=
ocol icmp icmp type { echo-reply, destination-unreachable, echo-request, ro=
uter-advertisement, router-solicitation, time-exceeded, parameter-problem }=
 accept=0A=09=09meta nfproto ipv4 tcp dport . ip saddr @whitelist_ipv4_tcp =
accept=0A=09=09meta nfproto ipv4 udp dport . ip saddr @whitelist_ipv4_udp a=
ccept=0A=09}=0A=0A=09chain default_forward {=0A=09=09type filter hook forwa=
rd priority filter; policy drop;=0A=09}=0A=0A=09chain default_output {=0A=
=09=09type filter hook output priority filter; policy accept;=0A=09=09oifna=
me "lo" accept=0A=09}=0A}=0A=0A+++=0A=0ANow comes the strange thing: In cas=
e the ruleset is atomically updated using following file (nft -f ...) the o=
utput of 'nft list ruleset' does not change at all (which is expected!), bu=
t now the IPv4 addresses do not any more have access:=0A=0A+++=0A#!/usr/sbi=
n/nft -f=0Aflush set inet filter whitelist_ipv4_tcp=0Aflush set inet filter=
 whitelist_ipv4_udp=0Atable inet filter {=0A=09set whitelist_ipv4_tcp {=0A=
=09=09type inet_service . ipv4_addr; flags interval;=0A=09=09elements =3D {=
=0A=09=09=0922 . 111.222.333.444/32,=0A=09=09=0922 . 555.666.777.888/32,=0A=
=09=09}=0A=09}=0A=09set whitelist_ipv4_udp {=0A=09=09type inet_service . ip=
v4_addr; flags interval;=0A=09}=0A}=0A=0A+++=0A=0AI have double-checked tha=
t in the logs:=0A=0A+++=0Anft dropped: [...] SRC=3D111.222.333.444=C2=A0DST=
=3D194.48.XXX.XX [...] DPT=3D22 [...]=0A+++=0A=0AThis problem is not presen=
t in Debian 10 (Buster) which uses nftables 0.9.0. But it is present in Deb=
ian 11 (Bullseye) which uses nftables 0.9.8. Because I even got a segmentat=
ion fault here I cannot reproduce yet, I tried it with nftables 1.0.1 - but=
 still no success.=0A=0AI don't understand how the 'nft list ruleset' outpu=
t can be identical after using 'nft -f ...'. In any case, the IPv4 addresse=
s are part of the whitelist set and are=C2=A0unexpectedly blocked.=0A=0AKin=
d Regards,=0Aetkaar

