From: Andy Loukes <andy@navaho.co.uk>
Subject: Re: physdev and snat problems
Date: Fri, 5 Dec 2003 10:20:59 +0000 (GMT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.58.0312051020210.10989@picea.navaho>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

OK, no-one answered this but I figured it out (isn't it always the 
same!), so I thought I'd reply in case any finds it useful

It was nothing to do with physdev. I installed the iptables 1.2.9 and 
appararently it needs to be compiled with the 2.6 kernel for nat to work.
A bit odd but there you go...


On Thu, 4 Dec 2003, Andy Loukes wrote:

> I'm using iptables 1.2.9 and kernel 2.6.0-test11..
> 
> I may be doing something really stupid but if I do this:
> iptables -t nat -A POSTROUTING -m physdev --physdev-out eth1 -j SNAT --to-source x.x.x.x
> 
> I get:
> iptables: Invalid argument
> 
> but if I just use ACCEPT as the target it works fine, although doesn't do what I want..
> 
> I've got the bridging an physdev options turned on (otherwise I couldn't use the ACCEPT target)..
> 
> Is this a bug, or am I misunderstanding something?
> 
> 

-- 
Andy Loukes
http://www.navaho.co.uk						Complete Appliance Technology


