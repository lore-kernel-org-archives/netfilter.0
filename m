From: Chad M Stewart <cms@Balius.com>
Subject: DNAT back to onself
Date: Mon, 27 Jan 2003 23:26:03 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <9CCB9752-3278-11D7-B813-0003939E0046@Balius.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org


I am finally getting around to building myself a new firewall, based on 
iptables.  Though my older ipchains firewall is still doing well. :)

Thank you Rusty for separating out the traffic which is bound for the 
firewall itself vs. traffic which is simply passing through!  Setting 
the default policy to drop forces one to really examine just what 
communication a box needs to do.

I'm running squid as a transparent proxy on the machine.  I am using 
DNAT to redirect incoming requests to port 80 to a server on the 
inside.  This works great coming from the external world.  Coming from 
behind the firewall the request is routed to squid (via redirect), 
squid then attempts to make a connection on the loopback device. This 
fails.  I've setup the loopback devices to accept all traffic, but alas 
this does not work.  In the 2.2.x series it was a routing thing.  Might 
this still be the case in the 2.4.x series kernels?  If so, how do I go 
about getting it to work?

When squid resolves the name I put in my browser the IP returned is the 
address assigned to the external interface.  Squid returns connection 
refused.

Here is some of a tcpdump of the lo

23:02:15.855428 24.24.63.87.2386 > 24.24.63.87.80: S 
3039158100:3039158100(0) win 32767 <mss 16396,sackOK,timestamp 1978851 
0,nop,wscale 0> (DF)
23:02:15.855469 24.24.63.87.80 > 24.24.63.87.2386: R 0:0(0) ack 
3039158101 win 0 (DF)
23:02:15.855710 24.24.63.87.2387 > 24.24.63.87.80: S 
3038035295:3038035295(0) win 32767 <mss 16396,sackOK,timestamp 1978851 
0,nop,wscale 0> (DF)
23:02:15.855751 24.24.63.87.80 > 24.24.63.87.2387: R 0:0(0) ack 
3038035296 win 0 (DF)
23:02:15.856084 24.24.63.87.2388 > 24.24.63.87.80: S 
3034028253:3034028253(0) win 32767 <mss 16396,sackOK,timestamp 1978851 
0,nop,wscale 0> (DF)
23:02:15.856128 24.24.63.87.80 > 24.24.63.87.2388: R 0:0(0) ack 
3034028254 win 0 (DF)
23:02:15.856378 24.24.63.87.2389 > 24.24.63.87.80: S 
3035198728:3035198728(0) win 32767 <mss 16396,sackOK,timestamp 1978851 
0,nop,wscale 0> (DF)
23:02:15.856421 24.24.63.87.80 > 24.24.63.87.2389: R 0:0(0) ack 
3035198729 win 0 (DF)
23:02:15.856665 24.24.63.87.2390 > 24.24.63.87.80: S 
3031917249:3031917249(0) win 32767 <mss 16396,sackOK,timestamp 1978851 
0,nop,wscale 0> (DF)
23:02:15.856711 24.24.63.87.80 > 24.24.63.87.2390: R 0:0(0) ack 
3031917250 win 0 (DF)


Any help/pointers greatly appreciated.

Thanks,
Chad

ps - due to lack of interest, I think I'll probably nuke the ipchains 
mailing list.






