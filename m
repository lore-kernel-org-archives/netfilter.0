From: Beep Beep <the.beep.projects@gmail.com>
Subject: Using sets across ip and netdev tables
Date: Sat, 31 Dec 2022 12:56:58 +0100
Message-ID: <CAPpv1AkO57=GCXULST-ZCzTdUG3cRkUN0KPFAwM3TvocXnvSCg@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=eSfzfN7ycgVxjUunZtueCqVWLS6KoxVU+BN96f/3bEg=;
        b=MDcUqHou0PGKgPio1RCsGLB5tzxixYD20669dognApfOv0QN8LhnQHoTceqrtrEAy0
         kLbvmXKeKnePjVO0GRRe7YSYWbE39/T5yooddBtVWzk8/F3xR28wNLpEycYPL78KtyP5
         3mhnsDkLcRbT3RRl6HhIFpi03pHa2q+9slth6+jxu6+pNkz5w37SKvWaIe9Bvlf3zEt0
         QwwZMrVdwr7dr+JgiUD8EQn4Ru6NI8aAOmkkuzWN0pNbB27c4n83rcX1ATWYYM2aoe6f
         vlsxYYQ/B0h2miaoXYaEpoB8VGLXnziUU6uhqV8dGfIducWU+rYWPIV+FFHfCgovYDSU
         pExA==
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I ran into the case, where I would need to update a set used in an ip
table with info derived in a netdev table. Is that possible?
I saw several posts in the archives about that topic and the last one
mentioned that this feature might come to nft
https://marc.info/?l=netfilter&m=160103596504378&w=2

I want to isolate my heating system from the rest of my network, but
still make it accessible for the app on smart phones within the
network.
To initialize communication, the app sends an UDP broadcast (which I
handle in the netdev table) and replies back to the sender with a
normal UDP packet. So I need to dnat that reply packet in my firewall
to the sender IP of the broadcast.

I think that is a quite often used service discovery scenario. Can
this be handled with nftables?

Thanks,
Beep
