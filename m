From: "Dimitri Yioulos" <dyioulos@firstbhph.com>
Subject: Re: NAT question
Date: Fri, 11 Mar 2005 10:41:11 -0500
Message-ID: <200503111541.j2BFfAK8006512@mail1.firstbhph.com>
References: <1110553981.4767.28.camel@hubcap.ljm.dom>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
In-Reply-To: <1110553981.4767.28.camel@hubcap.ljm.dom>
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

> >> Hello, all.
> >>  
> >> I've recently set up iptables-1.2.8-12.3 on a CentOS 3.4 (RHEL AS 3)
box.
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
> I was hopeful about applying the above rule.  Internet connectivity is
fine;
> inbound mail is fine; outbound mail seems not to make it (if the list
> receives this, it's because I rolled back to the original rule).  Does
that
> make any sense?
> 
> Dimitri

-are your web and mail servers NAT-ed as well?  it was unclear from your
-original post, an i assumed that you were using Internet-routed IP space
-in your DMZ.  if this is not the case--you need to put your rules in the
-proper order.
-
-if you have a static (one-to-one) NAT for a DMZ machine, and also want
-to perform a hide NAT (many-to-one) NAT for your internal net's outbound
-traffic--you'd have something like:
-
-  # inbound one-to-one NAT for web server
-  iptables -t nat -A PREROUTING -i $INET_IFACE -d $WEB_SRV_PUB_IP \
-    -j DNAT --to-destination $WEB_SRV_PRIV_IP
-
-  # outbound one-to-one NAT for web server
-  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $WEB_SRV_PRIV_IP \
-    -j SNAT --to-source $WEB_SRV_PUB_IP
-
-  # outbound many-to-one NAT for inside net
-  iptables -t nat -A POSTROUTING -o $INET_IFACE -s $INSIDE_NET \
-    -j SNAT --to-source $INET_IP

-order matters--place the one-to-one SNAT rules before any many-to-one
-SNAT rules.

-in order for packets destined for $WEB_SRV_PUB_IP to make it to your
-firewall's $INET_IFACE, it either needs to be routed that way by your
-upstream Internet router, or you need to add it as an alias:

-  ip addr add $WEB_SRV_PUB_IP dev $INET_IFACE

-HTH...   any sorry for misleading before.


Sorry for any confusion I may be causing.  Here's a little more info.:

I've aliased my Web and mail server public addresses to eth0:0 and eth0:1
(eth0 being the external interface).  I think I've read that this isn't the
optimal set-up, but it does work.  That shouldn't matter, should it?

The key here may be in omitting a NAT postrouting rule (sorry if the
terminology is incorrect).  Here's what I have:

IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $HTTP_IP --dport 80 \
-j DNAT --to-destination $DMZ_HTTP_IP
IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_IP --dport 25 \
-j DNAT --to-destination $DMZ_SMTP_IP
IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SMTP_IP --dport 25 \
-j DNAT --to-destination $DMZ_SMTP_IP
IPTABLES -t nat -A PREROUTING -p TCP -i $INET_IFACE -d $SMTP_IP --dport \
110 -j DNAT --to-destination $DMZ_SMTP_IP
IPTABLES -t nat -A PREROUTING -p UDP -i $INET_IFACE -d $SMTP_IP --dport \
110 -j DNAT --to-destination $DMZ_SMTP_IP
IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -j SNAT --to-source $INET_IP

in that order.  I will change the last rule to include -s $INSIDE_NET.  I
also notice that I don't have the outbound one-to-one NAT for web or mail
servers. So, if I add: 

IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -s $WEB_SRV_PRIV_IP \
-j SNAT --to-source $WEB_SRV_PUB_IP 

and

IPTABLES -t nat -A POSTROUTING -o $INET_IFACE -s $MAIL_SRV_PRIV_IP \
-j SNAT --to-source $MAIL_SRV_PUB_IP

just after the outbound many-to-one NAT for inside net as above, will I be
good?

Thanks so much for your time.


