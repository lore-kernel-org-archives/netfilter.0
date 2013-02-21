From: Marco <listaddr@gmail.com>
Subject: Re: conntrackd questions
Date: Thu, 21 Feb 2013 13:23:30 +0100
Message-ID: <CAHPDOiFpF2+F8CTJ_fF26bXaCtTCUMDPV8JtZT-HX+m2u1j3AA@mail.gmail.com>
References: <CAHPDOiHUU+4qXB3iz6_6ZKOBRg8beBL_7SHC8c4zULw1vJ2CnA@mail.gmail.com>
	<20130219195237.GA3208@localhost>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:x-received:in-reply-to:references:date:message-id
         :subject:from:to:cc:content-type;
        bh=2srbCU4uERtx61F13C0/LKgl9yOOkzWOMsn9wvumNtc=;
        b=w2cCdZl27hC7CPRcWKUmU49d9jwXUGn6wHV6I9bK0KNs9B2cx+tnLAs0sF3GqGDf6k
         EwYpEh8kmA3z5+93FyDTeR0MjZGGEHUK/NgijmUwp0ls38d7SKbo5CZRv1odhL88vmf6
         t6Jl3kho99eg/VAdS60qsHILc/ZVb3CPBy07VFsS/4fqJdmIfFS64m7+pDdimt5zfSlz
         YS1WeNSe1UffUy9f1MaL9OWmSZTSb6WzAlKbqI1VYCbQzb0DP1DV6Lc9zbVE3Dfav53C
         Mv4Lg9gddujnKzcLhuGx3XsBFxcC9V13yj31Tu9KWBRuHgK0cvkY6jZ25FPmbAMJjTSu
         /XsQ==
In-Reply-To: <20130219195237.GA3208@localhost>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: netfilter@vger.kernel.org

2013/2/19 Pablo Neira Ayuso <pablo@netfilter.org>:

> There are several things that you can check to troubleshoot
> conntrackd:

Ok, I think I see what's happening. To understand, I captured traffic
both on the client, and on the upstream router (upstream to fw1 and
fw2).
On the client, I just see that when wget stops downloading, the
traffic stops in the middle of the TCP flow. The client is just
waiting for the server to send more data.

But on the capture taken on the upstream router, I see that, at the
point when the client hangs, there are many RST packets directed to
the website from which the client was downloading. Obviously, this
resets the connection and the client has a hard time waiting for more
data. I suspect these RST are coming from one of the firewalls. For
example, while there is a failover from fw1 to fw2, but fw2 hasn't
synchronized the full conntrack table yet, data comes back from the
website; fw2 doesn't know anything about it yet, so it sends RSTs.
Could a race like this be possible? I can probably live with that, but
I'd like to understand if my analysis is correct.
If I disable external cache, it still happens, although less frequently.

Thanks!
