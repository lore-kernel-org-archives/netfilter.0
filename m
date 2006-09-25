From: "Stuart Clouston" <uncystu@hotmail.com>
Subject: RE: Kernel 2.6.18 and quota match
Date: Mon, 25 Sep 2006 12:24:20 +1000
Message-ID: <BAY108-F265310C9580392B774E0A3BC240@phx.gbl>
References: <BAY103-F17F1A57863422A66812347B2210@phx.gbl>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY103-F17F1A57863422A66812347B2210@phx.gbl>
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: pupilla@hotmail.com
Cc: netfilter@lists.netfilter.org

Hi Marco,

Thanks for your reply.

>From: "Marco Berizzi" <pupilla@hotmail.com>
>To: uncystu@hotmail.com
>CC: netfilter@lists.netfilter.org
>Subject: RE: Kernel 2.6.18 and quota match
>Date: Fri, 22 Sep 2006 17:26:02 +0200
>
>>Thanks for your reply.  I have tried both the standard download available 
>>from the netfilter website (dated 1st Feb 2006) and iptables snapshot 
>>(20060902) with no difference.
>
>mhhh...
>This is my extensions test result:
>
>Extensions found: IPv4:CLUSTERIP IPv4:connbytes IPv4:dccp IPv4:quota 
>IPv4:recent IPv4:statistic IPv4:string IPv6:REJECT IPv6:ah IPv6:esp 
>IPv6:frag IPv6:ipv6header IPv6:hbh IPv6:dst IPv6:rt
>
>When you compile iptables snapshot are you able to see IPv4:quota?
>If you don't see it, you should update your kernel headers to 2.6.18
>
>
I have downloaded the latest iptables snapshot (20060924) and compiled it.  
I do see IPv4:quota so long as I have applied the patch included with 
patch-o-matic-ng(20060511).  If I do not apply that patch to the kernel, 
iptables doesn't include IPV4:quota when I compile it.
With kernel 2.6.18, should I still need patch-o-matic-ng to get the quota 
match?

I have made sure that I have the latest version of linux-kernel-headers 
(2.6.11.2) available for my distro of linux (Ubuntu5.10 - Breezy Badger).  
According to what I have read on the net, if I compile my kernel with the 
"-I /usr/src/linux/include" option it will use the headers that actually 
came with the linux kernel rather than the headers included in the standard 
distrbution package.  Sorry if this sounds like a silly question, but is 
this correct?

Thanks for your help,
Stu

_________________________________________________________________
Express yourself - download free Windows Live Messenger themes! 
http://clk.atdmt.com/MSN/go/msnnkwme0020000001msn/direct/01/?href=http://imagine-msn.com/themes/vibe/default.aspx?locale=en-us&source=hmtagline


