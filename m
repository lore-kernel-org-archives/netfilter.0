From: Mr Dash Four <mr.dash.four@googlemail.com>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Mon, 15 Nov 2010 21:50:55 +0000
Message-ID: <4CE1AB3F.2000606@googlemail.com>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr> <4CB9D437.2030902@googlemail.com> <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr> <4CB9E918.2040707@googlemail.com> <4CDFBCDA.8050006@googlemail.com> <alpine.LNX.2.01.1011151458001.6022@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=gamma;
        h=domainkey-signature:received:received:message-id
         :disposition-notification-to:date:from:user-agent:mime-version:to:cc
         :subject:references:in-reply-to:content-type
         :content-transfer-encoding;
        bh=ywyvIJE6e6Vg01MMegQ9bIu+fDMPt9w9s9CoIFk0BwM=;
        b=BIdb66DMQsAonoBDtNHo6WJ8tGTvFxAvQYu6jeqJL16cICY9GQVb/zkx5+4oJndgd9
         F9Vrr0WL5bwfShuNww07QQJA4HWH6TitNsghMjaE4Q6J3QAlX8Tkf2Ex3rJo6+y/eXXP
         gEkoB9g/lCV4W03K5J78f7GyOvK5A8TmbfcAc=
In-Reply-To: <alpine.LNX.2.01.1011151458001.6022@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: netfilter@vger.kernel.org


>> Any ideas? The connection is definitely not tracked and could be seen with
>> netstat from local to the remote point on the VPN.
>>     
>
> No idea. If I were to look at the system directly maybe.
>   
If I can help you with providing some more info I would - just let me 
know, but the connection is definitely there and is definitely not 
tracked. When I execute 'netstat --inet -an' I get it listed, like:

udp        0      0 10.1.1.2:51602              
10.1.1.1:5351               ESTABLISHED

This is not showing with "cat /proc/net/nf_conntrack | grep 5351" or 
"cat /proc/net/nf_conntrack | grep 51602"
