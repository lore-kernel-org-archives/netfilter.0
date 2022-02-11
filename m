From: Kyle Rose <krose@krose.org>
Subject: Want to match on a value from a map lookup
Date: Thu, 10 Feb 2022 19:48:42 -0500
Message-ID: <CAJU8_nWjJFYeYhuF7AzoDbeT2Kai=cEDTatPTROKCzSSCsd18Q@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=krose.org; s=google;
        h=mime-version:from:date:message-id:subject:to;
        bh=m4CCIf4bmx1RfGfk8w9AvslzisjKvaW935YtY4udpVs=;
        b=rCj+PMM8cGdq2wweRqkS0VzNo6dnuKkWi3n4wgI6J0mdqSTPZ5mKXlx9p59IxQh5t6
         CDldLO6AQVItw7HvxKPHYRK0xR0lAeV/H51VxyjJtavvByiFwZA7HglWG1cnnITVDNqg
         1GWiU+KVuO1lSm6r7HyFLu5nuOdSTIkxjXtL4=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Currently on Linux 5.15 with nft 0.9.8.

I'd like to be able to match on the value of a map lookup. For
instance, something like:

ip saddr iifname map { eth0 : 192.168.1.1, eth1 : 192.168.2.1 } ...

meaning "map the input interface to an IP address and match the result
against the source address". But if this is supported, I can't figure
out the syntax.

More complicatedly, I'd also like to be able to reference individual
elements in a value tuple. For example, I'd like to be able to do
something like:

    map iface_to_net {
        type ifname : ipv4_addr . ipv4_addr;
        elements = { eth0 : 192.168.1.1 . 255.255.255.0, eth1 :
192.168.2.1 . 255.255.255.0 }
    }
ip saddr & iifname map @iface_to_net [0] vmap { iifname map
@iface_to_net [0] &iifname map @iface_to_net [1] : accept }

That is, "accept if the source address is on the same network as the interface".

Also, is there any plan to allow for CIDR blocks to be values of their
own instead of intervals? It would be nice to be able to map keys to
CIDR blocks that can be directly used in address matching.

Thanks,
Kyle
