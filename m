From: "Eric B." <ebenze@hotmail.com>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 14:15:44 -0400
Message-ID: <ftgcoq$512$1@ger.gmane.org>
References: <fteoq6$ipr$1@ger.gmane.org> <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr> <ftflon$5ns$1@ger.gmane.org> <alpine.LNX.1.10.0804081359450.17722@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Jan Engelhardt" <jengelh@computergmbh.de> wrote in message
news:alpine.LNX.1.10.0804081359450.17722@fbirervta.pbzchgretzou.qr...
>
> On Tuesday 2008-04-08 13:42, Eric B. wrote:
>>>
>>>>From what someone on the comp.os.linux.networking group told me, only
>>>>the
>>>>nat tables only see the first new packet of every connection,[...]
>>>
>>> Yes, the _first_ packet. But an ICMP reply (it also applies to TCP SYN
>>> ACK)
>>> is not the first(*). See the output of the LOGMARK target on
>>> -t mangle -A POSTROUTING -p icmp -d <desktop>:
>>>
>>> Apr  8 11:15:31 sovereign kernel: [1415558.389017] hook=POSTROUTING
>>> nfmark=0x0
>>> secmark=0x0 classify=0x0 ctdir=REPLY ct=0xffff81007674c380 ctmark=0x0
>>> ctstate=ESTABLISHED ctstatus=SEEN_REPLY,CONFIRMED
>>>
>>> Do you see "ctstate=NEW" anywhere? I don't! :-)
>>
>>Sorry, but what is the LOGMARK target?  I can't seem to find that target
>>anywhere in the docs or the man pages.  I've seen the LOG target and the
>>MARK target, but not sure what the LOGMARK target is.
>
> Similar to LOG but instead of dumping the packet data, it dumps the
> associated Netfilter metastructures.

I'm not sure I follow.  I'm using iptables v1.2.11, and I've tried the
following command, but as I feared, LOGMARK is an unknown target for my 
version.  Is there a way to get the logmark target for my version, or do I 
need to update the entire package?

I'm running RHEL4.2 with kernel 2.6.9-67.0.4.ELsmp

# iptables -t mangle -I POSTROUTING -p icmp -j LOGMARK
iptables v1.2.11: Couldn't load target
`LOGMARK':/lib/iptables/libipt_LOGMARK.so: cannot open shared object file:
No such file or directory


Does Xtables completely replace the iptables package?  Do precompiled 
binaries exist for it?

Thanks,

Eric




