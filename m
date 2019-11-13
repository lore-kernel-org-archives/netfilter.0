From: Alessandro Vesely <vesely@tana.it>
Subject: Upgrading libnetfilter_queue to use nftables
Date: Wed, 13 Nov 2019 18:41:37 +0100
Message-ID: <28ab2afb-a16a-14ae-e511-aa4e641c1f24@tana.it>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=tana.it; s=delta;
        t=1573666897; bh=eWcUpU432nXr+v+RlBI9XKI4KgQL0ytwftw/gX8JXUM=;
        l=816; h=To:From:Date;
        b=Cz4ZlpslNg+SZUXEB8KhbeIOExAkcbF6GBDrlZ+ZeB5hICMqE+DeIGDUgiexHZ5T6
         baBhekBTXV02d29ugywiikHKvT/805EtO4zJLfOPeXu7Wjq7lfvufWJ9Re9h4rfk3k
         +BrNsWhAcM46agq0/4DfTwH+4iESVh/63py0OAfNpb8yIABxNfg/PBLJDrPe1
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter <netfilter@vger.kernel.org>

Hi all,

I'm using Debian 9 (stretch) and saw that the current version (Debian 10, buster) transparently installs nftables instead of iptables, offering to switch back by setting alternatives.

I'm worried how smoothly an upgrade would go.  I have calls similar to these:


iptables -A INPUT -j NFQUEUE

or

iptables -t raw -A OUTPUT -p tcp ! --syn -j NFQUEUE --queue-num 2
iptables -A OUTPUT -p tcp ! --syn -m mark --mark 4 -j REJECT --reject-with tcp-reset


There is a user space filter reading queued packets and issuing verdicts.  It is linked to libnetfilter_queue, libnfnetlink and libmnl.

Does automatic translation work fine in this case?

Do I have (better) to relink, recompile, and/or rewrite the user space packet filter in order to use nftable?  How simple is that?


TIA
Ale
-- 



















