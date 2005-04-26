From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: RE: queue newbie
Date: Mon, 25 Apr 2005 21:02:32 -0400
Message-ID: <000301c549fb$a6facb40$2801a8c0@MBRC40>
References: <426CF19F.1060004@au-kbc.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <426CF19F.1060004@au-kbc.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: bharathi@au-kbc.org
Cc: 'netfilter' <netfilter@lists.netfilter.org>

Thank you for this help.  Additionally, 
From where do I download the latest iptables src?
How do I enable CONFIG_IP_NF_QUEUE?
In Red Hat Workstation, where is <where-you-built-your-kernel>?
Thanks again,
Mike.

--
Michael D. Berger
m.d.berger@ieee.org 

> -----Original Message-----
> From: bharathi [mailto:bharathi@au-kbc.org] 
> Sent: Monday, April 25, 2005 9:33 AM
> To: Michael D. Berger
> Cc: netfilter
> Subject: Re: queue newbie
> 
> 
> Dear Mr.Berger,
>                             Download the latest version of 
> iptables src 
> and do the following to get libipq,
>   # make KERNEL_DIR=<<where-you-built-your-kernel>>
>   # make install KERNEL_DIR=<<where-you-built-your-kernel>>
>   # make install-devel
> IMPORTANT:  Your kernel  must have enabled with the  
> CONFIG_IP_NF_QUEUE 
> ( Userspace queueing via NETLINK (EXPERIMENTAL) ) module to use this 
> queueing feature with iptables.
> 
> thanks,
> bharthix.
> 
> 
> Michael D. Berger wrote:
> 
> >On RH-WS-3 (4 when I get around to it), I would like
> >to use the capabilities of -j QUEUE.  Google seems to
> >indicate that I need libipq, and to get this, perhaps
> >I need to get an rpm for iptables-devel.
> >
> >Is this the way to go?  If so, where is the best place
> >to get the rpm, and what version should I get?  If not,
> >how should I proceed?
> >
> >Thanks in advance for your help.
> >Mike.
> >
> >--
> >Michael D. Berger
> >m.d.berger@ieee.org 
> >
> >
> >
> >
> >  
> >
> 
> 



