From: Jason Opperisano <opie@817west.com>
Subject: Re: NAT question
Date: Fri, 11 Mar 2005 10:13:01 -0500
Message-ID: <1110553981.4767.28.camel@hubcap.ljm.dom>
References: <200503111356.j2BDuTHV004706@mail1.firstbhph.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <200503111356.j2BDuTHV004706@mail1.firstbhph.com>
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

On Fri, 2005-03-11 at 08:56, Dimitri Yioulos wrote:
> >> Hello, all.
> >>  
> >> I've recently set up iptables-1.2.8-12.3 on a CentOS 3.4 (RHEL AS 3) box.
> >> Among other things, I've created a DMZ where my Web and mail servers
> >>live.
> >> My problem is that my Web and mail servers identify themselves with the
> >> NAT
> >> ip address that I've assigned   Here's my NAT rule: 
> >> 
> >>  IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source 
> >> $INET_IP 
> >> 
> >> How can I get these two servers to identify themselves by their own ip
> >> addresses and still provide NAT for my users?
> 
> >specify the source address so that only packets from the inside network
> >match the SNAT rule:
> 
> >  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $INSIDE_NET \
> >    -j SNAT --to-source $INET_IP
> 
> 
> Thanks to all for your replies!
> 
> I was hopeful about applying the above rule.  Internet connectivity is fine;
> inbound mail is fine; outbound mail seems not to make it (if the list
> receives this, it's because I rolled back to the original rule).  Does that
> make any sense?
> 
> Dimitri

are your web and mail servers NAT-ed as well?  it was unclear from your
original post, an i assumed that you were using Internet-routed IP space
in your DMZ.  if this is not the case--you need to put your rules in the
proper order.

if you have a static (one-to-one) NAT for a DMZ machine, and also want
to perform a hide NAT (many-to-one) NAT for your internal net's outbound
traffic--you'd have something like:

  # inbound one-to-one NAT for web server
  iptables -t nat -A PREROUTING -i $INET_IFACE -d $WEB_SRV_PUB_IP \
    -j DNAT --to-destination $WEB_SRV_PRIV_IP

  # outbound one-to-one NAT for web server
  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $WEB_SRV_PRIV_IP \
    -j SNAT --to-source $WEB_SRV_PUB_IP

  # outbound many-to-one NAT for inside net
  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $INSIDE_NET \
    -j SNAT --to-source $INET_IP

order matters--place the one-to-one SNAT rules before any many-to-one
SNAT rules.

in order for packets destined for $WEB_SRV_PUB_IP to make it to your
firewall's $INET_IFACE, it either needs to be routed that way by your
upstream Internet router, or you need to add it as an alias:

  ip addr add $WEB_SRV_PUB_IP dev $INET_IFACE

HTH...   any sorry for misleading before.

-j

--
"Do you want to change your name to Homer Junior? The kids can call
 you Hoju!"
	--The Simpsons


