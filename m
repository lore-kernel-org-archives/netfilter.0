From: sreejith menon <sreejithjmenon@gmail.com>
Subject: Re: Applying Nat rules during traffic
Date: Wed, 20 Jun 2012 21:16:53 +0530
Message-ID: <CACJKonr+HUCzwKdRYCcADFkR-0qp8n1NPf34h+uxkpZNAVqCdA@mail.gmail.com>
References: <CACJKonqQND2VnPgsiE5=FTJp6qkjKjTZKVvfMAvTVThsjo=vPA@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20120113;
        h=mime-version:in-reply-to:references:date:message-id:subject:from:to
         :content-type;
        bh=aGLVhkmqO2nadzbFvC3ULhRH43CHVj6LDQhW1wACttA=;
        b=aa12JaHpB+QEBNyUCtogkxbW0P5A3lvengz9uKeKOQPboKcO6KaEZn1/QTz5L1Lewd
         bTr4XcqOHyLqjjQtYAElEwQaeGcvNm5s/2/w39QklktgOufMcDnTW+pGyCzEzOnGEpA4
         kIqcUOy0blQtzGXAIHMtlkqf5iQi2of9YCtySshwDvsCI0ulZAcC3pksQ/1HVWQDKvWi
         9qoZTo0jqlkdnjGV2WsSbsQ+08ZyKSktG1naThQ/3ENBNI4tFUhatgAqSR15436N6pWy
         Vvu86o+Y8tMDmXL6W6g1h9M1ipJX+Vxqc9airWikB79OkCYAindRcfCGcVvOuSOlCMCe
         +Kcg==
In-Reply-To: <CACJKonqQND2VnPgsiE5=FTJp6qkjKjTZKVvfMAvTVThsjo=vPA@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

> It's not a bug. The connection tracking table is independent from the
> ruleset by design. There is not much point in (automatically) changing
> the NAT tuples while a TCP connection is open anyway - since it would
> rupture the connection (and that's what can happen if you force it with
> conntrack -F.)

Thanks for the information. So even if i install xtables add on the
behavior will be the same.?
 ie if i was sending some icmp packets through output interface eth0,
i need to stop and start the traffic again after applying NAT.

I was thinking of installing x-tables add on to solve this.

regards
sreejith
