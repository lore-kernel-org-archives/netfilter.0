From: Jan Engelhardt <jengelh@medozas.de>
Subject: Re: Help tweaking asterisk rules
Date: Sun, 4 Mar 2012 08:10:47 +0100 (CET)
Message-ID: <alpine.LNX.2.01.1203040810190.1405@frira.zrqbmnf.qr>
References: <450EB7580E6AE7469F8826BFBF09BAB6761D15@earwax.uent.com> <jiurm5$m0i$1@dough.gmane.org>
Mime-Version: 1.0
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <jiurm5$m0i$1@dough.gmane.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Kerin Millar <kerframil@gmail.com>
Cc: netfilter@vger.kernel.org

On Sunday 2012-03-04 05:39, Kerin Millar wrote:

> On 21/01/2011 02:05, Max DiOrio wrote:
>> I was also hoping someone can provide some guidance on leaving the RTP
>> ports UDP 10000:20000 open to all IP's on the WAN.  What type of
>> security issue will this raise?  Should I install Fail2Ban in this
>> setup?  The only issue I have with Fail2Ban was that it blocked my
>> access from the LAN within 15 seconds of it coming online.
>
> They needn't be open at all. Instead, load the the ip_conntrack_sip module and
> ensure that your iptables policy is stateful.
>
> http://www.iptel.org/sipalg/

This is all outdated material. It's nf_conntrack_sip and has been long 
merged into the kernel already.
