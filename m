From: Matt Zagrabelny <mzagrabe@d.umn.edu>
Subject: set of sets
Date: Thu, 19 May 2022 16:40:10 -0500
Message-ID: <CAOLfK3VDFFCfTdNSCtHFTs_wU5a8o9gB+=GvACF6nMTv6Tx_eQ@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Filter: OpenDKIM Filter v2.11.0 mta-p5.oit.umn.edu 4L43Dk1Dwgz9vgQd
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=d.umn.edu; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=TueOz4cTgct9MFZNJRIwlMrRBawTmswQxfJlmUoB+dA=;
        b=hgZVvRhHUZgwG+q3Yt70IhjUB361GI8DMJQ+YYHhDIofVAYelnhGaR8/qHz2pnqAZI
         rkNjsFWlmMQWWViK4C9dhCXpIVg/C2BojJ/3kz04pp/Q9Z5eK7PqRwuIUbHecvRULi0U
         m2rovCXlpdFyFC9L/8MniSApvl7KQq+8B+PKgi4GhG2Eso6M49v7AIBZv00SV2qKc/3G
         +HoTPYldGaMgOiHZsTLjhGMyDN394QHo7IXKYLC0qYCZwP4FuhQekW1M280RPP0xZ9Sl
         W/5EyrSr+K1CZKM+D1FGX9sTNOOefztTsBcv2zEhGVZ6AcrPxuOSPZWOPlzZ/cCeQQcv
         SQtA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter <netfilter@vger.kernel.org>

Greetings netfilter,

I'm running nftables 1.0.2.

I have some timeout sets:

table inet filter {
        set timed_web_allow_set_0_ipv4 {
                type ipv4_addr
                timeout 30m
        }

        set timed_web_allow_set_1_ipv4 {
                type ipv4_addr
                timeout 4h
        }
[...]

I'd like to be able to reference the sets in one rule:

        chain timed_web_allow_ipv4 {
                ip saddr { @timed_web_allow_set_0_ipv4,
@timed_web_allow_set_1_ipv4 } accept
        }

...but this doesn't seem possible.

Any suggestions on how to achieve sets of sets in nftables?

Thanks for the help!

-m
