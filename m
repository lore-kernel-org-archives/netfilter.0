From: "Jesse Gordon" <jesseg@nikola.com>
Subject: Re: Unmatchable packet?
Date: Tue, 22 Nov 2005 13:28:33 -0800
Message-ID: <073501c5efab$b10ad390$5e00800a@printserver>
References: <071e01c5efa7$786db600$5e00800a@printserver>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="response"
To: Jesse Gordon <jesseg@nikola.com>, netfilter <netfilter@lists.netfilter.org>

----- Original Message ----- 
From: "Jesse Gordon" <jesseg@nikola.com>
> My box is running a TCP service. When another box tries to my box, my box

I meant 'When another box tries to _connect to_ my box...'

-Jesse

> responds with a reply packet.(Just like it should.)
> How do I match that (and all subsequent) reply packets so I can SNAT on 
> them?
>
> I even tried:
>
> iptables -t nat -A POSTROUTING -o eth1 -j SNAT --to 222.222.222.222
>
> and sure enough, everything going out eth1 was 'from' 222.222.222.222 
> except the reply packets to incoming connections.
>
> Also tried -t nat OUTPUT, -t mangle OUTPUT, etc.. Nothing seemed to work.
>
> Should I expect such a feat to be possible?
>
> Thanks!
>
> -Jesse
>
>
> 



