From: Ben Russo <ben@umialumni.com>
Subject: Re: weird interface !
Date: 05 Nov 2002 11:55:47 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036515355.8715.48.camel@ben.mis.tnsi.com>
References: <F1727WxS6brk1aRcC8a00003047@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F1727WxS6brk1aRcC8a00003047@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

On Tue, 2002-11-05 at 11:41, web master wrote:
> 
> 
> 
> hello
> i'm running a redhat machine and while checking
> [root@localhost root]# ifconfig -a
...
> tunl0     Link encap:IPIP Tunnel  HWaddr
>           NOARP  MTU:1480  Metric:1
>           RX packets:0 errors:0 dropped:0 overruns:0 frame:0
>           TX packets:0 errors:0 dropped:0 overruns:0 carrier:0
>           collisions:0 txqueuelen:0
>           RX bytes:0 (0.0 b)  TX bytes:0 (0.0 b)
> 
> i see tunl0 and i dont know who made it and why is it there its always 0.0 b 
> and its always there even if ppp0 isnt up , so i'd like to investigate this 
> , is my machine compromised or a software made it , please help me with it .

This looks like a virtual network interface created by the tun.o kernel
module.

Check the output of 'lsmod' and see if you see any modules with "tun" in
the name.  You can also do a search on Google for "vtund"

-Ben.


