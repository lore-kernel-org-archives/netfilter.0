From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: synflood +syncookies + conntrack strange behaviour
Date: Sat, 11 May 2013 04:21:14 +0200
Message-ID: <20130511022114.GA7793@localhost>
References: <518C479D.1070904@gmail.com>
 <518D8BBB.5050406@gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <518D8BBB.5050406@gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alex Flex <aflexzor@gmail.com>
Cc: netfilter@vger.kernel.org

On Fri, May 10, 2013 at 06:07:23PM -0600, Alex Flex wrote:
> Hello netfilter,
> 
> Iam still wondering if the lack of error for the conntrack table
> full may be a bug in the module? Any help is much appreciated.

The early_drop code is evicting one of the entries from the table to
make room for some new flow:

http://lxr.linux.no/#linux+v3.9.1/net/netfilter/nf_conntrack_core.c#L606

Packets are dropped if the table is full *and* if no unassured flows
to evict are found.

Regards.
