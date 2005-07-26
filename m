From: Marcin Giedz <marcin.giedz@eulerhermes.pl>
Subject: Re: TOS problem
Date: Tue, 26 Jul 2005 12:58:08 +0200
Message-ID: <200507261258.08378.marcin.giedz@eulerhermes.pl>
References: <200507251448.41773.marcin.giedz@eulerhermes.pl>
	<42E4F664.70801@mnemon.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42E4F664.70801@mnemon.de>
Content-Disposition: inline
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

Hello,

> Your providing too little information, so nobody can help you - even if
> he/she desired to do so.
Maybe your are right.. I will try once again.

In my office we have 2 gateways. One of them GATEWAY1 is connected to one ISP1 
and it is also default gateway for almost all of our servers. I said "almost" 
because there is one server "service" where default gateway is GATEWAY2 
connected to another ISP2.

All of our customers run Services situated on "service" server  via GATEWAY2. 
But if GATEWAY2 is down or connection to ISP2 is broken I would like that 
customers can still connect to Services via GATEWAY1. So I need some kind of 
redirection on GATEWAY1 because I don't want to switch default gateway on 
"service" manually. However if GATEWAY2 is running OK some part of our 
customers can still run Services via GATEWAY1. My problem is:
how to route connections to "service" server passed via GATEWAY1? 
Packets MARK'ing work within kernel so can be used. Another way is changing 
TOS on GATEWAY1 for "these" packets and route them to "service".  

According to TOS description:
"The TOS target is used to set the Type of Service field within the IP header. 
The TOS field consists of 8 bits which are used to help in routing packets. 
This is one of the fields that can be used directly within iproute2 and its 
subsystem for routing policies. Worth noting, is that that if you handle 
several separate firewalls and routers, this is the only way to propagate 
routing information within the actual packet between these routers and 
firewalls. As previously noted, the MARK target - which sets a MARK 
associated with a specific packet - is only available within the kernel, and 
can not be propagated with the packet. If you feel a need to propagate 
routing information for a specific packet or stream, you should therefore set 
the TOS field, which was developed for this. "

So I changed TOS on GATEWAY1 to 0x10 and used is as "mark". TOS changing work 
OK on GATEWAY1, even on outgoing interface but on "service" server TOS value 
is still 0x0. So I can't route packets on "service" server back to GATEWAY1.

Maybe I try to do something REALLY strange but can't imagine another solution.

Thanks,
Marcin

