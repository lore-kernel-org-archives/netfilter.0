From: Paulo Ricardo Bruck <paulobruck1@gmail.com>
Subject: nftables with dinamic ip6
Date: Wed, 6 Jan 2021 10:38:07 -0300
Message-ID: <CANSGRxQ_YcJfDsHVOdyfzqWWTgiJT7ET=S+aqT=G6sB0b7PhRw@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=KGDRakaoFOKobgr4WFTkH/Z8534ICh/z7F/pSIlGDjI=;
        b=CIGV1tFgGvTvUuBwtYZq/OiuqnNVS12NrNSCUnz7riN41dKoovSHTQyUnV3j8ESM06
         bLnmbj18KuoiFZnMoL1CpMY9t5J8juAXTwDQx9foj3rBnbP5uwGoyab+OYoGXmQuTHg/
         xEG/SMnHFh+TtT9b/bLhPSFe15+AJuSXFC1h3P1zh43hQMZkJpZm5CPpgFm6lj6JYM2A
         msKvrDudlkoWd8n9GLLPLq8W35i03+k0AkkeLU1je0wsGcx/Kwat03D4mFZX41U0nbjb
         8AwluOZMvGRLEhzTGyMbCGiaq6mSWKZAyzJTmMS0HpcBXs4wy8rJQPxRDQVlbJJyHpM0
         IvHg==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi

I have been using nftables since last year and it is really a great
software. Thanks guys 8)

Now I'm trying to use with ipv6. For this I use all my rules with inet
to get my day by day easier.

The majority of firewalls that I made are with 2 wans in loadbalance +
1 lan + 1 ethernet as DMZ. + openvpn.

With IPv6 with /48 its is easier. My problem starts with dynamic ipv6
from my provider..8( * yes I know that they should give me  a /56, but
it is how they push me to accept a PL with /48 fixed ipv6, but is not
cheap....

I read a lot of articles about it and the majority of them telling to
use a linux +openwrt to solve it  ( not my case as I'm using linux(
Ubuntu 20.04)  as firewall and router and I intend to continue using
it 80)))).

I am thinking about 2 possibilities

1) Let transform all my ethernet into 1 bridge .

Cons:
a) in that case I'll not be able to use iifname/oifname.
b) not will be using loadbalance as I used : ethernet to test links.(
but I can user/imagine another method to test )
c) not sure if I'll be facing other problems.


2) Use ipv6 with ULA ( FC00::/7)

Cons:
a) I'll have to use NAT but I really would't like to use it for IPv6...80)))


It there any other possibility?

thanks in advanced
