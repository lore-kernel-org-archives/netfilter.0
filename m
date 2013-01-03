From: Jan Vales <jan@jvales.net>
Subject: Re: [SOLVED] Re: Native support of counting rules?
Date: Thu, 03 Jan 2013 18:27:37 +0100
Message-ID: <50E5BF89.1010505@jvales.net>
References: <20130102134421.GA17997@devnull> <50E43D07.50009@ngtech.co.il> <CAJZVxRkyDyZyWUBbhP+H5gv2Dk1_Jj=v4QRAheHKWEnSKTdrhg@mail.gmail.com> <50E59C32.5090003@jvales.net> <alpine.LNX.2.01.1301031704440.32551@nerf07.vanv.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1301031704440.32551@nerf07.vanv.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@inai.de>
Cc: Aaron Lewis <the.warl0ck.1989@gmail.com>, netfilter mailing list <netfilter@vger.kernel.org>

On 03/01/13 17:05, Jan Engelhardt wrote:
> On Thursday 2013-01-03 15:56, Jan Vales wrote:
> 
>> Hi,
>>
>> why dont you use ...
>> iptables-save | grep "\-A" | wc -l
> 
> grep ^-A
> 
> But the foremost question is: how is the rule count alone going to be 
> useful?
> 

I dont think its useful at all - I just like stats and wanted to help ;)

Especially with OP's requirement to allow non-root users to view this count.
Therefore know that/when you changed something.

lg
~Jan
