From: Brent Clark <brentgclarklist@gmail.com>
Subject: Re: Using iptables for throttling SMTP traffic
Date: Tue, 02 Nov 2010 11:30:05 +0200
Message-ID: <4CCFDA1D.40907@gmail.com>
References: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:received:received:message-id:date:from
         :user-agent:mime-version:to:subject:references:in-reply-to
         :content-type:content-transfer-encoding;
        bh=E/VLq6jjcrQugJaZRWDTyDls6h2V1vwgOx3Arixh7FY=;
        b=mAre/feyQ8FDcNOW+vysXlZ5yKt8mPNkNQHouGNHKEqjzXkX0RgIxvUyFu21b5GEqQ
         WeMYcZTKrQiL9uWBEvCXl+ymL4hlsq+RIp60c8lAC9+CIo+Sfhp2lGlZOvRyQXQG/Vpq
         RMluYWAUcDziPEtidzu9CNB6egtv3THwnqE6w=
In-Reply-To: <AANLkTinMmFLt=23wMYdGKcrtLxdAGgCyRqJSbP2g0_iJ@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

On 01/11/2010 21:07, Alex wrote:
>  My hope is to block hundreds of connections on my mail server from
>  bulk mail senders like constantcontact, as well as the flood of
>  connections from spam bots that are rejected by zen anyway.
>
>  How can I tell what rules are currently in place for a particular
>  IP? In other words, I see log entries for the initial block, but it
>  doesn't appear that an actual rule is added, correct?


Hiya

Why dont you do this at the application level. There many way to do this.

Have you looked at greylisting?

You make no mention of what MTA you are using. But you can set up a MTA 
Gateway (Basically a MTA in front of your real MTA).

HTH
Brent Clark

