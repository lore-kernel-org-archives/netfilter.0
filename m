From: Pascal Hambourg <pascal@plouf.fr.eu.org>
Subject: Re: packet flow for connections to 127.0.0.0/8 network
Date: Tue, 23 Aug 2016 10:40:46 +0200
Message-ID: <b09a1493-f808-21d1-a30d-c655589d009b@plouf.fr.eu.org>
References: <CAJx5YvHu0+U-_zK4DNoTGJ_7FZVf3tBiJeunwg+VBDouB7pttg@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <CAJx5YvHu0+U-_zK4DNoTGJ_7FZVf3tBiJeunwg+VBDouB7pttg@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
To: Martin T <m4rtntns@gmail.com>
Cc: netfilter@vger.kernel.org

Le 23/08/2016 à 09:13, Martin T a écrit :
>
> # iptables -n -v -L INPUT --line-numbers
> Chain INPUT (policy DROP 21 packets, 1683 bytes)
> num   pkts bytes target     prot opt in     out     source
>   destination
> 1        4   336 ACCEPT     all  --  *      *       0.0.0.0/0
>   0.0.0.0/0            ctstate RELATED,ESTABLISHED

The output of iptables-save would be more readable (IMO).

> As seen above, I don't explicitly allow connections to 127/8
> network(-A INPUT -i lo -j ACCEPT)

127.0.0.0/8 is not the same as lo. It is actually more restrictive, 
because lo sees the locally generated traffic sent to any local address, 
not only 127.0.0.0/8.

> and thus while I receive for example
> ICMP "echo reply" messages from 8.8.8.8, I don't receive replies if I
> ping 127.0.0.1(configured to lo interface) or 10.10.10.1(configured to
> physical eth0 interface). How does a day in the life of a packet look
> like when it does not leave the machine?

On a usual interface connected to the outside world, outgoing packets go 
through the OUTPUT chain and incoming packets go through the INPUT chain.

local process --> OUTPUT --> eth0 --> outside world
outside world --> eth0 --> INPUT --> local process

However each packet sent over the loopback interfaces is both sent and 
received thus goes through and must be accepted by both chains OUTPUT 
and INPUT.

local process --> OUTPUT --> lo --> INPUT --> local process

This also applies to the initial packet in the state NEW that your rule 
does not allow.
