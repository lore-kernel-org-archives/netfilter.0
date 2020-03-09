From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables equivalent of "ipset test"?
Date: Mon, 9 Mar 2020 20:14:35 +0100
Message-ID: <20200309191435.GT979@breakpoint.cc>
References: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <633ac5cf-a8db-4142-6ed2-ae335c7e12f1@fhmtech.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Frank Myhr <fmyhr@fhmtech.com>
Cc: Linux Netfilter Users List <netfilter@vger.kernel.org>

Frank Myhr <fmyhr@fhmtech.com> wrote:
> Is there a recommended way to test whether an element is a member of an
> nftables set?

nft get element inet filter foo "{ 1.2.3.4 }"
