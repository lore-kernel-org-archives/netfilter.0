From: "Eric B." <ebenze@hotmail.com>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 07:42:17 -0400
Message-ID: <ftflon$5ns$1@ger.gmane.org>
References: <fteoq6$ipr$1@ger.gmane.org> <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr>
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@vger.kernel.org

"Jan Engelhardt" <jengelh@computergmbh.de> wrote in message
news:alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr...
>
>>From what someone on the comp.os.linux.networking group told me, only the
>>nat tables only see the first new packet of every connection,[...]
>
> Yes, the _first_ packet. But an ICMP reply (it also applies to TCP SYN
> ACK)
> is not the first(*). See the output of the LOGMARK target on
> -t mangle -A POSTROUTING -p icmp -d <desktop>:
>
> Apr  8 11:15:31 sovereign kernel: [1415558.389017] hook=POSTROUTING
> nfmark=0x0
> secmark=0x0 classify=0x0 ctdir=REPLY ct=0xffff81007674c380 ctmark=0x0
> ctstate=ESTABLISHED ctstatus=SEEN_REPLY,CONFIRMED
>
> Do you see "ctstate=NEW" anywhere? I don't! :-)

Sorry, but what is the LOGMARK target?  I can't seem to find that target
anywhere in the docs or the man pages.  I've seen the LOG target and the
MARK target, but not sure what the LOGMARK target is.  Furthermore, how did
you manage to get that log output from the POSTROUTING table, if the
response packet doesn't traverse it?

I'm assuming you are using some advanced debugging features?  Where can I
find out more about those?

Thanks!

Eric






