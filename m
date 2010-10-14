From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: event-driven connection tracking
Date: Thu, 14 Oct 2010 14:26:15 +0100
Message-ID: <4CB704F7.60608@googlemail.com>
References: <4CB5CF17.3090302@googlemail.com> <alpine.LNX.2.01.1010131747460.27120@obet.zrqbmnf.qr> <4CB6302A.8080507@googlemail.com> <alpine.LNX.2.01.1010140053190.5698@obet.zrqbmnf.qr> <4CB6F1E2.3030702@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=5gkKrS3jUt0U4PO/MH+zY0o0okeCRhK5vXG8Ech4bQ4=;
        b=mGEK4l4dRHaYQbaJ0lH9r9qyAuY1EdfbjRltzReOsJ/yTMBXu00gghVJMlbkpMsoEr
         KaKgnYpZBp7UgyLGtyeClK5Z9r10nHoG/X6jmfEr1onrkvB45f7RAe9Jf0Bhal4Vx5mw
         oMBQhM5yDbiPyHG7S56JAWAHmrAHxV1n47wzQ=
In-Reply-To: <4CB6F1E2.3030702@netfilter.org>
Sender: netfilter-devel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Jan Engelhardt <jengelh@medozas.de>, Netfilter Developer Mailing List <netfilter-devel@vger.kernel.org>, netfilter@vger.kernel.org


>>>> conntrack -Ee NEW,DESTROY
>>>>
>>>> would list you the specified events as they happen. Combined with a script
>>>> that reacts when a new line is outputted by conntrack should
>>>> do the trick.
>>>>  
>>>>         
>>> That's not what I am after!
>>>
>>> If I want to poll a text output every-so-often I can use /proc/net/nf_conntrack
>>>       
>> -E is event driven. (That's why it's got the "E".)
>>     
>
> Indeed, if you're looking for a tool to listen to event-driven conntrack
> notifications, then what Jan suggests is the correct approach. If you
> want to make your own handling application, you can use
> libnetfilter_conntrack.
>   
Making my own handling application was the preferred way, though I would 
have settled for text-based notifications through the stdin pipe (a bit 
clumsy, but doable). As it turns out libnetfilter_conntrack seems to 
provide me with what I need, so I would settle for that.

Another constraint I have (which I did not mention in my initial post) 
is that, for various reasons, I am using the 2.6.16.60 kernel - the 
libnetfilter_conntrack requirements suggest I can get away with it, is 
there anything in particular I should be aware of when installing/using 
this package with this kernel version (no, I am not in a position to 
upgrade - not yet!)?

> For logging, you can use ulogd2.
>   
I have been doing the logging and it is not what I need as the 'action' 
I take depends on what I find in the event matches - sometimes it is 
necessary to just log the necessary data, but sometimes I would need to 
initiate process scanning and full packet dumps on a particular 
connection - for that to just use logging won't be enough.
