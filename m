From: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Subject: Re: DNAT/SNAT & existing connections
Date: Thu, 17 Jul 2003 08:29:07 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030717122907.GA30482@cannon.eng.us.uu.net>
References: <20030716140611.GA27608@cannon.eng.us.uu.net> <20030717021443.65646.qmail@web13104.mail.yahoo.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <20030717021443.65646.qmail@web13104.mail.yahoo.com>
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
To: Stephen Bylo <stephenbylo@yahoo.com.sg>
Cc: Ramin Dousti <ramin@cannon.eng.us.uu.net>, netfilter@lists.netfilter.org

On Thu, Jul 17, 2003 at 10:14:43AM +0800, Stephen Bylo wrote:

> If I want *existing* UDP connections to be diverted, I
> need to change both the NAT table *and* the connection
> tracking table, is this right? Can somebody tell me if
> this can be done with iptables?  Do I have to hack the
> code? I may do so if need be. Is there another NAT
> sollution out there that can do what I need?
> Is using a NAT to divert existing UDP streams
> technically possible?

I think one way of doing this is to reduce the conntrack timeout for
UDP to almost nihil so that you see the effect of adding 2 to the nat
immidiately. But in that case UDP returns would not benefit from the
implicit conntrack structure and you need to allow the return traffic
explicitly.

Ramin

> 
> Thanx for your help.
> Steve

