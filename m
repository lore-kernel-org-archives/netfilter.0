From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: High ksoftirqd CPU load, high latency
Date: Fri, 2 Mar 2012 13:03:29 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1203021301480.14538@frira.zrqbmnf.qr>
References: <4F50981E.8020107@allenta.com> <jiqc9s$245$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jiqc9s$245$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kerin Millar <kerframil@gmail.com>
Cc: netfilter@vger.kernel.org


On Friday 2012-03-02 12:52, Kerin Millar wrote:
> On 02/03/2012 09:51, Roberto Suarez Soto wrote:
>>     we've got a load problem in a firewall we administer, and we
>> believe it could be related to iptables. But we don't know for sure, and
>> don't know either how to confirm or deny it. I'm quite at a loss, and
>> would like to get the list's opinion/ideas/voodoo magic/hints on the
>> issue. Thanks in advance!
>>
>>     The symptoms are:
>>
>>     - High ksoftirqd load in one CPU (the one assigned to the LAN
>> ethernet's IRQ)
>
> For this issue, I've found that irqbalance works wonders. I recommend using
> version 1.0 or greater and running it as a daemon.

Better is irqd, which claims to have specific understanding of RPS/RFS/MQ.
https://github.com/vaesoo/irqd
