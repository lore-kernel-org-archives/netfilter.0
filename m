From: Patrick McHardy <kaber@trash.net>
Subject: Re: Fwd: Can Netfilter "mark" be used with setkey spdadd?
Date: Thu, 17 Jun 2010 09:47:58 +0200
Message-ID: <4C19D32E.7010206@trash.net>
References: <AANLkTikXfO5TnvTN946kVtdkO5rs6vwVx0DkOP5uIcRY@mail.gmail.com> <alpine.LSU.2.01.1006162019220.30698@obet.zrqbmnf.qr> <AANLkTin_ISVEr4Z5zoVmGEm9RMbvjRlws7I1AnQkfCfU@mail.gmail.com> <alpine.LSU.2.01.1006170930180.12057@obet.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LSU.2.01.1006170930180.12057@obet.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Ajay Lele <ajay.lele@gmail.com>, netfilter@vger.kernel.org

Jan Engelhardt wrote:
> On Thursday 2010-06-17 03:24, Ajay Lele wrote:
>   
>>>> I am working on a VPN solution where packets entering Linux box are
>>>> manipulated using IPTables rules (SNAT, DNAT etc.). The nature of this
>>>> manipulation is such that packets destined for different sites end up
>>>> getting the same src/dst IP address when they reach the Netfilter
>>>> POSTROUTING chain. However a different "mark" is set using the
>>>> IPTables mark target by which packets destined for different sites can
>>>> be distinguished from one another. Is there a way I can use this mark
>>>> value while creating security policy using setkey spdadd so that
>>>> packets are sent over respective tunnels (tunnels are created
>>>> manually)
>>>>         
>>> A packet can be marked when it enters the machine and retains the
>>> mark as long as it exists, even across transformation.
>>>       
>> Thanks for the info, Jan. What I am specifically looking for is
>> whether Netfilter "mark" value on the outgoing packet can be used to
>> influence which tunnel the packet is forwarded on. I know it is more a
>> question for ipsec-tools folks but trying my luck here as nobody
>> replied on their mailing list
>>     
>
> Sounds like you found a missing feature. I certainly did not find
> any mention of mark or realm in `ip xfrm policy help`.

Its supported since .34:

commit fb977e2ca607a7e74946a1de798f474d1b80b9d6
Author: Jamal Hadi Salim <hadi@cyberus.ca>
Date:   Tue Feb 23 15:09:53 2010 -0800

    xfrm: clone mark when cloning policy
   
    When we clone the SP, we should also clone the mark.
    Useful for socket based SPs.
   
    Signed-off-by: Jamal Hadi Salim <hadi@cyberus.ca>
    Signed-off-by: David S. Miller <davem@davemloft.net>

commit 295fae568885a93c39a0e29a9455054608b6cc0e
Author: Jamal Hadi Salim <hadi@cyberus.ca>
Date:   Mon Feb 22 11:33:00 2010 +0000

    xfrm: Allow user space manipulation of SPD mark
   
    Add ability for netlink userspace to manipulate the SPD
    and manipulate the mark, retrieve it and get events with a defined
    mark, etc.
   
    Signed-off-by: Jamal Hadi Salim <hadi@cyberus.ca>
    Signed-off-by: David S. Miller <davem@davemloft.net>

commit 6f26b61e177e57a41795355f6222cf817f1212dc
Author: Jamal Hadi Salim <hadi@cyberus.ca>
Date:   Mon Feb 22 11:32:59 2010 +0000

    xfrm: Allow user space config of SAD mark
   
    Add ability for netlink userspace to manipulate the SAD
    and manipulate the mark, retrieve it and get events with a defined
    mark.
    MIGRATE may be added later.
   
    Signed-off-by: Jamal Hadi Salim <hadi@cyberus.ca>
    Signed-off-by: David S. Miller <davem@davemloft.net>

commit 34f8d8846f69f3b5bc3916ba9145e4eebae9394e
Author: Jamal Hadi Salim <hadi@cyberus.ca>
Date:   Mon Feb 22 11:32:58 2010 +0000

    xfrm: SP lookups with mark
   
    Allow mark to be used when doing SP lookup
   
    Signed-off-by: Jamal Hadi Salim <hadi@cyberus.ca>
    Signed-off-by: David S. Miller <davem@davemloft.net>

commit 8ca2e93b557f2a0b35f7769038abf600177e1122
Author: Jamal Hadi Salim <hadi@cyberus.ca>
Date:   Mon Feb 22 11:32:57 2010 +0000

    xfrm: SP lookups signature with mark
   
    pass mark to all SP lookups to prepare them for when we add code
    to have them search.
   
    Signed-off-by: Jamal Hadi Salim <hadi@cyberus.ca>
    Signed-off-by: David S. Miller <davem@davemloft.net>

