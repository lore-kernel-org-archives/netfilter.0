From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Iptables logs on High bandwidth traffic network
Date: Wed, 04 May 2005 10:59:12 -0500
Message-ID: <4278F150.4000806@riverviewtech.net>
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
To: netfilter@lists.netfilter.org

> Hi all,
>         I am planning to implement iptables log feature on a server
> machine(Dual xeon processor,Intel e100 cards,80GB SCSI and 2GB RAM)
> which is running in bridge mode (On RH 7.3).The average traffic on this
> machine is vary from 40-60Mbps.Hence I require some suggestion for some
> my questions like,
> 
> 1) On this High traffic the kernel will be stable/crash ?
> 2) What would be the CPU Load and the server is able to do this job
> without any pain ?
> 3) Up to how much traffic the iptables/kernel can able to handle without
> any issue and what should I do additionally if I need the
>    iptable-log should handle this much traffic?

There have been people in the past with marginal luck (at best) who tried to have the kernel log packets via the LOG target.  The problem that I think they have run in to in the pas is that the LOG target is (as far as I know and no one has refuted (If I am wrong please do so)) not meant for high volume LOGing of packets.  If you are wanting to log all traffic that passes through the box you would probably want to look at using TCPDump to sniff the network and parse it's out files or look in to something like Snort in one of it's many modes.  The reason that LOG is not meant for high volume logging is that it relies on SysLog to log it's data which in and of it's self is not meant for high volume longing.  SysLog will quite often become disk bound if you try to log such high volumes to it and thus the system will sort of flounder and snow ball in on it's self.  Further you will not see t
 he log events that this is happening b/c they themselves will not get logged b/c SysLog i
s backed up.  You may have more luck looking at ULOG but as I have not messed with it I can't say one way or the other.

(This is all speculation on my part and I have little to no hands on experience doing this.  However I have talked with many people who have been in this situation and they back up what I'm saying.  So your mileage may vary.)



Grant. . . .

