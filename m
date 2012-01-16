From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: Meaning of NFQUEUE's --queue-balance option
Date: Mon, 16 Jan 2012 16:56:55 +0100
Message-ID: <20120116155655.GB16285@1984>
References: <BLU162-W15434B55EC562304BCB753F6830@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
Content-Disposition: inline
In-Reply-To: <BLU162-W15434B55EC562304BCB753F6830@phx.gbl>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Cc: netfilter@vger.kernel.org

On Mon, Jan 16, 2012 at 12:01:43PM +0100, Andres Velasco Garcia wrote:
> 
> I would like to understand how load is distributed across different queues using NFQUEUE's --queue-balance option.
> 
> The only information I could find on the subject is in the iptables man page, where I read: "Packets belonging to the same connection are put into the same nfqueue"

It's a hash-based approach. You hash on the packet descriptors
(source/destination/...), thus, the load is distributed between
several user-space processes.

See recent version of linux/net/netfilter/xt_NFQUEUE.c for more information.

> I have two questions:
> 1- Would this be true also if NFQUEUE target is triggered within the "mangle" and not the "nat" table?

On the nat table, you will only see the first packet of the flow.

> 2- I would find useful for my application if all packets from/to the same IP address (not only "connection") would flow though the same queue always. Is this somehow ensured by queue-balance? 

Yes.
