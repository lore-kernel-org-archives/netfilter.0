From: Jan Engelhardt <jengelh@computergmbh.de>
Subject: Re: Packets not traversing the POSTROUTING table?
Date: Tue, 8 Apr 2008 11:26:10 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0804081121460.17722@fbirervta.pbzchgretzou.qr>
References: <fteoq6$ipr$1@ger.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <fteoq6$ipr$1@ger.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: "Eric B." <ebenze@hotmail.com>
Cc: netfilter@vger.kernel.org


On Tuesday 2008-04-08 05:27, Eric B. wrote:
>
>I have added a very simple rule in my POSTROUTING nat table to log all
>packets, but the packets I am looking to find don't show up in my log file.
>If I initiate the packets from the machine itself, (eg: ping www.yahoo.com),
>then I see those packets show up.  However, if the machine is simply
>responding to packets[...], they don't show up in the POSTROUTING table.  I'll see
>the packets show up in the log statement from the OUTPUT filter table, but
>not in the POSTROUTING nat table.
[...]
From what someone on the comp.os.linux.networking group told me, only the 
>nat tables only see the first new packet of every connection,[...]

Yes, the _first_ packet. But an ICMP reply (it also applies to TCP SYN ACK)
is not the first(*). See the output of the LOGMARK target on
-t mangle -A POSTROUTING -p icmp -d <desktop>:

Apr  8 11:15:31 sovereign kernel: [1415558.389017] hook=POSTROUTING nfmark=0x0
secmark=0x0 classify=0x0 ctdir=REPLY ct=0xffff81007674c380 ctmark=0x0
ctstate=ESTABLISHED ctstatus=SEEN_REPLY,CONFIRMED

Do you see "ctstate=NEW" anywhere? I don't! :-)




(*) That is, unless you manage to flush the conntrack tables between
reception of the packet and the kernel generating the reply.
