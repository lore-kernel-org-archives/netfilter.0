From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 11:41:46 +0100
Message-ID: <4C973A6A.9010809@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=9uAoHN0QOKm1FNyPQu6SlWxISOZeCGpPcWRImjMtYhc=;
        b=A3SwCPMXP+gORxK9LiTHr9lLaOAIZQZnCPGCJ1wXxWeoUZxQ/PSB+JcxtRB6pHBRVj
         ob5iUFgCuTE0BYzGJ1QvEAzuMzRI3lvBG4MNqWjwoVtoeHZFUt27yzdcC0iyGR5ZwiIz
         Ruweff8EZpIpt/jiivF5o/pY8HoA3C9RnYkSw=
In-Reply-To: <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-owner@vger.kernel.org


>> When I list my connections with 'cat /proc/net/nf_conntrack' I get the SELinux
>> context secmark as a number, like secmark=XXX.
>>
>> Is there a way I could map that number to the name of the actual context when I
>> set it up originally with the --selctx option in iptables? If that is not
>> possible do you plan to include such feature in the upcoming versions of
>> netfilter?
>>     
>
> Apart from SMACK, I don't think the kernel has knowledge about any names 
> of sorts, especially since SELinux labels seem to be able to 
> be longer than 8 chars.
>
> So if anything, it would be done so in conntrack-tools which you should 
> be using over /proc anyway.
>   
Is there any way I could do this with conntrack-tools? The only option I 
could see on conntrack (the executable) is by using a filter and 
specifying -c or --secmark (a number) which isn't what I am after!
