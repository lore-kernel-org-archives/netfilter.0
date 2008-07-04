From: Simon Perreault <simon.perreault@viagenie.ca>
Subject: Re: NFQUEUE hello world-style program
Date: Fri, 4 Jul 2008 08:57:53 -0400
Message-ID: <200807040857.53738.simon.perreault@viagenie.ca>
References: <200807031607.21168.simon.perreault@viagenie.ca> <20080704092637.GA30729@bayen.regit.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20080704092637.GA30729@bayen.regit.org>
Content-Disposition: inline
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Eric Leblond <eric@inl.fr>
Cc: netfilter@vger.kernel.org

On Friday 04 July 2008 05:26:38 Eric Leblond wrote:
> You are missing the unbind  bind
>
> 	nfq_unbind_pf(h, AF_INET);
> 	nfq_bind_pf(h, AF_INET);

For the record, I was missing one other thing too:

nfq_set_mode( q, NFQNL_COPY_PACKET, 0xffff );

-- 
Please try Numb, a STUN/TURN server implementation.
Free access at http://numb.viagenie.ca/.
