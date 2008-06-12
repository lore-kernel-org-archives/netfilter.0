From: Rainer Sabelka <sabelka@iue.tuwien.ac.at>
Subject: Re: conntrackd [ERROR] commit: Invalid argument
Date: Thu, 12 Jun 2008 23:37:59 +0200
Message-ID: <200806122338.00131.sabelka@iue.tuwien.ac.at>
References: <e1aa27e00806090621r3fa83ac0s7bb89d903de3be41@mail.gmail.com> <200806111915.32313.sabelka@iue.tuwien.ac.at> <48513A30.1020908@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <48513A30.1020908@netfilter.org>
Content-Disposition: inline
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Marco Barbero <marco.barbero@gmail.com>, netfilter@vger.kernel.org, Netfilter Development Mailinglist <netfilter-devel@vger.kernel.org>

On Thursday 12 June 2008 17:01:04 Pablo Neira Ayuso wrote:
> Would you try this patch?

Hello Pablo,

thanks for your patch. I'just tried it, but I'm still getting the "Cannot 
allocate memory" message.

-Rainer

# conntrackd -c

Jun 12 23:34:30 fw1b conntrack-tools[5604]: committing external cache
Jun 12 23:34:30 fw1b conntrack-tools[5604]: commit-create: Cannot allocate 
memory
Jun 12 23:34:30 fw1b conntrack-tools[5604]: Committed 140 new entries
Jun 12 23:34:30 fw1b conntrack-tools[5604]: 1 entries can't be committed
