From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?] [Solution]
Date: Mon, 30 Jun 2008 13:26:23 -0300
Message-ID: <1214843183.19463.149.camel@kr0sty>
References: <1214492735.4427.6885.camel@kr0sty>
	 <4866ECB1.2040903@riverviewtech.net> <1214832757.19463.40.camel@kr0sty>
	 <4868ED10.3020506@riverviewtech.net> <1214840071.19463.112.camel@kr0sty>
	 <48690289.2030909@riverviewtech.net>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <48690289.2030909@riverviewtech.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Grant Taylor <gtaylor@riverviewtech.net>
Cc: Mail List - Netfilter <netfilter@vger.kernel.org>

On Mon, 2008-06-30 at 10:58 -0500, Grant Taylor wrote:
> On 06/30/08 10:34, Martin wrote:
> > Well, I don't know if understood it ok, but I'll try to answer it.
> 
> *nod*
> 
> > Ping work pretty well for me. Ping each gateway and if them responds 
> > and if them are not saturated, load balance works great. If one 
> > gateway doesn't responds or it's saturated, traffic switch to the 
> > other interface.
> 
> Ok.
> 
> > About the loop, if one of the gateways goes down, but it still 
> > responds because it passes traffic between both nics internally in 
> > servers, you can test some things.
> 
> Ok, you are deciding to let the loop happen and just detect that it is 
> and / or prevent it from happening.  I guess that is another way to 
> solve the problem.  IMHO, not having the loop happen is better, but what 
> ever works for you.
> 
> > Please, keep us updated about your tests or if you can solve it. May 
> > be a different thread would be better to keep a track of this.
> 
> Um, I'm not testing, that was based on what I have done in the past.


In my case, loop won't happen, both gateways are internal of internet
carriers.


Sorry for the missed response, for some reason I think you were asking
me.

And that's right, an arping can be more accurate for this cases.


Thanks for the tip, and really sorry for the misunderstood of your mail.

Cheers.

Martin

