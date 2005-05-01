From: "Michael D. Berger" <m.d.berger@ieee.org>
Subject: RE: queue newbie
Date: Sat, 30 Apr 2005 23:31:44 -0400
Message-ID: <000001c54dfe$4f4597c0$2801a8c0@MBRC40>
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
To: 'netfilter' <netfilter@lists.netfilter.org>

I have upgraded to RH-E-WS-4, and downloaded and installed the
latest iptables as described below.  In C++, I wrote some code
following the suggestions in:
   http://www.crhc.uiuc.edu/~grier/projects/libipq.html
To get it to compile, I had to do some hacking in:
   linux/socket.h
   bits/socket.h
   bits/uio.h
to deal with multiple definitions, but I got it to compile.
However, it does not work; my code waits but does not receive
the icmp pings I send it.
I note that I do not have an environment variable QUEUE.  I
could provide one, but this might be taking an asperin for
cancer.
Advice would be much appreciated.
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



