From: Pablo Neira Ayuso <pablo@netfilter.org>
Subject: Re: conntrack-tools 0.9.14 can not block the connection
Date: Fri, 07 May 2010 21:14:35 +0200
Message-ID: <4BE4669B.4030904@netfilter.org>
References: <201005061651.40203.rfeng@wurldtech.com> <alpine.LSU.2.01.1005070954230.32277@obet.zrqbmnf.qr> <201005070917.27301.rfeng@wurldtech.com> <alpine.LSU.2.01.1005071823100.23210@obet.zrqbmnf.qr> <4BE46649.1040703@netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <4BE46649.1040703@netfilter.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Jan Engelhardt <jengelh@medozas.de>
Cc: Richard Feng <rfeng@wurldtech.com>, "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

Pablo Neira Ayuso wrote:
> Jan Engelhardt wrote:
>> On Friday 2010-05-07 18:17, Richard Feng wrote:
>>
>>>> >From the documentation (from conntrack-tools.netfilter.org),
>>>>> somewhere it says that "have to set
>>>>> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to
>>>>> zero".There is simply no 'netfilter' folder under my folder
>>>>> '/proc/sys/net/ipv4'. Is this the problem? How could I fix it?
>>> So 'conntrack -D' can not really cut current connections?  It can
>>> only delete entry from the state table? I just want to make sure -
>> >from the document
>>> "http://conntrack-tools.netfilter.org/manual.html#conntrack". It
>>> clearly said "Delete on entry, this can be used to block traffic
>>> (you have to set
>>> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to zero)".
>> The documentation seems to be off here. If you only delete a ct
>> entry, the next packet (even if a TCP ACK or something) will make
>> a new ct with NEW as a ctstate.
>>
>> To really have a TCP/SCTP connection blocked after deletion of the ct 
>> entry, you have to only allow NEW ctstates with the initla TCP/SCTP 
>> packet (SYN/INIT).
> 
> Yes, you need a well-formed stateful rule-set "to cut" the connection
> (at least you have to add a rule to block traffic in INVALID stats).

With "stats" I meant "state", and liberal tracking must be disabled as said.
