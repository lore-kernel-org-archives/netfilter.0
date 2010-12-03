From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: NAT with forwarding to multiple destinations
Date: Fri, 3 Dec 2010 15:28:52 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1012031528250.11961@obet.zrqbmnf.qr>
References: <AANLkTinoWt8qNJKYhyjHbM5oOb-V6_aNAqTm=EJmU1Gn@mail.gmail.com> <alpine.LNX.2.01.1012021430220.5361@obet.zrqbmnf.qr> <AANLkTikqRS-eDLB2Ep=kDVok9FLOpqnDfg45MuFL7sBh@mail.gmail.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <AANLkTikqRS-eDLB2Ep=kDVok9FLOpqnDfg45MuFL7sBh@mail.gmail.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Alberto Quattrini Li <alberto.quattrinili@gmail.com>
Cc: netfilter@vger.kernel.org

On Thursday 2010-12-02 16:17, Alberto Quattrini Li wrote:

>> The multiplexing you want is probably best done with a program that does
>> just that - think of sprucing up rinetd.
>
>As far as I know, all of the programs like that are programs that run
>as a process in the middle, so it introduces an overhead (because they
>are in userspace and have to receive the packet and then process it
>and finally forward it), whereas if it was processed by netfilter it
>would be quicker and more efficient (actually some testing and
>comparisons should be done, but in principle it ought to be so).
>
>However it seems that there doesn't exist any solution in netfilter.
>Can you give me a reference (e.g. documentation and guides) to patch
>netfilter with such functionality?

You could write your own extension, based upon xt_TEE.
