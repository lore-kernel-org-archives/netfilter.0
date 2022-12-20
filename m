From: Kerin Millar <kfm@plushkava.net>
Subject: Re: nf_conntrack_helper replacement?
Date: Tue, 20 Dec 2022 20:23:53 +0000
Message-ID: <20221220202353.6931dae178b54a3ece13b06f@plushkava.net>
References: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:date:date:from
        :from:in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to; s=fm3; t=1671567836; x=
        1671654236; bh=PSl8ZH5YaW/bXFSSdYYOU7YKD47/X7O7aUdx6Dwm55c=; b=A
        jucIAjwiom7sxHkqoQXu+d0mwTrxMhsG+e+As8f0EdQEFThGWYZbwJ7M7+MuVOsM
        Cm76km/GCkmYbwJs8akvMunJWDwUrXojPvWlDvwzPPjp8YSes4dI4RYWPgEYNB9/
        66M9bgLYV6avY2jO28+QgWX0VIxufSRQDwoBkEylMB+u6bggLqjtXK+JhkMbbAbD
        J9EXkRtZRPflD3gUICi/SmbBw4gUitQQxYdC5zNnb1sRgiPbbXBg/yItTMnpksCT
        ZH7L0X9iVUqPkLo7q1PCvfWW+txrnhkkw0cNZnEaGJFiXHHm3ZrVzSdJxJvAm/po
        Mg4uCSJQ+VQi+SqFDEncg==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:date:date:feedback-id:feedback-id:from:from
        :in-reply-to:in-reply-to:message-id:mime-version:references
        :reply-to:sender:subject:subject:to:to:x-me-proxy:x-me-proxy
        :x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=1671567836; x=
        1671654236; bh=PSl8ZH5YaW/bXFSSdYYOU7YKD47/X7O7aUdx6Dwm55c=; b=s
        O6j513bwNUsqVQgEkOb+q3kJCTOrm4uiw1wqktwJlbJGUZ2rmwNgSlUg7hKYN/rU
        XfPyVqggb0n4VI/nUixncykSCHCKdtc9xdSAgJGV+QQRIg5zrUq0Wv7pP7Frsg+g
        /xq8HtlZTFVJ33AnyC8NXy8r6K+DGG3BOschWxvyN3FESjmBnnzHITn/uGGzhKt1
        yK98644nDPRWC9pYonOmqmHfO4Xat3B9roVihcpL6JwMo3KIK1hWBGaxeookRsbM
        f8RDMCfOTN7R9u68T1TwSpAFJ7h1LHyJcDh3UbijlmKdOOL8AJN2suM/RKP0dl8e
        l35oXY7juF6gjpijMqIiQ==
In-Reply-To: <518aeae6-e89b-62f0-0a5b-86264a51edde@zoho.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: ToddAndMargo <ToddAndMargo@zoho.com>
Cc: netfilter@vger.kernel.org

On Tue, 20 Dec 2022 11:00:43 -0800
ToddAndMargo <ToddAndMargo@zoho.com> wrote:

> Hi All,
> 
> $ uname -r
> 6.0.12-300.fc37.x86_64
> 
> Since kernel 6.0.1,

Since 6.0-rc4.

>     /proc/sys/net/netfilter/nf_conntrack_helper
> has been removed.
> 
> This breaks passive ftp.

Specifically, it removes automatic conntrack helper assignment, which was a security hazard.

> 
> What do you guys do to work around the problem?

You should assign the desired conntrack helper as a part of your ruleset. For example, "-t raw -A OUTPUT -p tcp --dport 21 -j CT --helper ftp". Or, "-A PREROUTING" if running an FTP server. The CT module is described by iptables-extensions(8) and, if needs be, you may refer to iptables(8) for the distinction between the OUTPUT and PREROUTING chains.

Should you decide to use nft(8) at some point in the future, see https://wiki.nftables.org/wiki-nftables/index.php/Conntrack_helpers.

-- 
Kerin Millar
