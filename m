From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 14:17:28 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804081359450.17722@fbirervta.pbzchgretzou.qr>
References: <fteoq6$ipr$1@ger.gmane.org> <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr> <ftflon$5ns$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <ftflon$5ns$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-08 13:42, Eric B. wrote:
>>
>>>From what someone on the comp.os.linux.networking group told me, only the
>>>nat tables only see the first new packet of every connection,[...]
>>
>> Yes, the _first_ packet. But an ICMP reply (it also applies to TCP SYN
>> ACK)
>> is not the first(*). See the output of the LOGMARK target on
>> -t mangle -A POSTROUTING -p icmp -d <desktop>:
>>
>> Apr  8 11:15:31 sovereign kernel: [1415558.389017] hook=POSTROUTING
>> nfmark=0x0
>> secmark=0x0 classify=0x0 ctdir=REPLY ct=0xffff81007674c380 ctmark=0x0
>> ctstate=ESTABLISHED ctstatus=SEEN_REPLY,CONFIRMED
>>
>> Do you see "ctstate=NEW" anywhere? I don't! :-)
>
>Sorry, but what is the LOGMARK target?  I can't seem to find that target
>anywhere in the docs or the man pages.  I've seen the LOG target and the
>MARK target, but not sure what the LOGMARK target is.

Similar to LOG but instead of dumping the packet data, it dumps the
associated Netfilter metastructures.

>  Furthermore, how did
>you manage to get that log output from the POSTROUTING table, if the
>response packet doesn't traverse it?

It's from the mangle table, the table directly traversed before.
(as packets from ESTABLISHED connections do not traverse nat)

>I'm assuming you are using some advanced debugging features?  Where can I
>find out more about those?

http://jengelh.hopto.org/projects/xtables/

