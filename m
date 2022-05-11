From: Harald Albrecht <Harald.Albrecht@gmx.net>
Subject: target and match expression "info" payload decoding in nftables
 expressions in netlink messages
Date: Wed, 11 May 2022 11:06:11 +0200
Message-ID: <trinity-5a882525-2c22-4736-9922-70d644b06637-1652259971531@3c-app-gmx-bap35>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gmx.net;
        s=badeba3b8450; t=1652259971;
        bh=UiLZ7zwjZOfqX+tA43PK9NxatWZACk9BulueAdPEsWw=;
        h=X-UI-Sender-Class:From:To:Subject:Date;
        b=VvEALDUye02w0BivLmGfY3nHhSSweDngPtbXOpe64OlXJviNructcc5IHCeJCEv8n
         4f9Y6N+FlEXRrYd/cGiydolM4XIvzQmDZix4ThYsJhrFTfVxG4rRCgK54BgHglkRu/
         2XOzRgy+9fURLF1eZ1E07DGoqbB8f3OCuY2BNaos=
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

As I'm new to netfilter lists (as well as nftables), so if this should be the wrong mailing list to ask in then please kindly redirect me to the correct mailing list.

What I want to achieve: in a pure Go program I want to load existing chain rules and automatically reason on them. In particular, I want to find Docker engine-managed port forwarding rules. As it happens, Docker (as, AFAIK, are Kubernetes and many CNI plugins) hasn't migrated to nftables. However, thanks to the compatibility layer, Docker-managed chains and rules do show up when querying nftables via netlink.

While there is an old and seemingly unmaintained Go module for communicating with nftables via libnftnl I couldn't get this to work on a recent Ubuntu 21.10 installation, even after investing some time trying to find the cause (which I didn't manage to find after all). Now I'm using Google's https://github.com/google/nftables Go module which is a pure Go implementation that doesn't make use of any nftables-related C libraries.

After adding support for Match and Target expressions to the google/nftables Go module (destined for an upstream PR) I can see that due to the compatibility layer which concrete Match and Target expressions are used, at least on the byte content level -- this is already more than "nft --debug all" tells me, as it doesn't show the Target and Match Info fields. For instance, I see this:

expr.Match{Name:"tcp", Rev:0x0, Info:[]uint8{0x0, 0x0, 0xff, 0xff, 0x1, 0xc0, 0x1, 0xc0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0, 0x0}}

After some orientation I managed to find a struct xt_tcp (https://elixir.bootlin.com/linux/latest/source/include/uapi/linux/netfilter/xt_tcpudp.h#L8) that seems to be related to the Match.Info payload at least "somehow". What I do not understand: the size of the Info field byte array differs from what I naively would expect for the struct xt_tcp, under the assumption that the __u8 fields are getting tightly packed after the two __u16 source and destination port ranges.

Am I wrong here on my assumptions of __u8 packing?

Or is there more information encoded in Match (and Target) Info byte fields than just the "meat" such as struct xt_tcp?

Any help on shedding light on this is highly appreciated as after a few hours of sniffing around in the sources I yet can't piece things together so far as to properly decode the Info fields.

With best regards,
Harald

