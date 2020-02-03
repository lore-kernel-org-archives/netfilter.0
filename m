From: Florian Westphal <fw@strlen.de>
Subject: Re: Lint for nftables
Date: Mon, 3 Feb 2020 01:27:23 +0100
Message-ID: <20200203002723.GP795@breakpoint.cc>
References: <e94e649a-0d30-6fd1-4144-4bb73564d0ff@satchell.net>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <e94e649a-0d30-6fd1-4144-4bb73564d0ff@satchell.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Stephen Satchell <list@satchell.net>
Cc: netfilter@vger.kernel.org

Stephen Satchell <list@satchell.net> wrote:
> Is there an equivalent to lint(1) for nftables?  One that, instead of just
> saying "you blew it", it shows where you blew it and what it was expected.

No.  nft is already supposed to tell you where the problem is.

Please provide an example error and we can try to improve the error
reporting.
