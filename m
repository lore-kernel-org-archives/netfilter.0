From: Bob Tellefson <bob@zooid.com>
Subject: Re: networking newbie needs help
Date: Sun, 23 Jan 2005 20:28:53 +0000
Message-ID: <200501232028.53215.bob@zooid.com>
References: <15505515.1106460382543.JavaMail.rct@kale>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <15505515.1106460382543.JavaMail.rct@kale>
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
Cc: "John A. Sullivan III" <jsullivan@opensourcedevelopmentcorp.com>

On Sunday 23 January 2005 06:05, Kev askme wrote:

>
> Thanks for the "dummified" explanation. That is very
> clear and concise. :) So I just need my ISP to
> statically assign the public IP addresses to me and
> then add the addresses to my external interface using
> the ip command and then the external interface will
> answer for all ip addresses on the external interface?
> Or do I need to add aliases for each address, or is
> that essentially what the ip command is actually
> doing?
>
>

It is generally more useful to have a subnet assigned and routed to you by 
your isp.  The advantage here is that you may use these ip's on your dmz 
without the need for DNAT.  In this case, your firewall/router isp interface 
acts as a gateway that you isp routes your subnet ip's through.  ARP is not 
involved other than to discover this gateway interface.  You can route/filter 
the subnet ip's as you see fit.

DNAT comes with side effects that you should consider before proceding.  Have 
a look at DNAT in in iptables faq 
( http://www.faqs.org/docs/iptables/targets.html ) for an example of what 
happens when you DNAT clients from the outside world versus how machines 
within the DMZ (including the firewall) access the same services.  This can 
be a serious issue depending on what services reside on your DMZ and how they 
interact.

If you don't get a routed subnet from you isp, consider using proxy arp rather 
than DNAT.  This effectively gives you the benefits of a routed subnet.  See 
http://www.tldp.org/HOWTO/Proxy-ARP-Subnet/

DNAT has it's place, but it is a kludge (IMHO).  I avoid it where possible.



-- 

Bob Tellefson
Java network application development & hosting

