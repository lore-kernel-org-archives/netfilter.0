From: Andres Velasco Garcia <telecom.andresvelasco@hotmail.com>
Subject: RE: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
Date: Mon, 16 Jan 2012 16:59:37 +0100
Message-ID: <BLU162-W269926CEBF832473FD39A4F6830@phx.gbl>
References: <BLU162-W1607A553582A18B27146E4F6830@phx.gbl>,<alpine.LNX.2.01.1201161312560.4466@frira.zrqbmnf.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-owner@vger.kernel.org>
In-Reply-To: <alpine.LNX.2.01.1201161312560.4466@frira.zrqbmnf.qr>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: jengelh@medozas.de
Cc: netfilter@vger.kernel.org


Please let me explain; 

I actually had compiled and run netfilter_queue successfully.

My only concern was that the 1.0.1 source I downloaded from netfilter.org included the following header:

#include <libnfnetlink/linux_nfnetlink.h>

while my Centos 6.2 system featured the following one (after installing nfnetlink packages): 

#include <linux/netfilter/nfnetlink.h>

So I was wondering if the first one (linux_nfnetlink.h) was a result of some error or maybe it depends on the distros.

Thanks for your attention



Andres Velasco
M: +34 670 40 73 69
Skype: newwwave.andres.velasco


----------------------------------------
> Date: Mon, 16 Jan 2012 13:18:15 +0100
> From: jengelh@medozas.de
> To: telecom.andresvelasco@hotmail.com
> CC: netfilter@vger.kernel.org
> Subject: Re: Failed to compile libnetfilter_queeu 1.0.1 under Centos 6.2
>
> On Monday 2012-01-16 12:22, Andres Velasco Garcia wrote:
>
> >I could not find a netfilter_queue RPM for Centos 6.2
>
>
> As major contributor to iptables and opensuse maintainer for their
> security:netfilter subproject, I also try keeping around builds for
> other distros.
> http://dl.medozas.de/repos/netfilter/CentOS_6/
>
> >../include/libnetfilter_queue/linux_nfnetlink_queue.h:8:42: error:
> >libnfnetlink/linux_nfnetlink.h: No such file or directory
> >solved using
> >//#include <libnfnetlink/linux_nfnetlink.h>

> >#include <linux/netfilter/nfnetlink.h>


> >Am I missing something?
>
> Are you missing libnfnetlink, perhaps?
> --
> To unsubscribe from this list: send the line "unsubscribe netfilter" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at http://vger.kernel.org/majordomo-info.html
 		 	   		  