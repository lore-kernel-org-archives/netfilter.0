From: "Stephen J. McCracken" <sjmccracky@myrealbox.com>
Subject: Re: 26sec problems
Date: Wed, 06 Apr 2005 08:42:42 -0500
Message-ID: <4253E752.6050607@myrealbox.com>
References: <42539B3D.2090407@century.cz> <20050406120540.GC12451@nlb0>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050406120540.GC12451@nlb0>
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
Cc: netfilter@lists.netfilter.org

> Quoting Petr Titera <P.Titera@century.cz>:
[snip]
>         BUT on FWA:eth1 I see packets from other direction as going from another 
>         port than I have connected:
>         
>         This is communication as I see it on FWA:eth1 port. Note change from 
>         http port to tcpmux port.
[snip]
>         09:23:52.171022 IP 192.168.1.200.tcpmux > 192.168.17.200.60424: F 0:0(0) 
>         ack 1 win 65535 <nop,nop,timestamp 10752656 3092379283>
>         
>         Any idea what is wrong?

I just worked through this same problem and posted the solution on the 
OpenSWAN mailing list.  It is a nat problem.  Here is my post from the 
OpenSWAN list:

> This is just to get this in the archives as it is solved. (It's a NAT
> problem.)
> 
> I was having trouble with ports being rewritten to port 1.  Example:
> 
> BoxA --- GwA ====== GwB --- BoxB
> 
> GwA running OpenSWAN (openswan-2.1.5-2 Fedora RPM) and GwB a Multitech
> RoutFinder 550 (MT550VPN).
> 
> I would try to ssh from BoxA to BoxB and get this:
> 
> 15:22:35.859664 IP BoxA.38537 > BoxB.22: S 51958428:51958428(0) win 5840
> <mss 1460,sackOK,timestamp 257583923 0,nop,wscale 2>
> 15:22:35.863491 IP BoxB.22 > BoxA.38537: S 3558425983:3558425983(0) ack
> 51958429 win 5792 <mss 1336,sackOK,timestamp 12106235
> 257583923,nop,wscale 2>
> 15:22:35.863555 IP BoxA.38537 > BoxB.22: . ack 1 win 1460
> <nop,nop,timestamp 257583927 12106235>
> 15:22:35.890997 IP BoxB.1 > BoxA.38537: P 3558425984:3558426007(23) ack
> 51958429 win 1448 <nop,nop,timestamp 12106262 257583927>
> 15:22:36.093361 IP BoxB.1 > BoxA.38537: P 0:23(23) ack 1 win 1448
> <nop,nop,timestamp 12106465 257583927>
> 15:22:36.499231 IP BoxB.1 > BoxA.38537: P 0:23(23) ack 1 win 1448
> <nop,nop,timestamp 12106871 257583927>
> 
> I noticed others were having similar problems:
> 
> http://lists.virus.org/users-openswan-0502/msg00239.html
> 
> And found the answer through this post:
> 
> http://lists.virus.org/users-openswan-0407/msg00002.html
> 
> That references this post:
> 
> http://bugs.debian.org/cgi-bin/bugreport.cgi?bug=215980
> 
> I had to add in the following to solve the port 1 problem:
> iptables -A POSTROUTING 1 -p esp -j ACCEPT -t nat 


