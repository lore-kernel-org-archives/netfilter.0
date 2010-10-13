From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: event-driven connection tracking
Date: Thu, 14 Oct 2010 00:56:08 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010140053190.5698@obet.zrqbmnf.qr>
References: <4CB5CF17.3090302@googlemail.com> <alpine.LNX.2.01.1010131747460.27120@obet.zrqbmnf.qr> <4CB6302A.8080507@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <4CB6302A.8080507@googlemail.com>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, netfilter@vger.kernel.org


On Thursday 2010-10-14 00:18, Mr Dash Four wrote:
>>> Is it possible to use event-driven connection tracking - with conntrack-utils
>>> or by other means?
>>> Ideally, what I would like to do is 'register' a handler for particular
>>> connection events (when new connection is established and then closed for
>>> example) based on particular pre-defined filter (say, by protocol,
>>> source/destination ip etc) and execute a program code/function (if done
>>> programmatically) or a script (if done outside the connection-tracking
>>> domain)
>>> to do what I want?
>>
>> conntrack -Ee NEW,DESTROY
>>
>> would list you the specified events as they happen. Combined with a script
>> that reacts when a new line is outputted by conntrack should
>> do the trick.
>>  
> That's not what I am after!
>
> If I want to poll a text output every-so-often I can use /proc/net/nf_conntrack

-E is event driven. (That's why it's got the "E".)
