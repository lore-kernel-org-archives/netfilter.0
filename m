From: Sam Loy <sampaw@mac.com>
Subject: Re: Please help...
Date: Tue, 29 Jun 2004 11:57:32 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <69AC05B1-C9ED-11D8-A9BD-000A95AD0230@mac.com>
References: <FC8C43AB-C94D-11D8-9C38-000A95AD0230@mac.com> <16609.34789.711050.944527@saint.heaven.net>
Mime-Version: 1.0 (Apple Message framework v618)
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <16609.34789.711050.944527@saint.heaven.net>
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

Thanks everyone who has tried to help so far. I am confident I will get 
it working with all of your help.

Here is some more information:
Per Marek Dohoja's reply, I added a rule to my output chain:
iptables -A FORWARD -s 192.168.1.0 - j ACCEPT.

I also tried adding 192.168.1.1 as above, with still nothing.

As suggested by Antony, I have performed the following test:

I examined the bytecounts of iptables and discovered:

Chain PREROUTING policy has accepted 11331 packets , 1345868 bytes
Chain POSTROUTING  policy has accepted 12 packets, 665 bytes, but list 
detail in 2 of the rules
	pkts = 348, bytes=25416, target=MASQUERADE  out = pp0
	pkts = 3	 bytes=144, target=MASQUERADE out=eth0: (which is 192.168.1.1)
There are a total of  8 rules under POSTROUTING, only 2 have any stats. 
Is there anyway to clear all rules and start over?
Chain OUTPUT policy has accepted 178 packets, 7838 bytes.

ping and traceroute test:

 From the firewall machine:

Can ping and traceroute www.abcnews.com. traceroute does NOT show the 
route going through 192.168.1.1, but straight to the ip address 
currently assigned ppp0. Which brings me to another subject: I am sure 
I told adsl-setup to leave the connection up continuously, yet it drops 
and re-acquires a new ip every minute. This will make any attempt to 
access my LAN from outside futile. Any suggestions on how simply 
acquire an ip from my isp and hold it forever would be greatly 
appreciated.

 From a client machine, I can ping 192.168.1.1, I can also ping the ip 
assigned by my ISP (if I type fast! see above :-) When I do a 
traceroute from my client to the ISP ip, it DOES go through 
192.168.1.1.

HOWEVER - I CANNOT ping www.abcnews.com OR the ip it resolves 
to(199.181.132.250) from a client machine.

After I conduct ping/traceroute test, the byte counts from the -nvx 
command increase on the ppp0 MASQUERADE rule ONLY, not on the eth0 
rule...and ONLY when executed on the firewall machine. The byte counts 
do not change at all when test executed from the client machine.

Routing Table:
When ppp0 is up: (Again, ppp0 is reconnecting every 60 seconds...make 
it stop! :-()

Dest				GW			Mask				Iface
(ISP assigned IP)   0.0.0.0		255.255.255.255		ppp0
192.168.1.0	      0.0.0.0			255.255.255.0			eth0
169.254.0.0            0.0.0.0                   255.255.0.0			eth0
127.0.0.0		      0.0.0.0			255.0.0.0				lo
0.0.0.0		      (ISP assign IP)     0.0.0.0				ppp0

I hope this is enough information.

By the way, Dick St. Peters, I tried your suggestion and it had no 
effect.

Thank you all again.

Sincerely,

Sam Loy


