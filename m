From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: load balance [OT?] [Solution]
Date: Mon, 30 Jun 2008 10:58:01 -0500
Message-ID: <48690289.2030909@riverviewtech.net>
References: <1214492735.4427.6885.camel@kr0sty>	 <4866ECB1.2040903@riverviewtech.net> <1214832757.19463.40.camel@kr0sty>	 <4868ED10.3020506@riverviewtech.net> <1214840071.19463.112.camel@kr0sty>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <1214840071.19463.112.camel@kr0sty>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 06/30/08 10:34, Martin wrote:
> Well, I don't know if understood it ok, but I'll try to answer it.

*nod*

> Ping work pretty well for me. Ping each gateway and if them responds 
> and if them are not saturated, load balance works great. If one 
> gateway doesn't responds or it's saturated, traffic switch to the 
> other interface.

Ok.

> About the loop, if one of the gateways goes down, but it still 
> responds because it passes traffic between both nics internally in 
> servers, you can test some things.

Ok, you are deciding to let the loop happen and just detect that it is 
and / or prevent it from happening.  I guess that is another way to 
solve the problem.  IMHO, not having the loop happen is better, but what 
ever works for you.

> Please, keep us updated about your tests or if you can solve it. May 
> be a different thread would be better to keep a track of this.

Um, I'm not testing, that was based on what I have done in the past.



Grant. . . .
