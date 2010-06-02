From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: inadequate NEW, INVALID state definitions
Date: Thu, 3 Jun 2010 00:33:30 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1006030025530.16256@obet.zrqbmnf.qr>
References: <loom.20100602T012732-376@post.gmane.org> <AANLkTikavmrze4l8YGeA3o9zbX9mV-lrSPXdBPNpIAoH@mail.gmail.com>  <alpine.LSU.2.01.1006022103590.32028@obet.zrqbmnf.qr> <AANLkTikHsAynHO6bSGritJw3a64DVrUG96th58PSfOl1@mail.gmail.com>
 <AANLkTimjFGnLq1OAdOhLoN8tOnQvCoRXTZORlbNPf0gX@mail.gmail.com> <alpine.DEB.2.00.1006022254390.14733@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.DEB.2.00.1006022254390.14733@blackhole.kfki.hu>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: Curby <curby@cur.by>, Jeremiah Crockett <jrmhcrcktt@gmail.com>, netfilter@vger.kernel.org

On Thursday 2010-06-03 00:13, Jozsef Kadlecsik wrote:
>On Wed, 2 Jun 2010, Curby wrote:
>
>> This seems to get a bit murkier as some conditions that match INVALID,
>> including invalid combinations of TCP flags, seem to be an "active
>> match" instead of a "passive default."  In other words, if the state
>> starts as INVALID, and conntrack determines that it should be state
>> NEW, something somehow must be applied afterwards to force it back to
>> INVALID due to it being a malformed packet. 
>
>It depends on how one looks at conntrack and it's relation with the other 
>parts of netfilter. I'd not say that "every packet starts with the state 
>INVALID".

Well yes, I had already considered skb_copy in my back-head, but I
put it off as a developer thing, because if you have not looked into
code, you don't really know whether ipt_REJECT copies the packet and
resets/truncates it or creates a new one from scratch, then copies.
(Answer: in the timeline of Linux, both ways have been tried
already.)

>Of course the state of the packet *before* conntrack invoked is 
>INVALID, but what else could it be, if conntrack hadn't got a chance yet 
>to associate a state to the packet?

In case of skb_copy, that would be oldskb->nfct* :-)

>The current documentations try to describe the states so that it does not 
>need a deep TCP/IP knowledge from the readers. A rough description on how 
>a packet traverses conntrack and what state are associated to it could be 
>the following:
>
>- loopback or untracked packets are ignored

And by loopback, Jozsef does not mean "lo" device transmissions,
but skb->nfct != NULL (happens when passing twice through
nf_conntrack, such as with xfrm).

