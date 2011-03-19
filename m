From: Pandu Poluan <pandu@poluan.info>
Subject: Re: LOG_ACCEPT does not result in matching packet being accepted
 (ACCEPT works)
Date: Sat, 19 Mar 2011 15:06:57 +0700
Message-ID: <AANLkTikW9zRCnOtePDQXEShNai5G4b1UTfit6_hhO9bc@mail.gmail.com>
References: <AANLkTin0ZoJ7MfonStpL_Ez=m=tre_w5WvRRXWLrswke@mail.gmail.com>
	<8A7E792DB93B42C5B2C33004FFDBF9C6@Dell>
	<3B9D650FA47F4012ACBD15C9FA7E5DC7@Dell>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <3B9D650FA47F4012ACBD15C9FA7E5DC7@Dell>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Rob (lists)" <lists@sterenborg.info>, netfilter@vger.kernel.org

Which is why I always use all-lowercase for userchains. No chance of a
mixup with TARGETs (they are always all-uppercase).

Rgds,


On 2011-03-19, Rob (lists) <lists@sterenborg.info> wrote:
>> > If I change the LOG_ACCEPT to ACCEPT, strangely SSH starts working.
>>
>> Not so strange to me. Using the ACCEPT target, you're
>> actually ACCEPTing the packet(s) whereas LOG_ACCEPT doesn't
>> (do anything).
>
> Maybe this isn't clear.
> ACCEPT is a final target: the packet will be accepted and that's that.
> LOG_ACCEPT is a userdefined chain, not a target, but you can send
> packets matching a rule to such chain for further processing. You should
> add rules to this chain that tell Netfilter what to do with a packet; if
> the chain is empty, nothing will be done. The packet will not be
> accepted, simply because the chain is called 'LOG_ACCEPT'.
>
>
> -- Rob
>
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
>


-- 
--
Pandu E Poluan - IT Optimizer
My website: http://pandu.poluan.info/
