From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 7 May 2010 21:46:57 +0200 (CEST)
Message-ID: <alpine.LSU.2.01.1005072144530.31492@obet.zrqbmnf.qr>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <201005070917.27301.rfeng@wurldtech.com> <alpine.LSU.2.01.1005071823100.23210@obet.zrqbmnf.qr> <4BE46649.1040703@netfilter.org>
 <4BE4669B.4030904@netfilter.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE4669B.4030904@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Pablo Neira Ayuso <pablo@netfilter.org>
Cc: Richard Feng <rfeng@wurldtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>


On Friday 2010-05-07 21:14, Pablo Neira Ayuso wrote:
>>> The documentation seems to be off here. If you only delete a ct
>>> entry, the next packet (even if a TCP ACK or something) will make
>>> a new ct with NEW as a ctstate.
>>>
>>> To really have a TCP/SCTP connection blocked after deletion of the ct 
>>> entry, you have to only allow NEW ctstates with the initla TCP/SCTP 
>>> packet (SYN/INIT).
>> 
>> Yes, you need a well-formed stateful rule-set "to cut" the connection
>> (at least you have to add a rule to block traffic in INVALID stats).
>
>With "stats" I meant "state", and liberal tracking must be disabled as said.

Which is the default anyway. :-)

I think what was really meant was tcp_loose, not tcp_be_liberal.
Anyway, I don't want to give bad hints. It's better to
use a restrictive ruleset than tweaking sysctls.
