From: Steven M Campbell <Netfilter@SCampbell.net>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Wed, 04 May 2005 13:18:23 -0400
Message-ID: <427903DF.5030707@SCampbell.net>
References: <4278C3DE.7010403@au-kbc.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4278C3DE.7010403@au-kbc.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: iptables <netfilter@lists.netfilter.org>

bharathi wrote:

>Hi all,
>        I am planning to implement iptables log feature on a server
>machine(Dual xeon processor,Intel e100 cards,80GB SCSI and 2GB RAM)
>which is running in bridge mode (On RH 7.3).The average traffic on this
>machine is vary from 40-60Mbps.Hence I require some suggestion for some
>my questions like,
>
>1) On this High traffic the kernel will be stable/crash ?
>2) What would be the CPU Load and the server is able to do this job
>without any pain ?
>3) Up to how much traffic the iptables/kernel can able to handle without
>any issue and what should I do additionally if I need the
>   iptable-log should handle this much traffic?
>
>
>Advance thanks for your suggestion and pointers.
>
>bharthix.   
>         
>  
>
Along with other advice offered, you may wish to take a look at argus 
and ntop which are packages that collect nice summary information from 
ethernet traffic.  They may be appropos to your goal.


