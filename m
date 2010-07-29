From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Synflood filtering and Conntrack
Date: Thu, 29 Jul 2010 14:49:41 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1007291448450.15281@obet.zrqbmnf.qr>
References: <4C4F5DCE.2060304@conversis.de> <4C4FBF16.50203@chello.at> <alpine.LSU.2.01.1007280756510.26636@obet.zrqbmnf.qr> <4C5161E2.8020407@chello.at> <alpine.LSU.2.01.1007291315440.2646@obet.zrqbmnf.qr> <4C516687.6060602@chello.at>
 <4C517559.2030702@plouf.fr.eu.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4C517559.2030702@plouf.fr.eu.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@vger.kernel.org, "Dennis J." <dennisml@conversis.de>, pablo@netfilter.org

On Thursday 2010-07-29 14:34, Pascal Hambourg wrote:
>>> Trying 127.0.0.1...
>>>      [NEW] tcp      6 120 SYN_SENT src=127.0.0.1 dst=127.0.0.1
>>> sport=59734 dport=23 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1 sport=23
>>> dport=59734
>>>
>>> ...seconds later...
>>> # conntrack -L | grep =23
>>> conntrack v0.9.14 (conntrack-tools): 12 flow entries have been shown.
>>> tcp      6 97 SYN_SENT src=127.0.0.1 dst=127.0.0.1 sport=59734
>>> dport=23 packets=1 bytes=60 [UNREPLIED] src=127.0.0.1 dst=127.0.0.1
>>> sport=23 dport=59734 packets=0 bytes=0 mark=0 secmark=0 use=2
>>>
>>> 2 minutes it is.
>
>That's because it is a locally generated connection, so the conntrack
>confirm takes place after POSTROUTING. Even though the packet is dropped
>in INPUT after it is looped back, the conntrack entry is already
>confirmed. Now try again with the DROP rule in OUTPUT, or from a remote
>host.

But the ct entry must undoubtly exist to be able to match -m conntrack 
--ctstate NEW. Perhaps it's just that conntrack(8) won't show it?

