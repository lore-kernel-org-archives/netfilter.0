From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: RE: static nat with iptables
Date: Sun, 22 Feb 2004 23:34:55 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1077510895.15548.3.camel@localhost>
References: <FD1B6DC5FFF43C4888DCC155FE8C1FFE224F35@7xch10ka.sevenspace.local>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <FD1B6DC5FFF43C4888DCC155FE8C1FFE224F35@7xch10ka.sevenspace.local>
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
To: Mussie Gebregziabiher <mussieg@comcast.net>, netfilter@lists.netfilter.org

Perhaps I misunderstood the e-mail but is the address to which you are
NATting on the same network as your public interface? I don't think
213.29.76.154/27 and 213.29.76.19/27 are on the same network - John

On Sun, 2004-02-22 at 15:59, Mussie Gebregziabiher wrote:
> Make sure that ip_forwarding is enabled. Not sure if it is enabled by
> default. 
> 
> cat /etc/sysctl.conf 
> 
> # Controls IP packet forwarding
> net.ipv4.ip_forward = 1
> 
> Good luck!
> 
> -MGG
> 
> -----Original Message-----
> From: netfilter-admin@lists.netfilter.org
> [mailto:netfilter-admin@lists.netfilter.org] On Behalf Of John Black
> Sent: Sunday, February 22, 2004 10:13 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: static nat with iptables
> 
> is your eth0 ip address a static ip or dynamic?  if it is static try this:
>  
> iptables -A FORWARD -i eth1 -o eth0 -m state --state ESTABLISHED, RELATED -j
> ACCEPT
> iptables -A FORWARD -i eth0 -o eth1 -j ACCEPT
> iptables -A FORWARD -j LOG
>  
> iptables -t nat -A POSTROUTING -s 192.168.20.0/24 -o eth1  -j SNAT --to
> 213.29.76.153
>  
>  
> Dear sir 
> Pls kindly help me
> I have a private address like 192.168.20.19/24 and I have a public address
> like 213.29.76.153/27 im going to translate (STATIC NAT) my private ip
> address to public address (213.29.76.19) with iptables
> Meanwhile my router is redhat linux 8.0 and have 2 network adapter like
> below
> Eth0 192.168.20.1 /24  (connect to private network)
> Eth1 213.29.76.154 /27 (connected to internet )
>  
-- 
Open Source Development Corporation
Financially Sustainable open source development
http://www.opensourcedevelopmentcorp.com


