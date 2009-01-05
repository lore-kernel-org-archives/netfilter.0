From: Marek Kierdelewicz <marek@piasta.pl>
Subject: Re: Q: iptables terminating targets
Date: Mon, 5 Jan 2009 17:31:36 +0100
Message-ID: <20090105173136.78c909b5@catlap>
References: <09c4m418mn35t08207s4v176f82e1jtrn7@4ax.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <09c4m418mn35t08207s4v176f82e1jtrn7@4ax.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: BrainChild@Skyler.com
Cc: netfilter@vger.kernel.org

>Does an ACCEPT or DROP target as a _policy_ behave in a
>non-terminating way where in a rule they are terminating?  Or maybe,
>"terminating" only means no more rules in the current built-in chain
>get considered, rather than no more rules in _any_ chain?

DROP target means packet is dropped and no other chains are
traversed. ACCEPT means that no more rules in the current built-in chain
get considered but traversal of next built-in chain occurs.

regards,
Marek Kierdelewicz
