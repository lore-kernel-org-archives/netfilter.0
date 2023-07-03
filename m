From: Florian Westphal <fw@strlen.de>
Subject: Re: Best practices on iif usage at persistent ruleset
Date: Mon, 3 Jul 2023 17:25:44 +0200
Message-ID: <20230703152544.GD7043@breakpoint.cc>
References: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <ede291f8-c556-0d0c-d598-7c69f387ed74@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org

Serg <seentr@at.encryp.ch> wrote:
> I know that there is iifname as a safe alternative, but as far as I know it
> has huge performance drawback and thus its' usage is discouraged in my case.

Not really. Its copy and compare 4 bytes vs. copy and compare 16 bytes.
