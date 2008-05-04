From: "Michael Smith" <mike@smithware.net>
Subject: RE: iptables: Chain already exists
Date: Sun, 4 May 2008 15:41:46 -0400
Message-ID: <25B55FAF61C3FC4982E3F53856890731214B51@mail.smithware.net>
References: <5add45eb0805041140l5b77ca78u92ad78103d2da45d@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: Georgecooldude <georgecooldude@gmail.com>, netfilter@vger.kernel.org

Try 
iptables -X LOGDROP
And
iptables -X LOGACCEPT
Respectively, prior the -N lines below

> -----Original Message-----
> From: netfilter-owner@vger.kernel.org 
> [mailto:netfilter-owner@vger.kernel.org] On Behalf Of Georgecooldude
> Sent: Sunday, May 04, 2008 2:40 PM
> To: netfilter@vger.kernel.org
> Subject: iptables: Chain already exists
> 
> Hi all
> 
> In my iptables script I have the following chains:
> 
> # ---LET MAKE SOME CHAINS---
>  #...[LOGDROP]...
>  iptables -N LOGDROP
>  iptables -A LOGDROP -j LOG
>  iptables -A LOGDROP -j DROP
>  #...[LOGACCEPT]...
>  iptables -N LOGACCEPT
>  iptables -A LOGACCEPT -j LOG
>  iptables -A LOGACCEPT -j ACCEPT
> 
> 
> When I re-apply (./iptables.script) I get the following error
> iptables: Chain already exists
> iptables: Chain already exists
> 
> Tried flushing the rules first then re-running and I always 
> get that error. I guess something is wrong with the chain. 
> Can someone more experienced explain what the issue here is? 
> I'm primarily from a Cisco PIX background and just started on 
> iptables.
> 
> BTW the OS is ubuntu 6.02 server edition.
> 
> Thanks in advance
> 
> George
> --
> To unsubscribe from this list: send the line "unsubscribe 
> netfilter" in the body of a message to 
> majordomo@vger.kernel.org More majordomo info at  
> http://vger.kernel.org/majordomo-info.html
> 
> No virus found in this incoming message.
> Checked by AVG. 
> Version: 7.5.524 / Virus Database: 269.23.8/1413 - Release 
> Date: 5/3/2008 11:22 AM
>  
> 

No virus found in this outgoing message.
Checked by AVG. 
Version: 7.5.524 / Virus Database: 269.23.8/1413 - Release Date: 5/3/2008 11:22 AM
 
