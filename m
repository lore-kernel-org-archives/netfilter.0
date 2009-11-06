From: Patrick McHardy <kaber@trash.net>
Subject: Re: Round robin load balance to local port range
Date: Fri, 06 Nov 2009 17:16:19 +0100
Message-ID: <4AF44BD3.3050103@trash.net>
References: <4AF44128.5000301@edu.physics.uoc.gr> <4AF446D7.1070406@trash.net> <4AF449DB.1040600@edu.physics.uoc.gr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF449DB.1040600@edu.physics.uoc.gr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Kapetanakis Giannis wrote:
> On 06/11/09 17:55, Patrick McHardy wrote:
>> The manpage is incorrect (patches welcome :), it will use the first
>> port as long as the tuples don't clash. The --random option can be
>> used to randomly select a port from the range.
>> -- 
>> To unsubscribe from this list: send the line "unsubscribe netfilter" in
>> the body of a message to majordomo@vger.kernel.org
>> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>>    
> 
> --random does the job both for DNAT and REDIRECT
> I guess random is better that nothing :)
> 
> Just for clarification: the state of the packet will be remembered right?
> I don't want to send it first to one port and later to another.

Correct.

> ps. I found another bug
> --random in DNAT has to be put at the end of the rule
> otherwise if you put it before --to-destination
> error: "Multiple --to-destination not supported"

Thanks, fixed in git.
