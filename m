From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Fwd: Can Netfilter "mark" be used with setkey spdadd?
Date: Thu, 17 Jun 2010 09:36:16 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006170930180.12057@obet.zrqbmnf.qr>
References: <AANLkTikXfO5TnvTN946kVtdkO5rs6vwVx0DkOP5uIcRY@mail.gmail.com> <alpine.LSU.2.01.1006162019220.30698@obet.zrqbmnf.qr> <AANLkTin_ISVEr4Z5zoVmGEm9RMbvjRlws7I1AnQkfCfU@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTin_ISVEr4Z5zoVmGEm9RMbvjRlws7I1AnQkfCfU@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Ajay Lele <ajay.lele@gmail.com>
Cc: netfilter@vger.kernel.org


On Thursday 2010-06-17 03:24, Ajay Lele wrote:
>>>
>>>I am working on a VPN solution where packets entering Linux box are
>>>manipulated using IPTables rules (SNAT, DNAT etc.). The nature of this
>>>manipulation is such that packets destined for different sites end up
>>>getting the same src/dst IP address when they reach the Netfilter
>>>POSTROUTING chain. However a different "mark" is set using the
>>>IPTables mark target by which packets destined for different sites can
>>>be distinguished from one another. Is there a way I can use this mark
>>>value while creating security policy using setkey spdadd so that
>>>packets are sent over respective tunnels (tunnels are created
>>>manually)
>>
>> A packet can be marked when it enters the machine and retains the
>> mark as long as it exists, even across transformation.
>
>Thanks for the info, Jan. What I am specifically looking for is
>whether Netfilter "mark" value on the outgoing packet can be used to
>influence which tunnel the packet is forwarded on. I know it is more a
>question for ipsec-tools folks but trying my luck here as nobody
>replied on their mailing list

Sounds like you found a missing feature. I certainly did not find
any mention of mark or realm in `ip xfrm policy help`.
