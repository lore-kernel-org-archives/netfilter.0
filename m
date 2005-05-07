From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Sat, 07 May 2005 01:12:17 -0500
Message-ID: <427C5C41.3010407@riverviewtech.net>
References: <1115397393l.3864l.0l@antares.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1115397393l.3864l.0l@antares.localdomain>
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

> [root@antares root]# tcpdump -nn -i ppp0 tcp port 80 2> tcpdump.ppp0
> 18:16:21.012206 IP 84.44.131.113.49223 > 213.95.27.115.80: S 2685214081:2685214081(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180757 0>
> 18:16:21.085651 IP 213.95.27.115.80 > 84.44.131.113.49223: S 2677460604:2677460604(0) ack 2685214082 win 5792 <mss 1460,nop,nop,timestamp 1472713132 2148180757,nop,wscale 2>
> 18:16:21.085748 IP 84.44.131.113.49223 > 213.95.27.115.80: R 2685214082:2685214082(0) win 0
> 18:16:23.779332 IP 84.44.131.113.49223 > 213.95.27.115.80: S 2685214081:2685214081(0) win 65535 <mss 1452,nop,wscale 0,nop,nop,timestamp 2148180762 0>
> 18:16:23.841268 IP 213.95.27.115.80 > 84.44.131.113.49223: S 2680216981:2680216981(0) ack 2685214082 win 5792 <mss 1460,nop,nop,timestamp 1472715888 2148180762,nop,wscale 2>
> 18:16:23.841326 IP 84.44.131.113.49223 > 213.95.27.115.80: R 2685214082:2685214082(0) win 0

I'm not sure why it's happening but your PMac G4 system is sending reset packets in response to the responses from the server.  Have you tried using an SNAT rule temporarily on your POSTROUTING chain to see if the problem is with the MASQUERADE rule?  Also, what is your "echo 2 > /proc/sys/net/ipv4/ip_dynaddr" doing for you?  You might want to check to make sure that reverse path filtering is not turned on by default.  You might also want to turn on verbose routing messages to see if there is any thing useful being reported.



Grant. . . .

