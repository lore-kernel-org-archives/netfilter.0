From: Michael <freeware@adsl-209-204-165-151.sonic.net>
Subject: Re: netfilter resets TCP conversation that was DNATed from the local
 machine to another
Date: Mon, 30 Jun 2003 13:07:10 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3F00986E.4040306@adsl-209-204-165-151.sonic.net>
References: <3EFD10A2.6020807@adsl-209-204-165-151.sonic.net> <20030630020152.GA27602@cannon.eng.us.uu.net> <3EFF9ED5.9070808@adsl-209-204-165-151.sonic.net> <20030630142908.GA29083@cannon.eng.us.uu.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030630142908.GA29083@cannon.eng.us.uu.net>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>, Alistair@nerdnet.ca
Cc: netfilter@lists.netfilter.org

Ramin Dousti wrote:

>What I mean is this:
>
>squid:		ip1:port1
>webserver:	ip2:80
>
>Then what you say is:
>
>packet1:	ip1:port1 -> ip2:80    (SYN)
>packet2:	ip2:80    -> ip1:port1 (SYN ACK)
>packet3:	ip1:port2 -> ip2:80    (RST)
>
>What I'm saying is that the third packet should not be able to tear down
>the connection between ip1:port1 <-> ip2:80  just because the ports are
>different. The TCP stack on ip2 should discard this RST packet...
>
>Again, my question:
>do you see any other packets between ip1:port1 <-> ip2:port2 after the RST
>packet?
>
I see. Here's the configuration, again, for reference:

/------------\ .0.{8,9}     .{0,1}.1 /----------\ 1.2.3.{4,5,6}  (          )
| Web server |---------+-------------| firewall |---------------(  Internet  )
\------------/         |        eth0 |  Squid   | eth1           (          )
                       |             \----------/
/---------\ .1.2       |
| browser |------------/
\---------/

I lied earlier for simplicity. I have multiple addresses on eth1 and on 
the Web server.

I stop and start Squid. I access my domain, xxx.org, from my browser. On 
eth0, I see

10:52:42.684703 192.168.1.2.4358 > 192.168.1.1.squid: S 3347635646:3347635646(0) win 16060 <mss 1460,sackOK,timestamp 54041369 0,nop,wscale 0> (DF)
10:52:42.685601 192.168.1.1.squid > 192.168.1.2.4358: S 3951034191:3951034191(0) ack 3347635647 win 5792 <mss 1460,sackOK,timestamp 77755654 54041369,nop,wscale 0> (DF)
10:52:42.685952 192.168.1.2.4358 > 192.168.1.1.squid: . ack 1 win 16060 <nop,nop,timestamp 54041369 77755654> (DF)
10:52:42.686482 192.168.1.2.4358 > 192.168.1.1.squid: P 1:432(431) ack 1 win 16060 <nop,nop,timestamp 54041369 77755654> (DF)
10:52:42.686801 192.168.1.1.squid > 192.168.1.2.4358: . ack 432 win 6432 <nop,nop,timestamp 77755655 54041369> (DF)

That's my browser querying Squid. On eth1, I see

10:52:42.690711 1.2.3.4.32804 > myisp.domain: 2+ A? xxx.org. [|domain] (DF)
10:52:42.691228 1.2.3.4.32804 > myisp.domain: 3+ A? xxx.org. [|domain] (DF)
10:52:42.710447 myisp.domain > 1.2.3.4.32804: 2* 1/2/2 xxx.org. A 1.2.3.5 (119) (DF)
10:52:42.715838 myisp.domain > 1.2.3.4.32804: 3* 1/2/2 xxx.org. A 1.2.3.5 (119) (DF)

That's Squid looking up my domain. (Why twice? I don't know.) The OUTPUT 
chain in the nat table is

Chain OUTPUT (policy ACCEPT)
 target prot opt in out source     destination         
 DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.5     multiport dports 80,443 to:192.168.0.8 
 DNAT   tcp  --  *  *   0.0.0.0/0  1.2.3.6     multiport dports 80,443 to:192.168.0.9 

Then on eth0, I see

10:52:42.719385 192.168.0.1.36065 > 192.168.0.8.www: S 3950921369:3950921369(0) win 32767 <mss 16396,sackOK,timestamp 77755658 0,nop,wscale 0> (DF)
10:52:42.719797 192.168.0.8.www > 192.168.0.1.36065: S 3348203817:3348203817(0) ack 3950921370 win 5792 <mss 1460,sackOK,timestamp 30595894 77755658,nop,wscale 0> (DF)
10:52:42.720206 192.168.0.1.1028 > 192.168.0.8.www: R 3950921370:3950921370(0) win 0 (DF)
10:52:45.716310 192.168.0.1.36065 > 192.168.0.8.www: S 3950921369:3950921369(0) win 32767 <mss 16396,sackOK,timestamp 77755958 0,nop,wscale 0> (DF)
10:52:45.716595 192.168.0.8.www > 192.168.0.1.36065: S 3348203817:3348203817(0) ack 3950921370 win 5792 <mss 1460,sackOK,timestamp 30596194 77755658,nop,wscale 0> (DF)
10:52:45.716974 192.168.0.1.1028 > 192.168.0.8.www: R 3950921370:3950921370(0) win 0 (DF)
10:52:46.910244 192.168.0.8.www > 192.168.0.1.36065: S 3348203817:3348203817(0) ack 3950921370 win 5792 <mss 1460,sackOK,timestamp 30596314 77755658,nop,wscale 0> (DF)
10:52:46.910653 192.168.0.1.1028 > 192.168.0.8.www: R 3950921370:3950921370(0) win 0 (DF)

and this pattern repeats, with Squid resending its SYN on port 36065, 
and the server asynchronously resending its SYN-ACK, and netfilter (or 
something) sending a RST for every SYN-ACK and thinking it's handled the 
incoming packet. So, no, the connection isn't effectively torn down.

Eventually Squid changes to port 36066, with the same effect, then sends 
its error page back to the browser. That's all the traffic that I see, 
excepting arp, igmp, my own ssh, and an external www request that 
happened during the long wait.

Alistair Tonner wrote:

>Does the squid to webserver connection ever go through *any* firewalling?
>
Yes. I see the packet count incremented (for the first packet) in the 
above OUTPUT chain to .0.8. I also see a line in /proc/net/ip_conntrack like

tcp 6 58 SYN_RECV src=1.2.3.5 dst=1.2.3.5 sport=36065 dport=80 src=192.168.0.8 dst=192.168.0.1 sport=80 dport=36065 use=1 

Curious that it's a SYN_RECV and not a SYN_SENT.

>Does the webserver to squid response get handled by any firewalling?
>
It seems to. I get packets counted in the appropriate ACCEPT rules.


Thanks for thinking about this.



