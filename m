From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Sat, 16 Oct 2010 19:49:07 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr> <4CB9D437.2030902@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CB9D437.2030902@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Saturday 2010-10-16 18:35, Mr Dash Four wrote:

>
>>> I have configured a personal vpn with NAT-PMP (which extends from my local to
>>> the remote vpn endpoints), but that connection does not appear to be tracked
>>> by the nf_conntrack.
>>>    
>>
>> Are you using any NOTRACK rules?
>>  
> Not that I am aware of (I use Shorewall). How do I check that?
>

ip6tables-save, or its respective v4 part.

