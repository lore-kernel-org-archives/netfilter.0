From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Please help redirecting locally generated traffic
Date: Fri, 20 Jul 2007 13:10:50 -0500
Message-ID: <46A0FAAA.3080203@riverviewtech.net>
References: <18563.192.35.79.70.1184885123.squirrel@www.dcsnow.com>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <18563.192.35.79.70.1184885123.squirrel@www.dcsnow.com>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: Mail List - Netfilter <netfilter@lists.netfilter.org>

On 07/19/07 17:45, aragonx@dcsnow.com wrote:
> I have a situation where an application on my box wants to talk to 
> the wrong IP address.  The developers will gladly fix the bug in the 
> next version but I need a quicker fix.

Typical...

> Here is the situation.  I have traffic that is going to 10.0.0.1 and 
> needs to got to 198.162.0.1.  It's created on the machine that I need 
> to do the routing on.  It's a Linux machine using iptables 1.2.9. 
> Neither SNAT or DNAT seem to work.  DNAT wants to work on the 
> incomming packets but does what I need.  SNAT will work on the 
> outgoing packets but doesn't do what I need.  Mangle seems to only 
> want to send packets to my 127.0.0.1.

Ugh.  You are wanting to redirect traffic that is not following the 
normal packet flow through the kernel.

> Any help would be appreciated.

Have you considered adding the 10.0.0.1 IP address to equipment with a 
corresponding 10.0.0.x IP address to your system?

Or you may be able to look in to some sort of (socks?) proxy rapper that 
will bind a 10.0.0.1 and allow you to redirect the traffic over to 
198.162.0.1.



Grant. . . .

