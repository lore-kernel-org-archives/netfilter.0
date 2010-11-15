From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT-PMP connections not tracked with nf_conntrack
Date: Mon, 15 Nov 2010 14:58:30 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1011151458001.6022@obet.zrqbmnf.qr>
References: <4CB5C1C1.8060809@googlemail.com> <alpine.LNX.2.01.1010161750050.13972@obet.zrqbmnf.qr> <4CB9D437.2030902@googlemail.com> <alpine.LNX.2.01.1010161948580.29809@obet.zrqbmnf.qr> <4CB9E918.2040707@googlemail.com> <4CDFBCDA.8050006@googlemail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4CDFBCDA.8050006@googlemail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mr Dash Four <mr.dash.four@googlemail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2010-11-14 11:41, Mr Dash Four wrote:
>>
>>> ip6tables-save, or its respective v4 part.
>>>  
>> iptables-save | grep NOTRACK returns nothing, so I assume that I am not using
>> this.
>
> Any ideas? The connection is definitely not tracked and could be seen with
> netstat from local to the remote point on the VPN.

No idea. If I were to look at the system directly maybe.

