From: Bgs <bgs@bgs.hu>
Subject: Re: syn DDoS attack solution
Date: Fri, 01 Jun 2007 11:44:34 +0200
Message-ID: <465FEA82.709@bgs.hu>
References: <465EF582.4070904@bgs.hu> <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <015e01c7a3bf$64fbe7e0$2ef3b7a0$@COM>
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
To: Ric Messier <kilroy@WasHere.COM>
Cc: netfilter@lists.netfilter.org


> This is simply a SYN flood attack. It may or may not be a botnet (though
> saying botnet makes it sound sexier :-) ). A decent SYN flood attack tool
> would randomize the source address anyway. 

Some more info about the attack: All IPs were real IPs otherway the tcp 
handshake wouldn't have made it. The attacker IPs were also consistent. 
They also new about the blocked IPs as after a new bunch of blocked IPs 
we fared OK then they added another bunch new IPs... we played this for 
quite some time...

All connections were in the ESTABLISHED state.

> 
> You should try reading the following as a starting point:
> 
> http://www.securityfocus.com/infocus/1729
> 
> Your second suggestion has been implemented in the TCP/IP stack forever. The
> article above gives guidance on how to tune it in a Linux implementation.

That part is about syncookies, backlog queue and half open timeouts. 
None of them applies here as all connections are legitimate in terms of 
SYN packets and tcp handshake.

How is the handling of ESTABLISHED connections implemented in the TCP/IP 
stack?

