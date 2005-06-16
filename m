From: /dev/rob0 <rob0@gmx.co.uk>
Subject: Re: multiport
Date: Thu, 16 Jun 2005 10:59:04 -0500
Message-ID: <200506161059.04681.rob0@gmx.co.uk>
References: <1118930391.16084.2.camel@debianbox>
	<200506160957.17356.rob0@gmx.co.uk>
	<1118935612.16084.16.camel@debianbox>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1118935612.16084.16.camel@debianbox>
Content-Disposition: inline
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

On Thursday 16 June 2005 10:26, Sadus . wrote:
> Maybe a misconception from my part here, please correct me:
>
> When you want to block an IP from connecting to the internet, should
> i use:
> iptables -A INPUT -i $INTERNAL -s 192.168.1.2 -j DROP
> or
> iptables -A FORWARD -i $INTERNAL -s 192.168.1.2 -j DROP or both?

INPUT blocks someone connecting to the firewall machine. FORWARD blocks 
forwarding through the firewall machine.

> since the firewall is set to the gateway, then any client will try to
> connect to the IP of the gateway to then establish a connection with
> the site needed, if i already block that IP to connect to my NIC via
> the INPUT chain, then there is no need for me to DROP in FORWARD, or
> is it the other way around?

http://www.netfilter.org/documentation/HOWTO//packet-filtering-HOWTO-6.html

Every packet hits exactly one of the builtin filter chains (except lo 
traffic, which hits OUTPUT when generated and then INPUT if/when 
accepted.) INPUT is not touched when both source and destination are 
not local.

> correction,
> i want to drop MSN to all 172.168.3.* to /24 should be used since
> 172.168.2.* should be able to connect to MSN.

Right.
-- 
    mail to this address is discarded unless "/dev/rob0"
    or "not-spam" is in Subject: header

