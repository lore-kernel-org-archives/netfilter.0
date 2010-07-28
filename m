From: Payam Chychi <pchychi@gmail.com>
Subject: Re: How Expensive?
Date: Wed, 28 Jul 2010 00:41:18 -0700
Message-ID: <4C4FDF1E.9050501@gmail.com>
References: <4C4F7893.9020900@abpni.co.uk> <B163F0EB-13C5-4804-95D2-31224AFC296C@gmail.com> <alpine.LSU.2.01.1007280811370.26636@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:cc:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=NLyOk+RavhZHubh1PR5Xs8gsP5Bncps6QoiFFKi9MhE=;
        b=M5gz6IlNJ7sPJISCYf+HUtnIL9BpPo/piy4x1epEczo1Lwl4dSVEZPlSU2CLwy9XIP
         28pelGaofsJ294tjyeTL0QxuBJDNV07WDGoM7XeK0aTXUt+2fqG3OmzT9xiSzc9tVTK3
         Sq6DXKR79a4WHnXFzp8IJMiSGGwaVqVPWPgx4=
In-Reply-To: <alpine.LSU.2.01.1007280811370.26636@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Jonathan Tripathy <jonnyt@abpni.co.uk>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On 10-07-27 11:12 PM, Jan Engelhardt wrote:
> On Wednesday 2010-07-28 03:17, Payam Chychi wrote:
>
>    
>> it's much less and actually recommended than running all rules in
>> default/less chains as each pkt must traverse the entire chain to be
>> processed
>>      
> Packets need not traverse an entire chain! All of -j ACCEPT, -j DROP,
> -j RETURN and -g xxx cause an early exit from the current chain in one
> way or another.
>    
a packet must traverse an entire chain unless it meets a given condition 
and as such its better to have more specific chains to jump packet 
through rather than having to wait until the end of a chain, ie. 1000 
line chain.

ps, my prevoius reply was suppose to say "its much less overhead to use 
more chains and actually NOT recommended to run all rules in 
default/less chains", sorry for the confusion.
