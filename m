From: Jason Opperisano <opie@817west.com>
Subject: Re: No internet connection
Date: Thu, 09 Sep 2004 10:15:51 -0400
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <1094739351.2044.35.camel@wolfpack.ljm.dom>
References: <20040909140459.92337.qmail@web50209.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20040909140459.92337.qmail@web50209.mail.yahoo.com>
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
To: netfilter@lists.netfilter.org

On Thu, 2004-09-09 at 10:04, Giancarlo Boaron wrote:
> Hello.
> I'm testing a new iptables script on my server box but
> after some minuts that this script is running, the
> clients in my LAN have no access to Internet.
> I'm using SQUID for proxing and caching.
> 
> I think I'm not being very restrictive for my IPTABLES
> rules because my clients still have Internet access
> after about 20 minuts when the script is running.
> 
> What can be wrong? Does my kernel have some limit
> about connections? 

of course it does.  i doubt it's the cause of your problem, but if
you're curious:
        grep ip_conntrack /var/log/messages
        
should show you something like:
        ip_conntrack version 2.1 (6142 buckets, 49136 max) - 360 bytes
        per conntrack
        
the number before max (49,136 in this case) is the max number of
conntrack entries for the machine.
        
> Does it hava someting to do with
> the CONTRACK?

i doubt it.  but posting your rules might help:

  iptables -vnL -t mangle && iptables -vnL -t nat && iptables -vnL

i've been batting about zero with my stabs in the dark here
recently--but here goes...

is it possible that you get your external IP via DHCP; and that you're
blocking the DHCP packets between your firewall and the ISP's DHCP
server.  so you get an IP, start up your firewall, and at the first
semaphore period, and either the DHCP server or client decides the other
is no longer there, and your IP gets released?

-j

-- 
Jason Opperisano <opie@817west.com>


