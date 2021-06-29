From: Kerin Millar <kfm@plushkava.net>
Subject: Re: Reload IPtables
Date: Tue, 29 Jun 2021 10:10:05 +0100
Message-ID: <20210629101005.925203afb065a9afa807daad@plushkava.net>
References: <08f069e3-914f-204a-dfd6-a56271ec1e55.ref@att.net>
        <08f069e3-914f-204a-dfd6-a56271ec1e55@att.net>
        <4ac5ff0d-4c6f-c963-f2c5-29154e0df24b@hajes.org>
        <6430a511-9cb0-183d-ed25-553b5835fa6a@att.net>
        <877683bf-6ea4-ca61-ba41-5347877d3216@thelounge.net>
        <d2156e5b-2be9-c0cf-7f5b-aaf8b81769f8@att.net>
        <f5314629-8a08-3b5f-cfad-53bf13483ec3@hajes.org>
        <adc28927-724f-2cdb-ca6a-ff39be8de3ba@thelounge.net>
        <96559e16-e3a6-cefd-6183-1b47f31b9345@hajes.org>
        <16b55f10-5171-590f-f9d2-209cfaa7555d@thelounge.net>
        <54e70d0a-0398-16e4-a79e-ec96a8203b22@tana.it>
        <f0daea91-4d12-1605-e6df-e7f95ba18cac@thelounge.net>
        <8395d083-022b-f6f7-b2d3-e2a83b48c48a@tana.it>
        <20210628104310.61bd287ff147a59b12e23533@plushkava.net>
        <20210628220241.64f9af54@playground>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=plushkava.net;
         h=date:from:to:cc:subject:message-id:in-reply-to:references
        :mime-version:content-type:content-transfer-encoding; s=fm3; bh=
        z4y93Lw46VeFgoH3tHbHx6wJdSjXfTHyovL2GbszPhs=; b=JVY35KkRYQVvIg55
        rz22na6td/PZNKul/LpGxjYsxWbLiST3Af59HJKvQXZ8IMZyjtEEXQBF/1eNEwJC
        u37TuyIb6pmytiQWGt7oq3xepj04ClhyzyzjYLd9cpXcg3oCUNPbUzWlHUO7YQQY
        qIKT9YoeY8LQj99elo6Is9qW93GQZro0rixpP7oTKgMssAx+q+psgXBQtGz3+jTA
        8uZL+snvBcQJULk5pEe8WrAH2cm+gUoe9H0GSQK7Ehe7rLuixGn7gAxcEehH41wW
        N6xdPzLyax32vUteJ/iilo45Y0x0XT0DfKaSrvGmoNrCc2tCyF4J839+mUWiW+Yq
        i7WVSA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
        messagingengine.com; h=cc:content-transfer-encoding:content-type
        :date:from:in-reply-to:message-id:mime-version:references
        :subject:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender
        :x-sasl-enc; s=fm3; bh=z4y93Lw46VeFgoH3tHbHx6wJdSjXfTHyovL2GbszP
        hs=; b=viUYlmZAGP/z9rqW2SEds5jhuK33uvS90yyfUgffs0blfhXR2KSLQTQpg
        kWiiv5uPRefaw0wcsk/1u1JW//LLeqXfPV2em6vHjRoZlRPuXyQvY0USMW1BNAlh
        VqbeYcD7w/inXBupoHbe4jSpKPnM56efLv9n/Wu3AXFmSpbTWEiDpWTMscpwZJCF
        O/mehUxdJ1BQlT4/r/M/IL51yt4tYTLRZ6yX9BA6vClggWboNDH/YJNQQ8D5x8En
        meAHmQ8qmXnUy66QEQ42zk6bEnuapgs+BUrDBOrF38lWoOBG0GTsjpwqBLEk920j
        l7fSK31qcqodY/npBxS8VhpDHIYhg==
In-Reply-To: <20210628220241.64f9af54@playground>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: "Neal P. Murphy" <neal.p.murphy@alum.wpi.edu>
Cc: netfilter@vger.kernel.org

On Mon, 28 Jun 2021 22:02:41 -0400
"Neal P. Murphy" <neal.p.murphy@alum.wpi.edu> wrote:

> On Mon, 28 Jun 2021 10:43:10 +0100
> Kerin Millar <kfm@plushkava.net> wrote:
> 
> > Now you benefit from atomicity (the rules will either be committed at once, in full, or not at all) and proper error handling (the exit status value of iptables-restore is meaningful and acted upon). Further, should you prefer to indent the body of the heredoc, you may write <<-EOF, though only leading tab characters will be stripped out.
> > 
> 
> [minor digression]
> 
> Is iptables-restore truly atomic in *all* cases? Some years ago, I found through experimentation that some rules were 'lost' when restoring more than 25 000 rules. If I placed a COMMIT every 20 000 rules or so, then all rules would be properly loaded. I think COMMITs break atomicity. I tested with 100k to 1M rules. I was comparing the efficiency of iptables-restore with another tool that read from STDIN; the other tool was about 5% more efficient.

I believe that you are correct on both counts; at least, as far as iptables-legacy-restore is concerned. My understanding is that iptables-nft-restore should not 'lose' rules because there is an initial parsing stage, after which it conveys the payload as a series of netlink packets to nftables, which is supposed to be immune to this issue. It would be nice to get a confirmation one way or the other from a Netfilter developer.

Until now, I had thought that iptables-nft-restore addressed the issue of committing large batches of rules but, having just conducted a quick test, it does not appear to be the case. While I wasn't able to induce either utility to partially load a ruleset, I found that both fail outright upon pushing the number of rules beyond a certain threshold within a given chain. To my surprise, that threshold appears to be lower in the case of iptables-nft-restore.

-- 
Kerin Millar
