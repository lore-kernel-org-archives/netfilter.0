From: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>
Subject: Re: SNAT question
Date: Fri, 17 Sep 2004 16:48:28 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1095454108.2522.27.camel@localhost>
References: <20040916172012.68861.qmail@web61101.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040916172012.68861.qmail@web61101.mail.yahoo.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: darmian martinez <darmianm@yahoo.com.ar>
Cc: netfilter@lists.netfilter.org

On Thu, 2004-09-16 at 13:20, darmian martinez wrote:
> Hello,
>  
> I am trying to change the source ip address of icmp reply packets of the
> firewall, just because i am trying to hide the firewall ip address in the case someone makes a traceroute to my protected network. I dont want
> to block the icmp packet, just to change the source ip address.
> i try it with:
>  
> iptables -t nat -I POSTROUTING -s [FIREWALL_IP] -d [TRACEROUTE_ORIGINATOR] -m state --state RELATED,NEW,ESTABLISHED -j SNAT --to [FAKE_IP_ADDRESS]
>  
> it's does not work. anyone know how to make it?
<snip>
We handle this a little differently in the ISCS project
(http://iscs.sourceforge.net).  Instead, we have a drop rule in the
mangle table to drop any packet with a TTL of 1 rather than sending back
a TTL expired ICMP packet.  At least I think that's what I remember
doing :-)

We had originally planned to simply increment the TTL by 1 so that a
packet would never expire on the gateway but then decided that was a bad
way to go about it.
-- 
John A. Sullivan III
Open Source Development Corporation
Financially sustainable open source development
http://www.opensourcedevel.com


