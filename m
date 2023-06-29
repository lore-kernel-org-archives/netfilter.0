From: Kerin Millar <kfm@plushkava.net>
Subject: Re: iptables debian 11 package
Date: Thu, 29 Jun 2023 03:01:01 +0100
Message-ID: <20230629030101.5604047cf209ba2fb817ec97@plushkava.net>
References: <CAOBAZ9C9s5Ko6YHzSqY7hUW2WHnA4zkZWu4pvD=o=4OCV1wTaQ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=cc:cc:content-transfer-encoding:content-type:content-type
        :date:date:from:from:in-reply-to:in-reply-to:message-id
        :mime-version:references:reply-to:sender:subject:subject:to:to;
         s=fm3; t=1688004068; x=1688090468; bh=Et6qMCm1NH7SjRvQm1WJ3EZhs
        BBeHQL2o83Q4Vt1KPE=; b=2ZyOXG+bwx5bm3w6QEsza4M0/4fYvva+NhTIDpa1p
        Stv4a+P9weKUjnRBkV354cT5DmNofO9Byk/wP6Ko+mqmi16J20vz/UJYmJNFK1Te
        BJxIZ1cJCnv1y+T5Wq4IEUOLI7aIWWwu+AsM/vuojiarfiunL5fualyJseqkT/nj
        NWhjcWwnl7YUrwvAAIbe6Hojizrpw4tFxjfmFUeFVTl70lr++jq5eulMVBAjBvCR
        D+W2xEPR1TrHhp8K5qYFEYnS8zZ35CNsmsQbAJuqtyrLL8qBfbd9dZ6D90t2rD6w
        LcRYxhnbhx6+D3Om7mvH9QPqu2lXiym5w92e/byQoub8A==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:cc:content-transfer-encoding
        :content-type:content-type:date:date:feedback-id:feedback-id
        :from:from:in-reply-to:in-reply-to:message-id:mime-version
        :references:reply-to:sender:subject:subject:to:to:x-me-proxy
        :x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
        1688004068; x=1688090468; bh=Et6qMCm1NH7SjRvQm1WJ3EZhsBBeHQL2o83
        Q4Vt1KPE=; b=oTEbQePVADvGjAQq337bw1eTXvhCjQ3rd+iXrINdoNcMTMGoxgp
        8YAi2VhplDf5++9elk9O7TXzKPzl4GPktM+G+2riNBnCR5m26jsuyNJNTHAvH3y5
        QPOR1D2VtPmP8PTLPDP8n/hsUipP9FzvQN8BjHFzGUbYlB3mkj7S4BsOsJimxVR5
        fx8sLJjDDtToQzUAmzWXh3cqcknSeXoIta40PR67Ml+K6h6Y/LmKwbi4Cv1LeU1/
        EU+DI8h/3dMffM1eE/6VVnoCrGXOuK35DTDzcB24zUMkGWpWmCoRe5z10WeMTDEW
        Aw5OXbOpLgCO4gDn0hUhKiF3ByRhJOKbRxw==
In-Reply-To: <CAOBAZ9C9s5Ko6YHzSqY7hUW2WHnA4zkZWu4pvD=o=4OCV1wTaQ@mail.gmail.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Matthew Ellquist <mellqui@d.umn.edu>
Cc: NFTables Mailing List <netfilter@vger.kernel.org>

On Wed, 28 Jun 2023 20:29:44 -0500
Matthew Ellquist <mellqui@d.umn.edu> wrote:

> Not sure why these packages are behaving differently -- I can't seem
> to figure it out. Maybe someone here can help.
> 
> https://i.imgur.com/U2nN6QQ.png

The diagnostic message indicating that the 'filter' table is incompatible tells you at least three things.

Firstly, that the instance of iptables(8) that you have is of the variety that uses the nftables backend, rather than the traditional xtables backend.

Secondly, that an "ip filter" table has been loaded already, probably directly by nft(8). Running "nft list ruleset" will show it.

Thirdly, that the _present_ contents of this table are intrinsically incompatible with the use of iptables(8) in conjunction with the nftables backend (see https://www.redhat.com/en/blog/using-iptables-nft-hybrid-linux-firewall). It is for this reason that iptables(8) aborts and tells you that you should be using nft(8) instead.

Essentially, you need to commit to exclusively using either of nft(8) or iptables(8) to manage your ruleset, rather than attempt to use both at the same time (whether it was by accident or not). Simply installing and uninstalling packages won't flush the currently loaded ruleset and, therefore, won't address this issue.

-- 
Kerin Millar
