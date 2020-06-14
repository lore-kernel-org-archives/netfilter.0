From: "" <kfm@plushkava.net>
Subject: Re: nftables drops related traffic
Date: Sun, 14 Jun 2020 02:17:48 +0100
Message-ID: <673e1c37-f74f-717f-ced8-814eb6acb543@plushkava.net>
References: <4baae47f34b92314090a0cda3b7b50bb3f253b8d.camel@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=subject:to:references:from:message-id:date:mime-version
        :in-reply-to:content-type:content-transfer-encoding; s=fm2; bh=W
        2FoFQG3O4cn0iWcQXCjlLQni4ssWvDAduE5PyG7qM8=; b=vyxshhC6nTB1O29/1
        2Zgnz+gb0J1pguFagHxJWTdbH0Y7KFKBcb0CA+5r6RAZa233eB3WrdomE3zUsc42
        shpWeAGSs/Duqiki7coCYj1vU4r2w+U6wUwNHT1c+5BLpgpOwbEQRcGYNO8gQE0r
        15tz4olCj5IDDyP2mgN0AWOV6htL1BHTN0QtBzCc1XKbcj6mXIhh8vMivL3eu/QN
        1HNxry/4tgTQgxEa0Dgl/Oinz/ih/cksBy3VLNRS22qD21LMwyLRqtoFOrSmJUpJ
        xO4OE3sc62YPmvofqV67kO4+gsseJq1gfqNd1RerxFZ7nDvvLrXMVXIcSDoFADoZ
        gIrHQ==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=W2FoFQG3O4cn0iWcQXCjlLQni4ssWvDAduE5PyG7q
        M8=; b=aMg3lPA0azjbcVGvA5zGDYGb5895MFJX0ihfUxhOOXiQ0KkzSMlRZ2aIt
        s8Y4bcsANwPSzwomTy3TJYZrNVjm7ZPdOCci8b5ip0K5Vm6hrFHYuUjJ+bQk/VGe
        GVxv3F87M/pPfpkyfWF/qsVvMRkpaZLBLDj0brRil+mKSSixC0meav/7vU43+S6u
        jg3ZuCHjHPVqC0Kcsog/JEg9DUScwsb0qvnlAlDZN4bgH9VZ/GXfBphc5eybhH/q
        0Pd1RS6eL3I1W8cQVE35B7DjGKjkgXCdE52cyPpcgjtjqJS5C9sjvXP9+eFDfXwK
        BEhizurp4oopF+6OL+/cPOpy6HewQ==
In-Reply-To: <4baae47f34b92314090a0cda3b7b50bb3f253b8d.camel@gmail.com>
Content-Language: en-GB
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Robin Kuiper <kuiper.robin@gmail.com>, netfilter@vger.kernel.org

On 13/06/2020 22:21, Robin Kuiper wrote:
> Hi,
> 
> I'm running into an issue where nftables drops all related traffic,
> even if it should accept it.
> 
> When using, for example, an [archwiki example nftables ruleset][1] it
> contains the line `ct state established,related accept`. This is
> supposed to accept related and established traffic.
> 
> Established works: otherwise, I wouldn't be able to browse the web!
> Related however, doesn't appear to work.
> 
> My proof is my TFTP server: if you [look at the protocol][2], its a
> simple example of related traffic. However, it only works when my

It's not so simple. Note that the TFTP reply packet "[...] is sent from 
a randomly allocated ephemeral port, and all future packets to host S 
should be directed to this port." This is sufficient to defeat the 
rudimentary connection tracking that Netfilter implements for UDP, which 
is, after all, a stateless protocol.

If you want to be able to rely exclusively on the related ct_state to 
allow such packets to pass, check that your kernel has 
CONFIG_NF_CONNTRACK_TFTP enabled. It's usually enabled as a loadable 
kernel module so, if you are able to "modprobe nf_conntrack_tftp" and 
observe that the module is listed by "lsmod", you should be in good 
standing.

The other thing you should know is that nftables has a specific syntax 
to register connection tracking helpers and to attach them to a given 
rule. The man page contains an example for FTP, which should be 
straightforward to adapt:

https://git.netfilter.org/nftables/tree/doc/stateful-objects.txt#n29

The alternative course of action would be define a rule that allows all 
inbound UDP traffic from the TFTP server in question, perhaps within the 
bounds of the supported port range.

> firewall is disabled. TCPdumping the server shows that my server sends
> the data packet, but never receives an ACK. ([wiki example][2] image
> R2/R3)
> 
> Any help would be greatly appreciated!
> 
> 
>    [1]: https://wiki.archlinux.org/index.php/Nftables#Workstation
>    [2]:
> https://en.wikipedia.org/wiki/Trivial_File_Transfer_Protocol#Details
> 

-- 
Kerin Millar
