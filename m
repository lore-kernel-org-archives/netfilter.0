From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Sat, 16 Oct 2010 17:35:03 +0100
Message-ID: <4CB9D437.2030902@googlemail.com>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=UoBmj6DtEPv67PWmt/o7xg35XCWQirQzoHKHkzJPVL0=;
        b=FpyyFzS29o+ma+VQ5hf+tr6ybmc6/Zd+iND5EBI3DtnpNpfU5SdOJJlHpOP2wXuv1d
         xIa76n0uVN/ejtYdREFb9/mtX4ZTwPalWT10K/9qBpsA6cw5f/rll5sRGeZ3ZnlxKQQD
         zpHIqlA2P4rMY3xXE5NJcW5qB3K57lITFEwhY=
In-Reply-To: <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


>> I have configured a personal vpn with NAT-PMP (which extends from my 
>> local to the remote vpn endpoints), but that connection does not appear 
>> to be tracked by the nf_conntrack.
>>     
>
> Are you using any NOTRACK rules?
>   
Not that I am aware of (I use Shorewall). How do I check that?

