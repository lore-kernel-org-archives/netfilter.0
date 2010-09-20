From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: decipher the secmark number from nf_conntrack/ip_conntrack
Date: Mon, 20 Sep 2010 14:23:00 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1009201421180.13430@obet.zrqbmnf.qr>
References: <4C9696E5.4030803@googlemail.com> <alpine.LNX.2.01.1009200244280.5711@obet.zrqbmnf.qr> <4C973A6A.9010809@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C973A6A.9010809@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org, Pablo Neira Ayuso <pablo@netfilter.org>, netfilter-owner@vger.kernel.org


On Monday 2010-09-20 12:41, Mr Dash Four wrote:
>
>>>When I list my connections with 'cat /proc/net/nf_conntrack' I get 
>>>the SELinux context secmark as a number, like secmark=XXX.
>>>
>>>Is there a way I could map that number to the name of the actual 
>>>context when I set it up originally with the --selctx option in 
>>>iptables? If that is not possible do you plan to include such feature 
>>>in the upcoming versions of netfilter?
>>>    
>>
>>Apart from SMACK, I don't think the kernel has knowledge about any 
>>names of sorts, especially since SELinux labels seem to be able to be 
>>longer than 8 chars.
>>
>>So if anything, it would be done so in conntrack-tools which you 
>>should be using over /proc anyway.
>
>Is there any way I could do this with conntrack-tools? The only option 
>I could see on conntrack (the executable) is by using a filter and 
>specifying -c or --secmark (a number) which isn't what I am after!

Basically `conntrack -L`. You just need to write the patch that 
does the secmark->name translation. :-)
