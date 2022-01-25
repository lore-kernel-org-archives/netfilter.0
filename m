From: Florian Westphal <fw@strlen.de>
Subject: Re: nftables stateless NAT in raw table mangles fragmented UDP
 packets
Date: Tue, 25 Jan 2022 14:00:29 +0100
Message-ID: <20220125130029.GA8499@breakpoint.cc>
References: <cdb7af33-1e07-05b7-a9d9-142d06d9cbfe@weinreich.org>
 <Yc8Hpu/5LPyT5HIU@salvia>
 <Yc8H9sHapPLHKWXV@salvia>
 <69389be8-79d7-2c66-4cb9-1c3ea84c62fd@weinreich.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <69389be8-79d7-2c66-4cb9-1c3ea84c62fd@weinreich.org>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Steffen Weinreich <steve@weinreich.org>
Cc: Pablo Neira Ayuso <pablo@netfilter.org>, netfilter@vger.kernel.org

Steffen Weinreich <steve@weinreich.org> wrote:
> How do we get the patch into to the Mainline Kernel, so that we do not
> need a separate kernel package for these maschines?

Its already in mainline so it should appear in the next -stable releases
as well.
