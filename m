From: Martin <mylists@itcom.com.ar>
Subject: Re: load balance [OT?]
Date: Tue, 03 Jun 2008 14:06:30 -0300
Message-ID: <1212512790.2539.16755.camel@kr0sty.1.com.ar>
References: <1212434787.2539.16326.camel@kr0sty.1.com.ar>
	 <1212510920.2539.16738.camel@kr0sty.1.com.ar>
	 <4845768C.5020506@googlemail.com>
Reply-To: mylists@itcom.com.ar
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4845768C.5020506@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Mark Perry <rita.co.ltd@googlemail.com>
Cc: netfilter@vger.kernel.org


On Tue, 2008-06-03 at 23:51 +0700, Mark Perry wrote:
> Martin wrote:
> 
> >> #Rules for ISPs
> >> ip rule add $ISP1_IP table 1
> >> ip rule add $ISP2_IP table 2
> >>
> 
> Are these rules working?
> shouldn't they be:
> 
> ip rule add from $ISP1_IP table 1
> ip rule add from $ISP2_IP table 2
> 
> 
> mark


Thanks for the reply Mark.


Actually the do work. Why they shouldn't?


Cheers 

Martin

