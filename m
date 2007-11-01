From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: redirect to webpage
Date: Thu, 01 Nov 2007 11:19:11 -0500
Message-ID: <4729FC7F.9050602@riverviewtech.net>
References: <20071031111119.hc54s7z4e80sc0ws@webmail.harrisonburg.k12.va.us>	<4728AF60.4090102@riverviewtech.net>	<20071031130209.wnb2jsiao0owc8ok@webmail.harrisonburg.k12.va.us>	<4728CACF.70601@riverviewtech.net> <20071031205706.4i9hlqmw008ck4g0@mail.harrisonburg.k12.va.us>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <20071031205706.4i9hlqmw008ck4g0@mail.harrisonburg.k12.va.us>
Sender: netfilter-owner@vger.kernel.org
List-Id: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@vger.kernel.org>

On 10/31/07 19:57, dhottinger@harrisonburg.k12.va.us wrote:
> WOW.  Quite a lot of information.  Its been my goal to get my proxy 
> server and firewall on the same box.  Havent got there yet.  My firewall 
> is running on an old pII ibm workstation with 3 nics, doing routing, nat 
> etc. and has worked very well.  Hardly ever breaks a sweat, so it hasnt 
> been a priority like mail, etc.  The main reason I used the url is 
> because the ip addresses of the sites change quite a bit also.  Im just 
> about ready to throw the towel in, there is just to many proxiifier 
> sites for people to use to circumvent my filter.   I guess the best way 
> to do this would not run a transparent proxy, which maybe what I end up 
> doing sometime in the future.  As always thanks for the advise.

*nod*

That is why I have found a liking of the unix way of thinking where you 
lock down everything and just open up what is needed.

Good luck with your problem(s).  If you are curious, you could probably 
come up with a chain and sub-chain structure that only part of the 
sub-chain(s) were updated via cron jobs when things change.



Grant. . . .
