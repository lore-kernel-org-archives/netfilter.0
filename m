From: "Sebastian" <basti79@basti79.de>
Subject: RE: Forwarding Multicast Traffic
Date: Tue, 10 Feb 2004 12:26:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000201c3efc8$b06829e0$0200a8c0@basti79>
References: <F5200854-5AD1-11D8-87C2-000A95C71776@freezone.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <F5200854-5AD1-11D8-87C2-000A95C71776@freezone.co.uk>
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
To: netfilter@lists.netfilter.org

Hi there...

As you said multicast traffic is normaly not routed. But you can do a
view steps to do this. First enable multicast support and multicast
routing in the routers linux kernel. I've tried to route multicast
packets with the iptables -j ROUTE target IIRC, but that doesn't seem to
work. The much cleaner is to use the multicast routing daemon (mrouted).
On debian systems you can easily apt-get the packet, on other systems i
suggest to google around.

Greets
  Basti.


> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org 
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of 
> ms419@freezone.co.uk
> Sent: Monday, February 09, 2004 8:31 AM
> To: netfilter@lists.netfilter.org
> Subject: Forwarding Multicast Traffic
> 
> 
> Two machines communicate with one another using multicast - 
> mDNS - when 
> they are on the same network segment. When they are on 
> separate network 
> segments, however - though they can connect to one another across a 
> router - they can't communicate using multicast. I presume 
> that this is 
> because the router isn't forwarding multicast traffic to 
> other network 
> segments? The router is running Linux kernel version 2.4.23 and 
> iptables. How can I configure iptables to forward multicast 
> traffic to 
> other network segments?
> 
> Thanks very much,
> 
> Jack
> 
> 
> 


