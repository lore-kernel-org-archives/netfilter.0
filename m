From: Rowan Reid <rreid@studio3arc.com>
Subject: RE: VPN (PPTP) Port forwarding on RH 8.0 (Kernel 2.4.18-14)
Date: Fri, 11 Apr 2003 12:25:13 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <003601c30060$139c80f0$1001a8c0@s3ac>
References: <9EC6A5A6B11DA843A551CC9AD9323FAC2FC4@exchange.musicreports.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-admin@lists.netfilter.org>
In-reply-to: <9EC6A5A6B11DA843A551CC9AD9323FAC2FC4@exchange.musicreports.com>
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
To: "'James D. Parra'" <JamesP@MusicReports.com>, netfilter@lists.netfilter.org


> Do I need to make any changes in the kernel to allow the 
> handling of this type of packet?  What would the iptable 
> entry look like since I would need port 1723 TCP/UDP with the 
> protocol 47 to pass through? How can I see if forwarding is 
> enabled in the kernel?  
If your running a generic kernel and netfilter installation you need to
apply the pom patch for pptp
http://www.netfilter.org/documentation/pomlist/pom-extra.html#pptp-connt
rack-nat 
Then just follow the instructions.

> 
> NAT is working well, but I can't get port forwarding to pass 
> through to the internal servers; http, port 80, for example.
What your trying to do is a DNAT .....   See link below
http://www.netfilter.org/documentation/HOWTO//NAT-HOWTO-10.html


