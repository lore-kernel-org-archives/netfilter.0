From: =?UTF-8?Q?Fejes_J=C3=B3zsef?= <jozsef.fejes@gmail.com>
Subject: nftables & special case traffic
Date: Mon, 14 Jul 2014 13:55:06 +0200
Message-ID: <CALU-w9-d=Xub9=pjUjJucGCq=wjM-prUrPRLREgQOyZYf+r+Ow@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:date:message-id:subject:from:to:content-type;
        bh=x7LwriuD4MoOuMRzNMFC0CtKTIab7JnIxg88mNTOG2M=;
        b=UDlgyaDgFROKKzhMMr9CNfqsdMTNKHy/4Eu/tz/v8sgAlo6fWPBUb3Idpn4vCW+E2n
         hcwM5qi12PxzHAU2Co1cfuiXAHKgKp754Ga4hhpZDs1aIEXHfCkBZizFAc589xVas8ue
         QU2ZdezWs9/XkjwgQGaJo5AljF/1N2D7S+2sgEdJ1UVfv3xVLKxteSrF6NfDlv4x5RSo
         7TYC51Ug+V3hZr65CMi0C2Afw962c+nPRaFeCrnOC150TZaZTt/g48w+/hnm59ORGBNx
         WFFlMHcyu+qzFpN+9syijmWqNVj+HbKALDxZBA3H6nPAxfljRH+kEaaQdQhxV5N3LoUK
         YK2w==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi,

I'm still new to nftables and couldn't find some answers in the
current docs regarding some special cases.

Where do packets go that are neither IPv4 nor IPv6? (Which tables/hooks)

How does bridge filtering work exactly, I mean what's the packet flow?
If an IPv4 packet comes in from a bridge interface, and also leaves
through another port of the same bridge, will I see that packet in the
IPv4/6 table's forward chain? What if the packet comes in from a
bridge, and is delivered locally or leaves through another interface?
(There was a kernel option for iptables called
CONFIG_BRIDGE_NETFILTER, it was clear to me and it made bridging
something that I never cared about before, because I simply saw all
bridge traffic in the forward chain.)

I also see some inconsistencies. The wiki mentions that the table
types refer to layer 3 protocols, but bridging is layer 2 I think. The
wiki also mentions that there is an ARP table type, and I'd love to
see a sample of that in the source code (files/nftables/ directory
already contains bridge, inet, ip and ip6 samples). I do appreciate
the flexibility of nftables, but mixing all this L2/L3 stuff is a bit
confusing, sorry for my stupid questions.

Please CC me, I'm not on the list.

Thanks, Jozsef
