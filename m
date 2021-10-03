From: Kerin Millar <kfm@plushkava.net>
Subject: Re: netfilter 10,000' overview
Date: Sun, 3 Oct 2021 02:36:15 +0100
Message-ID: <20211003023615.10f438fe018df4608587aef5@plushkava.net>
References: <010901d7b70a$86c8edf0$945ac9d0$@gmx.com>
        <20211003004937.acbbc610fc32536fcdd9f736@plushkava.net>
        <015701d7b7f5$2d07dec0$87179c40$@gmx.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        KLFTWi9cKYU06vjou2Dtuew3XpOg71/fTIdTF1NmYHM=; b=m4xWtrdRidDE+EJ0
        s16B2OuicER6XGOqMBrC3LPues2ZBkhA2FJTuxG63mRdZqUTY1BKLcmdnQQ4rJMI
        g2XzFwE2dM4FRaU9T3DeqWWAZSwbtWfC4ng3e2SjFd4ND2K+RsNIDAeGcHWdwZeh
        DGlyvKUACNf+V9gAB8PIVL8/k9l+RNelipQkw3PdbTIxyZr3PH4RsU3GmyeswCPb
        CgoxOASqTxAVk0J7KC9wwcvTHIMTPkcKbU+6bwyrMRPeQdIIbESysuto+ef+Abhk
        gnUNjhi4hKq87WPaTOiujTzgL9CPcc6SuFzZ3/YuWHPOOSsAm58dWE0mztBsrJ+u
        lBSFQA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=KLFTWi9cKYU06vjou2Dtuew3XpOg71/fTIdTF1NmY
        HM=; b=eCl3JLVfsY9BF6Lk6L6N34t4inZ86F7on+7Hwd2v9vvIbTKKMieEbsrn9
        XX+LJ2UEjaELX9JcZIMfU4YiWKaX2p5PXLEBNjn1HzNkW0TiiTprHHlPQek1yWOe
        ykUwQvodCAYTZVSS1xoxEASxOxy9DPk1FS91BayjJ+L4kAIEOtSLaqvukAHCdPpQ
        Jl1HbfTuziGHiOPkz1vB7PeuuhIyfDXtM8FCbyZrKqKh2IaywuAm3z5gKJzLo8km
        wELCevydtQC7iEftdkEo6zranicadIGlz1FZ14R+HGKR6atZ/GztbJ6JMBFOxyHY
        OgS+B2iLtz6JzRsvYvmgYI6OrGt3g==
In-Reply-To: <015701d7b7f5$2d07dec0$87179c40$@gmx.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jeff <jnewman67@gmx.com>
Cc: netfilter@vger.kernel.org

(re-copying the list into CC ...)

On Sat, 2 Oct 2021 21:22:46 -0400
"Jeff" <jnewman67@gmx.com> wrote:

[...]

> Looking at the Redhat article you linked to, it appears that Fedora
> implements nftables under iptables, which I assume affect the nf_tables
> ruleset.  However, it mentions the inclusion of xtables utilities, but it
> appears those are just used to convert xtable-like rules compatible with
> nf_tables.  So it appears nf_tables  is the underlying ruleset.

Since Fedora 32, apparently.

https://fedoraproject.org/wiki/Changes/iptables-nft-default

On such a system, you may find it interesting to compare the output of "iptables-save" and "nft list ruleset".

> 
> I'll do some learning on how to make rules in nftables, and get some of my
> scripts converted over, and see how I get along.

See, also, "iptables-translate" and "iptables-restore-translate". While not perfect, they are definitely useful.

> 
> If I got anything wrong in this response, I'd appreciate knowing.
> Otherwise, I really do appreciate your time, and I'll leave you to what must
> be much more important things :)
> 
> Jeff

-- 
Kerin Millar
