From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Validating this is the right conntrack ruleset
Date: Tue, 7 Jun 2022 17:15:13 +0100
Message-ID: <20220607171513.b90501912e97d0e3e39a2cfe@plushkava.net>
References: <CADhidkpx+3=1aZj5OF11JR6y_g16xqV=tyx5Bn=dG_kisJwP2w@mail.gmail.com>
        <20220606163048.de7ca3450ec3048fb9c3e3ba@plushkava.net>
        <20220606165118.a91d1d2e153fba420ef18f76@plushkava.net>
        <CADhidkr_khLDNYCgAHT1dQosfz-qizKdM1vFXosNhA2YqBD4iw@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1654618515; x=
        1654704915; bh=aiiHRKaxNzL/K6UmxAuEEGq+NUml8hUQvZvoyHb6p7w=; b=n
        dMenUrEZRCD8qFX29vu/s+vhkWyhHiYpo6mejOxVc2xJZnEMUsd6EEXXIy6HFBPA
        wCq58FiHPfGcPBiVET5XDpSDnNxSE8pZ1RK2R5Yz4VWJLgk04kHEB3zLYl19qmLA
        +jh75xWegNoSxjh4zU3Es/6Nb6CJfOg8ir2PXBR8jH1DTlW3/yKAGY6PzVyckotF
        DzcvHvYoFGyYC/x+aEz26BwvPNfiGCSBYVM/RuJ8Os/XcMQ+9Syk0p2chF5mm86L
        ETr6j25XGGJ78ICmnY0Y71zVr4L7LNCGWUerudZP5Z2tZQbr8uapye/hLtaqMpEJ
        iGmdXCPN7YxHLmswK70iw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1654618515; x=
        1654704915; bh=aiiHRKaxNzL/K6UmxAuEEGq+NUml8hUQvZvoyHb6p7w=; b=U
        iN1/ZKoaAmKJIMEUVGEvRgudSEWl5AQk9gGE7ZSz8hP2EIGOEcxf2AueQTacu0LL
        QZCwPr77OBeDkpJusm0OXPhRPHgTmE/WL6vv8akmtZLPhoabCNxHEQUx9LhItFt+
        +g+m0Sy78dVCYUS5JShntC81rHNEMuUi4wy8oOLSI0la8uQq65kUo9NgTToFyBXq
        qi/sRF2C7ou0G6prCwwbyzU4dWvU+4F2jyraxFsZfIoA/dwRslaurDJG/phnKrAs
        zn6ZtZTH+Lx+UiaIv0M3X2pLXybvhJRsR3k+USpe1hdN6GvsUOtv7PdCl2qlCGL3
        NT+V3mBQCRKL3P6donxAw==
In-Reply-To: <CADhidkr_khLDNYCgAHT1dQosfz-qizKdM1vFXosNhA2YqBD4iw@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Gio <gioflux@gmail.com>
Cc: netfilter@vger.kernel.org

On Tue, 7 Jun 2022 12:08:48 -0400
Gio <gioflux@gmail.com> wrote:

> Thank you; I appreciate the help with clarity. The most important
> takeaway for me was that there are implicit return packet/replies
> rules that don't need to be in the opposite hook (output for input,
> etc).
> 
> The example was excellent to illustrate this too.
> 
> For the sake of completeness; would the 'implicit' return packet rule
> be 'ct state established,related ct direction reply' ? Example:
> 
> table inet legacy {
>     chain root_in {
>         type filter hook input priority filter; policy drop;
>         ct state established,related accept
>         iifname "lo" accept
>         meta l4proto ipv6-icmp accept
>         tcp dport 80 fib daddr type local ct state new accept
>     }
>     chain root_out {
>         type filter hook output priority filter; policy drop;
>         ct state established,related ct direction reply accept
>         iifname "lo" accept
>     }
> }

Yes, I believe it would be. Incidentally, the second rule in the root_out chain should be using oifname, rather than iifname.

-- 
Kerin Millar
