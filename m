From: "Vasilii.Alferov" <Vasilii.Alferov@gmail.com>
Subject: Re: philosophical question regarding NAT
Date: Tue, 10 May 2005 17:25:19 +0600
Message-ID: <d5q590$fsv$1@sea.gmane.org>
References: <1115723584l.29661l.0l@server.moose.blogdns.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7Bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Ian Laurie wrote:

> I've got a philosophical question regarding NAT as follows.
> 
> Imagine the following unrealistic gateway firewall:
> 
> ## eth0 = WAN, eth1 = LAN
> *nat
> :PREROUTING ACCEPT [0:0]
> :POSTROUTING ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> -A POSTROUTING -o eth0 -j MASQUERADE
> COMMIT
> 
> *filter
> :INPUT ACCEPT [0:0]
> :FORWARD ACCEPT [0:0]
> :OUTPUT ACCEPT [0:0]
> COMMIT
> 
> Although NAT is enabled and LAN side systems will be NATed to the
> gateway's WAN side IP address, WAN side systems can still access
> systems on the inside of the firewall if they know what the LAN
> side addresses are (and have a route to the gateway somehow).
> 
> In other words, even though NAT is active the bridging function
> provided by ip_forward is still happening as well.
> 
> It seems you can disable the bridging function with the following
> PREROUTING rule:
> 
> -A PREROUTING -i eth0 -d <private_lan_block> -j DROP
> 
> which enforces NAT, ie, only NATed things can get through.  While
> you can achieve the same thing by setting policy of FORWARD to DROP
> and allowing only RELATED and ESTABLISHED stuff through (which I do)
> I am surprised I have not seen this PREROUTING rule used more
> often as a safety measure.
> 
> It doesn't seem to break anything, does anyone know why this
> technique isn't seen more often?
> 
> Ian


More effective solution is to enable rp_filter in kernel using proc
filesystem or sysctl. It prevents anyone from spoofing IP addresses.

Vasilii.


