From: John Lash <jkl@sarvega.com>
Subject: Re: iptables for port forwarding
Date: Tue, 30 Nov 2004 07:26:57 -0600
Message-ID: <20041130072657.5acc7264@homer.sarvega.com>
References: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041130005154.6978.qmail@web11204.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

> I tried doing this:
> /sbin/iptables -A FORWARD -p tcp --dport 80 -j ACCEPT 
> /sbin/iptables -t nat -A PREROUTING -p tcp --dport 80 -i eth0 -j DNAT
> --to 127.0.0.1:5900 
> 
> But the VNC client hangs for a while before timing out when I try to
> connect to it.
> 
> Ideas on how to achieve the desired result?
> 
> Thanks,
> 
> Nick
> 

I suspect that you won't be able to redirect to 127.x.x.x. Check out this
thread:
	https://lists.netfilter.org/pipermail/netfilter/2002-November/040104.html

He comes to the conclusion that you can't redirect packets to localhost because
the kernel refuses to route a packet from an external ip to a destination on the
127.x.x.x network. I haven't yet verified that in the code but it sounds
reasonable enough.

I played with something similar for a while and was also unsuccessful. Needless
to say, if you find a way to do this, short of hacking the routing code, please
post back. Seems to be a fairly common wish.

The usual way to forward the port to localhost is to use ssh. There are many
references to that on the net.

--john

