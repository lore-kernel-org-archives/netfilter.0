From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: redundancy with linux and two NIC
Date: Fri, 13 Jun 2003 15:19:45 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030613191945.GA13464@cannon.eng.us.uu.net>
References: <20030613171652.82258.qmail@web13206.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030613171652.82258.qmail@web13206.mail.yahoo.com>
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
Content-Transfer-Encoding: 7bit
To: Ivan Rodriguez <ivanoch79@yahoo.com.mx>
Cc: netfilter@lists.netfilter.org

On Fri, Jun 13, 2003 at 12:16:52PM -0500, Ivan Rodriguez wrote:

> Hi 
> i have the next situation
> 
>                           ADSL
>                    eth1--------->
> 192.168.64.x --->LinuxBox
>                    eth0--------->
>                           DS0
>  
> my Linux box is a GW i need the following:
>          
> 
>         if etho is down then all traffic is routed
>         by eth1 and  if eth1 is down then all 
>         traffic is routed by eth0
> 
> it is posible ?

Yes, it is possible but not easy. First of all, if a link goes down, so does
your MASQ'ed sessions. You just can't switch the masq'ing interface. Secondly,
the inbound initiations are totally out of your control. If someone sends you
a packet with dst (eth0) and eth0 is down, the packet would be dropped (with
an appropriate ICMP generated). I'm sure there are other deficiencies to this
setup. One way of setting this up is to have a static IP assigned to a loopback
(dummy device in linux terminology) on the linux box and have your ISP's (both
if there are two) route that IP to you through your both interfaces. Then you
would SNAT everything with that IP and set up your routes (with or without an
equal cost) to both interfaces. Unfortunately in home setups the ethX might
show up while the link is basically down, which means you have to monitor your
next-hop access and remove the unreachable route if necessary, otherwise you'll
create a blackhole for yourself. At any rate, you need a static IP and two (or
one) willing ISP(s) to route that IP to you... From your routing table below
it looks like you have eth1 and ppp0 to the Internet which seem to be on
the same /18. So you're one step closer to this solution...

Ramin

> please help me and excusme mi english is not god
> 
> 
> Destination     Gateway         Genmask         Flags 
>  MSS Window  irtt
> Iface
> 
> 148.223.133.227 192.168.65.1    255.255.255.255 UGH   
>   40 0          0
> eth1
> 
> 148.223.182.205 0.0.0.0         255.255.255.255 UH    
>   40 0          0
> ppp0
> 
> 192.168.65.0    192.168.65.1    255.255.255.0   UG    
>   40 0          0
> eth1
> 
> 192.168.65.0    0.0.0.0         255.255.255.0   U     
>   40 0          0
> eth1
> 
> 10.0.0.0        0.0.0.0         255.0.0.0       U     
>   40 0          0
> eth0
> 
> 127.0.0.0       0.0.0.0         255.0.0.0       U     
>   40 0          0
> lo
> 
> 0.0.0.0         148.223.182.205 0.0.0.0         UG    
>   40 0          0
> ppp0

