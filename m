From: Kapetanakis Giannis <bilias@edu.physics.uoc.gr>
Subject: Re: Round robin load balance to local port range
Date: Fri, 06 Nov 2009 18:07:55 +0200
Message-ID: <4AF449DB.1040600@edu.physics.uoc.gr>
References: <4AF44128.5000301@edu.physics.uoc.gr> <4AF446D7.1070406@trash.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4AF446D7.1070406@trash.net>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 06/11/09 17:55, Patrick McHardy wrote:
> The manpage is incorrect (patches welcome :), it will use the first
> port as long as the tuples don't clash. The --random option can be
> used to randomly select a port from the range.
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>    

--random does the job both for DNAT and REDIRECT
I guess random is better that nothing :)

Just for clarification: the state of the packet will be remembered right?
I don't want to send it first to one port and later to another.

regards and thanks for the quick answer

Giannis

ps. I found another bug
--random in DNAT has to be put at the end of the rule
otherwise if you put it before --to-destination
error: "Multiple --to-destination not supported"
