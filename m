From: "Jet" <yenjet.chan@eglobal.com.my>
Subject: Re: IP alias and NAT
Date: Wed, 29 Jan 2003 12:04:14 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006c01c2c74b$7f1b37c0$0bc8c80a@dolphin>
References: <001e01c2c5f8$bc5d7d40$0bc8c80a@dolphin> <1043672915.15779.16.camel@elendil.intranet.cartel-securite.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
Content-Type: text/plain; charset="us-ascii"
To: Cedric Blancher <blancher@cartel-securite.fr>
Cc: netfilter@lists.samba.org

Hi, 

> 
> To get packets NATed as you want them to, they have to reach PREROUTING
> chain on the firewall. That means when access router wants to forward
> theses packets, it must get an ARP reply for their destination IP. If
> NATed IPs were not aliased on firewall, then nobody would answer access
> router's ARP requests, and connections would not get established.
> 

I don't totally agree on this. How about POST ROUTING?

> 
> The only thing you have to keep in mind is that packets you want to NAT
> have to reach the firewall. As they're not destined to, you have to
> force them a bit ;)
> 

Can anyone explain why we don't have to do the same for POSTROUTING?

- Jet 


