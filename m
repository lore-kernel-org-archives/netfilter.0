From: as Bari <rondowheel@gmail.com>
Subject: nftables: packet payload
Date: Wed, 12 Apr 2017 15:54:36 +0300
Message-ID: <CAO4UgCPuW_9XNaJ36C2p5xEAOd4nSEeMNTnhym9i_o-NvwHOHA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:from:date:message-id:subject:to;
        bh=VIt8b1e8Jc/WYA2U6qmlMasU/7Oju/2UPFR06jTlti8=;
        b=O2njPHPx13rC3eCcfTPPKFusVOrjBb5xLxqr06ZtZ0luYfHb4UzjQ5aRv7R3cfAblN
         ds/yZn6oQDhZ+0MMtNemR1lgNw715C/LfWWicAyKPT8K+zuZzdL6G+/G4Dry1WzOq5Yv
         EJaZ3m8cTxY8XRwQU2K54CiNIHP045DqByr6S6Rb4gz0lWgu2DYNn9tw3pIF50MsRJwG
         beFUbWv33JlXnCRbmenpFzf3V18e7ophP6F4ZL7FkMpCvqiVWLVZjDNWatj9p2pTwOex
         iR8OJJu1ungyz/n9tgKN0A3YVsyZ1hpTjh95P3UrGrmJWgBbvDvEXMVFPWt37BA6eH3w
         8dpQ==
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hello,

Can one currently perform actions with packet based on its *body* (not
headers) payload? E.g. discard packet which has udp[8:4] = 0xABCDEFGH,
or u32-like syntax.
Can one load raw bpf expressions (tcpdump -ddd ...)?
Or maybe one could involve instruction set to build payload inspection
rule using bit mask, but how to do this using nft?

As I've read https://wiki.nftables.org/wiki-nftables/index.php/Supported_features_compared_to_xtables
page, this stays unclear to me...
> bpf: consider native interface
> u32: raw expressions?

Thanks
