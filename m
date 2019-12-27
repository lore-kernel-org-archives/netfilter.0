From: "" <kfm@plushkava.net>
Subject: Re: [nft 0.9.2] cannot get sets to work - Error: Could not process
 rule: Not supported
Date: Fri, 27 Dec 2019 20:12:10 +0000
Message-ID: <20191227201210.d6f78c7180afd569527ead9e@plushkava.net>
References: <6aa06206-7b72-c828-0090-b94d046e01cc@gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm1; bh=
        Um8j7j39Ql8QJegNRpp4w0ZXy+0f2WiIQ75hP7MPkOk=; b=Sf5c6/T8lRVdqWqT
        1eIxqDgGBNKDrzVTQkBQbRza0SebdGhrVC44SoBQlJIabJ6WMeAgIo8XFLtcJ+Le
        gZmihfdXHhZaq7GbyB1ND/+DN5ovhSkBOGb4sce5nyOWMd3nelDmGRzwgq3fe3ct
        Cjr1wLB7mfTgGslBtpAP1aBvsBWj7q0VX8ng0cYYFtFRSLVbnfY58vPyoqgVJh/Q
        jPVqfGfi97elxSLUSELx4wsBZDW8SgVJtDIctNoqTFAt4X0ST6ivKhTANfcFUnAF
        C3ERzC4mEedWMnlzf0nwBbxSg3+eOOPNaNWL3sJLmxGBtCjDpOQ96VKoyFPFc7y/
        wlhlYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm1; bh=Um8j7j39Ql8QJegNRpp4w0ZXy+0f2WiIQ75hP7MPk
        Ok=; b=Gzv/y9wwuJUqEzC+73qL7nwKJH9iy3G0j0M/uMwWlvjoZg0uDYVeG7bvv
        Yg4LqDghg7fv350zm1hKlKPnntO8fpoiAIe5A6O4w5A2/SDEobNUR0Iwalw428LU
        wXjw0HQKxRrPPL/jx3UQ2VMJCWsdilIbd2J/mtBtaabo352bEK+ilEq4oe5By8oN
        HVXs++EazLbo4M1m6J/19wN2U0qcAHg0PI066s/5ZL5YmtQBr6kBPdzbcYpRYCfr
        aTJxKEwZqTSm3JCpAD7l+cwiiuQAba5meYcINumw+lcrgH+mSVu2Uo5jblbOIunK
        AnLh8qEpAnMzNk4fPAyEFOqYKGe/Q==
In-Reply-To: <6aa06206-7b72-c828-0090-b94d046e01cc@gmx.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="utf-8"
To: netfilter@vger.kernel.org

On Fri, 27 Dec 2019 19:17:16 +0000
ѽ҉ᶬḳ℠ <vtol@gmx.net> wrote:

> kernel 4.19.91 | nftables 0.9.2 | libnftnl 1.1.4 | libxtables-nft 1.8.3
> _____
> 
> # nft flush ruleset
> # nft add table filter
> # nft add chain filter input { type filter hook input priority 0\; }
> # nft add set filter myset { type ipv4_addr\; }
> 
> produces
> 
>  > Error: Could not process rule: Not supported
> 
> Looked up 
> https://wiki.nftables.org/wiki-nftables/index.php/Troubleshooting but 
> that error is not documented. A web search did not produce any relevant 
> results either.
> 
> A bit at loss here - why would a rule processing be reported as not 
> supported whilst this being being set instead? How to get it work?
> 
> ______
> kernel NFT modules conf
> 
> CONFIG_NFT_NUMGEN=m
> CONFIG_NFT_CT=m
> CONFIG_NFT_FLOW_OFFLOAD=m
> CONFIG_NFT_COUNTER=m
> # CONFIG_NFT_CONNLIMIT is not set
> CONFIG_NFT_LOG=m
> CONFIG_NFT_LIMIT=m
> CONFIG_NFT_MASQ=m
> CONFIG_NFT_REDIR=m
> CONFIG_NFT_NAT=m
> # CONFIG_NFT_TUNNEL is not set
> CONFIG_NFT_OBJREF=m
> CONFIG_NFT_QUEUE=m
> CONFIG_NFT_QUOTA=m
> CONFIG_NFT_REJECT=m
> CONFIG_NFT_REJECT_INET=m
> CONFIG_NFT_COMPAT=m
> CONFIG_NFT_HASH=m
> CONFIG_NFT_FIB=m
> CONFIG_NFT_FIB_INET=m
> # CONFIG_NFT_SOCKET is not set
> # CONFIG_NFT_OSF is not set
> # CONFIG_NFT_TPROXY is not set
> CONFIG_NFT_DUP_NETDEV=m
> CONFIG_NFT_FWD_NETDEV=m
> # CONFIG_NFT_FIB_NETDEV is not set
> CONFIG_NFT_CHAIN_ROUTE_IPV4=m
> CONFIG_NFT_REJECT_IPV4=m
> CONFIG_NFT_DUP_IPV4=m
> CONFIG_NFT_FIB_IPV4=m
> CONFIG_NFT_CHAIN_NAT_IPV4=m
> CONFIG_NFT_MASQ_IPV4=m
> CONFIG_NFT_REDIR_IPV4=m
> CONFIG_NFT_CHAIN_ROUTE_IPV6=m
> CONFIG_NFT_CHAIN_NAT_IPV6=m
> CONFIG_NFT_MASQ_IPV6=m
> CONFIG_NFT_REDIR_IPV6=m
> CONFIG_NFT_REJECT_IPV6=m
> CONFIG_NFT_DUP_IPV6=m
> CONFIG_NFT_FIB_IPV6=m
> CONFIG_NFT_BRIDGE_REJECT=m
> # CONFIG_NFTL is not set
> # CONFIG_INFTL is not set

Check the status of CONFIG_NF_TABLES_SET.

-- 
Kerin Millar <kfm@plushkava.net>
