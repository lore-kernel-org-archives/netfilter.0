From: "C. L. Martinez" <carlopmart@gmail.com>
Subject: Re: tc redirecting vpn traffic, ifb0 output not readable?
Date: Thu, 19 Sep 2013 11:05:33 +0000
Message-ID: <CAEjQA5Kd9W5MCXTwXH1XKDMmFy-sQzXw8JXbdxUqymKAmkX0sA@mail.gmail.com>
References: <52361F9D.30506@yahoo.de>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=UaCSpgz4qQjicNnNNfUW+HA1irfA3IAYFmOBatscgdo=;
        b=a0t0/z4Mv5YM4XR+ZIYFNo4ElnoRz14aPdUNlOWnUhLi47kHRa3uFMOZz+vHJ6yYs/
         nR6zFhc8BBzPv1iLUoN1smXLSRDYD2NFwNKH56UjKlVCYbnJNZla2mf42wZANVOYX+v5
         Ur2Wo9hEJuJU0oBRT4ImNsSPN1FjFHjqCUhHJhjRiZZHFZEwd0auYXf6Pzgy04rrN2TS
         roxeuBZz+Lvkwmy/oqv/orltiRffhQRkZCkCkfxvrmi7GRqQbrRMGBWU8m0hLAsRgBuB
         r6E9XV5n0bihGhWQHF4qY0oa+iChCaqioJsXFd6wl6nnhZ+VArHN85pWtzTIUMBkhmjz
         NJQg==
In-Reply-To: <52361F9D.30506@yahoo.de>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Sun, Sep 15, 2013 at 8:59 PM, james <commercials24@yahoo.de> wrote:
> hi,
>
> when i use these commands to redirect the output from tun0 to ifb0:
>
>  dev=tun0; indev=ifb0;
> tc qdisc add dev $dev handle ffff: ingress
> tc filter add dev $dev parent ffff: protocol ip prio 1 u32 match u32 0 0
> action \
> mirred egress redirect dev $indev
>
> i get this tcpdump output:
> tcpdump -i ifb0
> tcpdump: WARNING: ifb0: no IPv4 address assigned
>
> listening on ifb0, link-type EN10MB (Ethernet), capture size 65535 bytes
> 22:44:38.333033 00:00:40:01:43:58 (oui Unknown) > 45:00:00:54:23:22 (oui
> Unknown), ethertype Unknown (0x0a08), length 84:
>     0x0000:  000a 0a08 0016 0000 2e57 39db 0009 361c .........W9...6.
>     0x0010:  3652 3c53 0400 0809 0a0b 0c0d 0e0f 1011 6R<S............
>     0x0020:  1213 1415 1617 1819 1a1b 1c1d 1e1f 2021 ...............!
>     0x0030:  2223 2425 2627 2829 2a2b 2c2d 2e2f 3031 "#$%&'()*+,-./01
>     0x0040:  3233 3435 3637                           234567
> 22:44:39.333253 00:00:40:01:43:57 (oui Unknown) > 45:00:00:54:23:23 (oui
> Unknown), ethertype Unknown (0x0a08), length 84:
>     0x0000:  000a 0a08 0016 0000 3e52 39db 000a 371c ........>R9...7.
>     0x0010:  3652 2b57 0400 0809 0a0b 0c0d 0e0f 1011 6R+W............
>     0x0020:  1213 1415 1617 1819 1a1b 1c1d 1e1f 2021 ...............!
>     0x0030:  2223 2425 2627 2829 2a2b 2c2d 2e2f 3031 "#$%&'()*+,-./01
>     0x0040:  3233 3435 3637                           234567
>
> why dont i get the icmp packets that went into the openvpn tunnel?
> and what do i get instead?
>
> the target is to manage all incoming traffic, but if use eth0 (the real
> physical device) as root
> all that goes over the vpn connection is already encrypted and encapsulated
> by openvpn.
> so its all one big blob with dst port 1194.
>
> is there a better way to manage the traffic that goes to the internet and
> the one that goes trough a vpn at one bottleneck?
> --

Can you try "protocol all" instead of "protocol ip"??
