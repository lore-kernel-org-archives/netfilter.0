From: Maksim <makskr@gmail.com>
Subject: stp-flags usage
Date: Sat, 2 Jul 2016 21:15:14 +0300
Message-ID: <20160702181514.GA7300@asya>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=date:from:to:subject:message-id:mime-version:content-disposition
         :user-agent;
        bh=uiMZTGe4beBRmQdefBU0R0zVeKaWPDUr1BYW1q4uImI=;
        b=bbsvCoY4/1QEZdjtze/zz223p8XU2xdA5JOuU/6eKfI4oCZ1UyHabuIwu2aHy0NxGI
         U9jRsHQX8QbyoQGlmdX6ZTC8SUnJ/XGsrFXkiQff7wrL7EsqtjjPAjmliaFWXb9Eqail
         V0zOTiAhwNf8O22bBunljxqAX7ZzNmofn6nhuHr5+CMcOLxq2P41FiBKfcV5/O5nswUF
         Vb0eISPmvByYGebtmPZh9WGKjQk78xIqcEgWoqbSmY9W3kMW4i9z/B2oJplA4VGQNLjP
         onaNjDkVaVV8bUbeC0URGIJu8zZv7FdPsOIinj0ei/ggtm68FzSMeivfPifX+OvUnIxH
         gYkQ==
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

I have such topology (where BR1 is a Linux bridges)

                            BR1
  +--------+              +-----+          +--------+
  |        |  STP+TC      |     |          |        |
  | Cisco  |  ----->  eth1|-->X |eth2      | Cisco  |
  | Switch +--------------+     +----------+ Switch |
  |        |  ----->      | --> | ----->   |        |
  +--------+   STP        +-----+  STP     +--------+

and I want to block propagation of the config STP frames only when
its bit of topology-change (TC) is set in 1 while allowing passing
other STP frames.

If I correctly understand I shall use the following rule on BR1:

# ebtables -A FORWARD -i eth1 -d BGA --stp-flags 1 -j DROP

but it does NOT seem to work: the tcpdump output on the eth2 still
shows STP config message with the TC bit.

Moreover, even the rule counters are never change:

# ebtables -L --Ln --Lc                                    
Bridge table: filter
Bridge chain: INPUT, entries: 0, policy: ACCEPT
Bridge chain: FORWARD, entries: 1, policy: ACCEPT
1. -d BGA -i eth1 --stp-flags topology-change -j DROP , pcnt = 0 -- bcnt = 0
Bridge chain: OUTPUT, entries: 0, policy: ACCEPT

always showing pcnt = 0 -- bcnt = 0.

Could somebody point out where I am going wrong?

Thanks in advance,
Maksim.
