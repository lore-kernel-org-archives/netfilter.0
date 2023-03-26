From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: nftables: Internal error when checking rules
Date: Sun, 26 Mar 2023 22:48:15 +0200
Message-ID: <ZCCvj7XxHDFr7QXf@salvia>
References: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <9a42b3af-8451-8fc2-2565-a60b1c846358@at.encryp.ch>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Serg <seentr@at.encryp.ch>
Cc: netfilter@vger.kernel.org

On Sun, Mar 26, 2023 at 12:46:56PM +0300, Serg wrote:
> Hello, netfilter community!
> 
> Today I have encountered strange behaviour of the `nft -cf` - I receive an
> error message with an exit code 1. The error message is "internal:0:0-0:
> Error: Could not process rule: File exists".
> 
> My configuration consist of several files and I have found one that causing
> this error - it is set with a list of networks in CIDR format. The file is
> pretty big - it takes 15K on its own (it does not contains any rules at all,
> just a single set).

15K set element entry is rather small.

> A bit of information regarding my envirovment:
> $ uname -sorv
> Linux 6.1.19 #1 SMP PREEMPT_DYNAMIC Tue Mar 21 10:36:11 EET 2023 GNU/Linux

Also when testing, make sure your -stable kernel contains these fixes:

   5d235d6ce75c ("netfilter: nft_set_rbtree: skip elements in transaction from garbage collection")
   c9e6978e2725 ("netfilter: nft_set_rbtree: Switch to node list walk for overlap detection")
