From: "Thomas Rosenstein" <thomas.rosenstein@creamfinance.com>
Subject: Change source or destination for packets arriving locally (for Direct
 Server Return)
Date: Tue, 12 Sep 2017 08:00:43 +0200
Message-ID: <3B3CC463-CF1E-4020-83E0-5C10C065DD1A@creamfinance.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=creamfinance.com; s=google;
        h=from:to:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=swWj91MkncxWHMGIC0H5quQ3YGvpwuPWqcuwj6kU6tQ=;
        b=dig74vCIzA9cN2ex/UGgphy+rosx+gC+Qh0XP/EroGWi1p4nyIDbBW/l/ShtIJU6xC
         UI53FzQC6ISSH6jNoOjYgtpM4U/ciaKrXUJUzG+ScKPwtyoWwXlqGxv4vkJYcbTfMqtM
         F85tx0ROBNFU0xtLSADgeD8p7Z7hkvlrbmE4Y=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; format=flowed; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello,

I'm trying to setup L3 load balancing (with direct server return) which =

requires me to send back or receive packets with a certain src/dst =

address,
but for these packets the dst address is replaced on the load balancer, =

then routed and are arriving on my linux container.

I tried with mangle, filter, nat tables and ip route, tc etc. and it =

seems nothing works as expected.

I tried to match via ip rule tos 0xc (2 additional bits) but that never =

matches, and ip rule doesn't allow arbitrary values
I tried to mark the packets in iptables mangle, and apply the ip rule on =

the fwmark, also never matches
I tried to match the fwmark with tc and use the nat action, also never =

matches (counters stay 0)
I tried to use PREROUTING with DNAT, but the packet is never there =

(packet to the local system)
The IP 10.253.1.18 is configured locally on eth0
The IP 10.253.253.163 is configured locally on eth0
The GW is 10.253.1.1
The IP 10.21.13.19 is in a completly different network segment

I'd like to do the following:

Incoming Packet: DSCP 0x3 Src: 10.21.13.19 Dst 10.253.1.18 SrcPort: =

45240 DstPort: 53

Match this packet based on DSCP =3D 0x3

Rewrite this Packet before it hits anything to:

DSCP: 0x0 Src: 10.21.13.19 Dst: 10.253.253.163 SrcPort: 45240 DstPort: =

53

Expected outcome:

The kernel sees this packet, and established the connection, all return =

traffic packets should look like this:

DSCP: 0x0 Src: 10.253.253.163 Dst 10.21.13.19 SrcPort: 53 DstPort: 45240

I do not want NAT (e.g. connection tracking, and reversing of the DNAT) =

- best would be a single rule that does this.
It looks like it can be done: =

https://www.slideshare.net/jschauma/l3dsr-overcoming-layer-2-limitations-=
of-direct-server-return-load-balancing

an illustration would be this: =

https://www.draw.io/?lightbox=3D1&highlight=3D0000ff&edit=3D_blank&layers=
=3D1&nav=3D1&title=3DMasq-Async-Routing.xml#R7Zxbc5s4FMc%2FjR%2BXQTcMj7m0=
3Z3p7mQmndnmKSODbLPBiAElcfrpV4CwQSIJsYGQxp1pC0dCgH76Hx1d8AxdbLbfUpqs%2F%2=
BYBi2bQDrYzdDmD0LOJ%2FDc3PJUGAp3SsErDoDSBveE6%2FMWU0VbW%2BzBgWSOj4DwSYdI0=
%2BjyOmS8aNpqm%2FLGZbcmj5l0TumKG4dqnkWn9NwzEWlmBbe8T%2FmThaq1u7RKVsKD%2B3=
Srl97G63wyiZfGnTN7QqiyVP1vTgD%2FWTOjLDF2knIvyaLO9YFFetVW1ldd9fSZ199wpi0WX=
C7AC9UCje%2FXuWerP0Jm0AZdY0HYtgJAlC3YiWeL5IpVHq%2FwoyESZDwJoAddybWvHLxNPV=
VUKts1zr8UmkgYgD1OWhb%2Fooshgy%2FOEh7EogJHzGbmUFnoveFY2ivwCGoWrWB5HbJkX9c=
BSEUpWZ8oseCKtWUL9MF79yE8u%2F8DSsgyj6IJHPC0eBAWUuUs%2FzylSfsdqKY7vssVSppi=
1pyo0vyXb1kyqNr8xvmEifZJZVCqqWoJq%2BdjB5fljox2VtnWtCSFlo6rprnZF7%2FHJA0Ww=
naZr1D4LZLtWpzwVa77iMY2%2B7K3nsgUmeWoUxnc5nLztskChqVFj21D8rB3f5Fksos6uWBr=
Kx2WpulBWYPr0s35Sy5%2Bf6hf8x4R4Uo4gxy9N%2B%2Bf9zguq4CVEGb9PffXWULkMmq5YVb=
2lKa%2BPFzGmLKIifGj6gWOYQENgBqQKwWa7yr2p5YeZzy1JQlZPpv5vwghott5B0tq5jRzXm=
7e1c%2BWJqpTKs8Gapr7TBYuupPhEyHNtLbgQfPOs6Cpl%2BpJG8Yw9KAjM3YaCADYVVGWpC4=
ig42F5IwhoL5qbWsrzAtpr5qaeNqiAkCkg%2FF4CQicBvU1A2Gl2QQCj0QSED4WVPYbCX7PMe=
uRpEUElt6XpE3HDTccHsW2GDjZoAddD6DAfxfN5ddc31eiBmM4PvpfzM8Pzjnry%2BSYp3N8t=
jYPbRNZXsmYpjTIroknZhj%2BJrIDuDU1VeS3xuNMDPUBGjyfsSUoKVIP4KQQU1cOcIorOg1q=
7qSHkeaNFFABNUENaTG557jgyahnYvp%2BMTiPbIwNz5LnjyWicAO8YGYFxNOSYGqqa8juIyO=
k%2FwEv8zyspUq08vCKpeQ9DJuC%2Bzo7FwVm%2BHpG%2FdkSzLNTYaDiWrs%2F81jnqhUsws=
V%2BqtFcbb61KSEvAW9k6t3F1h6t8%2Br4ebmvxtj6xXYpRXQVrSxNaQUbgrhdUKtgoqMC2e%=
2B1uJL3eSTIQENYqLM%2BZI%2Bp8AJLQI00AGB1GEtuvFNQfyWpdrU9NLpnTrslg7i3sj6BJo=
s8IOt5hJPWCdlNUA5DsEF7WSMY8Zk2MmXwWYYIuzF%2FDaBe7xIE6a%2BkepYbdALexd%2BEC=
OR9BxRhryPTZwq7s9ZVNo6Ae2XeY8z%2Bxf509ghoy51D2WkHIHY59hyWEV9g%2F56b7aBW73=
mDy7PXBpo6sc%2B%2BtO5CO7GVF06daNrXNo%2FMDV%2FfZN6WyxIMbVoe59DeGBr%2BBiyC6=
ssGBzcQoyBvORXQYNJ9IYgL7IYk9OBjJef8kj9jmNRGSeK4DONR16wXp%2FX%2BPJPufDPkdS=
Lp9dcJ6QfZwJPufDPkdSKImAHCoJpE%2BrTVcP1k98onkS1Iydt4eqkk4nCYR7J3kcrmEz0xr=
OQuHfISIB8x70iQYUZPm1MblP2c%2FDJqT2TZ%2FzPRn93UcoqNE5p7FtpYE7ecbTecNpuZwY=
v8NhAct4LiWbcEXvoDQvpSYLMojVpfest%2BqibLykmN8AIHM8cT1pNV1zDJRdyQy6GiqyzaZ=
DKYuc2CwU5f25dBH19dIMF3cgOmNqS9zbPB2mDIDQcXfKX8u9k79HjH3LwxGE5vjgxPNPj%2F=
%2BG1Wb2NzWOu3I8pg51ze4S%2BI0mKC5ueluqL4Pm8O2QwU2t8wR3ycjCTyNJDZJDqcuc1ly=
2pHlOJ87Y23kjD2z%2FxpMXea4LUweMhpsTDmZloylD2G%2BKbSlF2vLy9KsyKunTVKffajNb=
aoNE2CqDbeg7WNrJTbHcX9dTdgf9hEJYq9R3wSZSmr7TqkXJZljtGmHDsdMXr4hdLCbSHab6M=
dwbi%2BMtLr%2BMEdj8upzo9Sc2W7H%2FxihAzGHWdeq85E3o3EQyQqSh2LNitf071i5T2Yiw=
HoJE5pzFsQzlbSbzT9SSvJ0%2F%2Fs55Qz9%2FjeK0Jf%2FAQ%3D%3D

It's just missing the DSCP part.

BR
Thomas Rosenstein
