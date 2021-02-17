From: Florian Westphal <fw@strlen.de>
Subject: Re: Wildcards / large ranges in concatenations
Date: Wed, 17 Feb 2021 07:50:12 +0100
Message-ID: <20210217065012.GH2766@breakpoint.cc>
References: <f3caadb1-4c04-c1b2-96df-8ed4f08698db@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <f3caadb1-4c04-c1b2-96df-8ed4f08698db@fhmtech.com>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: netfilter@vger.kernel.org

Frank Myhr <fmyhr@fhmtech.com> wrote:
> A couple of weeks ago I played around a bit with using ranges in
> concatenations, a very cool feature added in nftables 0.9.4. Somehow I wound
> up with set with nonsensical keys, and not long after a kernel oops.

The kernel must not oops.  Please share a reproducer so this can be
fixed.  Thanks.
