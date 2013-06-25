From: Gao feng <gaofeng@cn.fujitsu.com>
Subject: Re: v3.10-rc7 oops soon after boot
Date: Tue, 25 Jun 2013 14:17:24 +0800
Message-ID: <51C935F4.4080401@cn.fujitsu.com>
References: <20130624094145.2576.qmail@science.horizon.com> <51C816C8.4080709@cn.fujitsu.com> <20130624113441.GA2583@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <linux-kernel-owner@vger.kernel.org>
In-Reply-To: <20130624113441.GA2583@localhost>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: George Spelvin <linux@horizon.com>, bp@alien8.de, kaber@trash.net, linux-kernel@vger.kernel.org, netfilter@vger.kernel.org

On 06/24/2013 07:34 PM, Pablo Neira Ayuso wrote:
> On Mon, Jun 24, 2013 at 05:52:08PM +0800, Gao feng wrote:
>> On 06/24/2013 05:41 PM, George Spelvin wrote:
>>>> Please try the patch below,
>>>> I think this bug is introduced by me :(
>>>>
>>>> Thanks!
>>>
>>> Well, you changed it, but it still crashes.
>>>
>>> It's now at del_timer+0x9/0x58, with the code being:
>>
>> This one should work.
>>
>> Thanks for your quickly reply.
> 
> I managed to crash it using a group != 1 (default) and enabling
> batching:
> 
> iptables -I INPUT -j ULOG --ulog-nlgroup 2 --ulog-qthresh 50
> 
> It seems ulog->nlgroup[i] is always left unset.

Yes, we should set ulog->nlgroup..

> 
> I have mangled your patch, find it attached.
> 

Thanks!
