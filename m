From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Tue, 21 Sep 2010 21:13:02 +0100
Message-ID: <4C9911CE.6090209@googlemail.com>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com> <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr> <4C9756AB.5040304@googlemail.com> <4C97D6D6.9040805@shorewall.net> <alpine.LNX.2.01.1009210125590.14400@obet.zrqbmnf.qr> <4C988214.6050600@googlemail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=lvIsrRFUww+9jXC6WJDxBZ7al46NO0sd9lto+AXydvA=;
        b=Dv0P+cI/WcumGgzgvmSofFhWxPsfbcJIKPigvBNbD3kql608wdsh1DL4ZXBaT/JTxx
         QMhNqflqDbHn+WHYWT10kO/l1r6W/sAW1rlz0KII/ONcPohhPNkIqF9Q9NS+9n+tcouK
         Bw6ujBp5/aaBqBuB8EwWnWbt5mQv1U4tAjxFI=
In-Reply-To: <4C988214.6050600@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org
Cc: Eric Paris <eparis@parisplace.org>


>> http://www.spinics.net/lists/netfilter/msg49106.html
>>
>> I don't think that approach is right.  Exporting a number at ALL is
>> broken.  It should only ever say the name.
>>   
> I am aware of that and the proposed patch works as I did test it after 
> Tom released it yesterday.
>
> As for your comment above - it is better than NOTHING.
>
> If you think that the current scenario, when I see meaningless number 
> in the secmark field, helps me track the actual security context of 
> the listed connection, then think again, because there is NO way I 
> could know what number maps to which context.
>
> Tom's patch at least gives me that mapping when I list the mangle 
> table, so it is a start and it works. Again, - the patch, if applied, 
> is better than what currently exists in iptables. Also, 'exporting a 
> number at all' is NOT broken - look at Tom's patch again - it does not 
> break anything.
