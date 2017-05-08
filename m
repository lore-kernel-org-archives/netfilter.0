From: Vladimir Lebedev <zeronineseven@gmail.com>
Subject: Fwd: Accept nftables statement doesn't prevent lower priority chains
 for same hook from execution
Date: Mon, 8 May 2017 17:43:42 +0300
Message-ID: <CAPQ8kBUwz1QJoT-w9yAmng8BxKikQ1LJP4mMv1fWBYzG0qHQbg@mail.gmail.com>
References: <CAPQ8kBXK1m6tJWYaqsmUTTDzov8ey2ZaMmMKe3nX-FLGw-PYeA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to;
        bh=vV0G6NAXPeFYHbCs+rr7WuLMW2fXULnLVsOlldbU+38=;
        b=fq7NnsREKa1ZbN8GHHaBc3i7BWJBhZh2R95osOgkrXXU6dIyukHsBKRaIskTUJVPaQ
         zu96HzFSKQSCoaIsf+sgcCQFiyyO4Mxw3kh/B1wlrVSTMlQ2G9dVa2Efni5XxAc4sHoC
         vDPWkTTbTnJ73VuVuEq44Y4pC1I2uZqQAi5lgfVo5vK0Qh44f8DzXSK1DynqovufiLYJ
         26sgp6VUOf0ORi5nxlhJIDm7UaSplg5n8Ugk9J4DhUIuzv2R4kX39oB48a0qCtM84btk
         BH7hELpnqLNFHUhxyo6kpki9fhCHT3JJnGZphPbNzHSv1zkB0IjgiA76Z6o9+I2DEXUZ
         wtYg==
In-Reply-To: <CAPQ8kBXK1m6tJWYaqsmUTTDzov8ey2ZaMmMKe3nX-FLGw-PYeA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

Hi!

Suppose you have 2 basic chains for the same hook(e.g. filter input)
where first chain has higher priority(executed first) than second.
Currently it looks like that if packet is "accept"ed in the first
chain second is still executed and can "drop" _already accepted_
packet. On the other hand "drop" prevents execution of furhter chains
(i.e. an already dropped packet can't be accepted in lower-priority
chain).

My question is: are "accept" and "drop" terminal statements
asymmetrical by design in nftables?

If so this looks very strange to me and makes layered firewall
configuration (e.g. lowest priority chain blocks everything and higher
priority chains selectively open ports for specific services) much
more cumbersome than needed. Or I just missing something obvious?

Thx in advance!
