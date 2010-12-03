From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: cross compilation of xtables fails
Date: Fri, 3 Dec 2010 15:23:16 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012031522040.22038@obet.zrqbmnf.qr>
References: <4CF8F67B.8010504@googlemail.com> <alpine.LNX.2.01.1012031456370.22038@obet.zrqbmnf.qr> <4CF8F8B3.5080100@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CF8F8B3.5080100@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Friday 2010-12-03 15:03, Mr Dash Four wrote:

>
>> So what is the actual configure command you used?
>>  
> I don't have it at hand as I am posting from a different office/machine, but
> this is the gcc statement compiling libxt_quota2:

The compile stage is unfortunately not useful here. The configure line 
is required. (If it is not in your shell history, you can find it at the 
top of config.log.)
