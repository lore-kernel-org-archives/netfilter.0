From: Udo Schneider <Udo.Schneider@homeaddress.de>
Subject: Re: conntrack/state with QUEUE target
Date: Fri, 27 Nov 2009 16:54:11 +0100
Message-ID: <heosno$ngc$1@ger.gmane.org>
References: <heoprj$dpr$1@ger.gmane.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <heoprj$dpr$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

All,

> This worked fine. Now however we have the requirement for more granular 
> "stateful" Rules. I though it should be possible to combine 
> state/conntrack with the QUEUE target ... but this doesn't seem to work.
> 
> -t mangle -A FORWARD -p tcp --dport 80 -m state --state NEW,ESTABLISHED 
> -j QUEUE

I think I got it.

-t mangle -A FORWARD -p tcp --dport 80 -m state --state NEW,ESTABLISHED 
-j QUEUE
-t mangle -A FORWARD -p tcp --sport 80 -m state --state ESTABLISHED
-j QUEUE

This combination seems to work. Coming from a Check Point Background I 
assumed that the statefulness provided by state/conntrack means that I 
only have to specify the initiating connection - replies are 
accepted/queued automagically based on connection data.

However I seem to be wrong - or did I completely miss the point?

CU,

Udo

