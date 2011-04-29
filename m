From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: can't initialize iptables table `filter'
Date: Fri, 29 Apr 2011 13:05:44 +0200 (CEST)
Message-ID: <alpine.LNX.2.01.1104291305050.2679@obet.zrqbmnf.qr>
References: <642302.28729.qm@web111719.mail.gq1.yahoo.com> <alpine.LNX.2.01.1104291246120.19355@obet.zrqbmnf.qr> <993639.25943.qm@web111704.mail.gq1.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <993639.25943.qm@web111704.mail.gq1.yahoo.com>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Mahmood Naderan <nt_mahmood@yahoo.com>
Cc: "netfilter@vger.kernel.org" <netfilter@vger.kernel.org>

On Friday 2011-04-29 12:50, Mahmood Naderan wrote:

>Thanks for your quick reply. Since the client has invalid IP, it can not access to the internet.
>So from the server I "chroot" the folder where the image exists and installed iptables.

But I talked about the kernel.


>>FATAL: Could not load /lib/modules/2.6.32-24-server/modules.dep: No such file or directory
>>iptables v1.4.4: can't initialize iptables table `filter': iptables who? (do you need to insmod?)
>>Perhaps iptables or your kernel needs to be upgraded.
>
>Make sure you kernel is configured with these enabled, and don't forget 
>to actually provide the modules, if not already built-in, because it 
>does have the looks of a crippled installation, judging from the missing 
>modules.dep.
