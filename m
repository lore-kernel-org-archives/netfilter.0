From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: iptables u32 tests and user logging
Date: Mon, 21 Jul 2008 18:49:52 +0200 (CEST)
Message-ID: <alpine.LNX.1.10.0807211848360.21244@fbirervta.pbzchgretzou.qr>
References: <76fdae320807202313ma67d4c3l1921e41fa962a976@mail.gmail.com>  <76fdae320807202315mb59c131s5f4c52f350d31aca@mail.gmail.com>  <alpine.LNX.1.10.0807210942340.21244@fbirervta.pbzchgretzou.qr>  <4884ADDC.7000600@riverviewtech.net>
 <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <76fdae320807210941p39dc17b6i1e4e3e75592c7b6b@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Padmanabhan <rpdumps@gmail.com>
Cc: netfilter@vger.kernel.org


On Monday 2008-07-21 18:41, Padmanabhan wrote:

>Hello, Jan,
>I came up with following  u32 rule ,,should I not multiply by 4 for
>TCP header length to get the offset , as we do for the IP header ?

Right, I probably missed out on that. I do not use u32 that often,
but I am happy to see someone use it at all :-)

>iptables -m u32 --u32 " 0>>22&0x3C@12>>26&0x3C@0&0xFF000000=0x01
>&&
>0>>22&0x3C@12>>26&0x3C@16=0x00000000:0xFFFFFFFF" -j ulog
>
>for TOS bits set packet, I am inspecting first byte of TCP payload and

Well for TOS, I used -m tos for sheer readability of the match but
of course you are free to use u32 for that too to save the memory
that would otherwise be required by xt_tos.

>if that matches, need to record/log value from 16-19 in the TCP
>payload. Since a test has to be made, i just compared those byte value
>to be in the range of all 0's to all FF's.. which obviously it would
>be ...So, with this test done, the action I would like to do is log
>those four byte value .
>
>1. My requirement is as stated by Grant, just need to log those four
>bytes ( ITT value) from the iscsi header. Is there any options in
>linux space ? With u32 I came so close, yet it was not able to fulfill
>it.

u32 is just a match, not a log-this-and-that target.
