From: Grant Taylor <gtaylor@riverviewtech.net>
Subject: Re: Force use of outgoing IP address
Date: Fri, 01 Jun 2007 12:22:56 -0500
Message-ID: <466055F0.5050405@riverviewtech.net>
References: <B3FAB89EFECD684E9E648B81133263F1466025@MAIL_COM.MULBERRY.COM>
Reply-To: gtaylor+reply@riverviewtech.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <B3FAB89EFECD684E9E648B81133263F1466025@MAIL_COM.MULBERRY.COM>
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

On 06/01/07 11:42, Neil Russell wrote:
> I have a linux router with 3 network cards in, each card has multiple
> IP address's assigned. I want to route all aoutbound traffic TO a
> destination port of $DESTPRT out of eth0 on its IPAddress of
> 10.0.0.2.

If you want ONLY the traffic that is destined to $DESTPRT to use the 
alternative IP, you will probably need to set up multiple routing tables 
similar in all respects except for the source IP used.  Then you can use 
  "ip rule" to decide which traffic uses the alternative routing table 
and source IP.  I.e. everything by default uses the main IP address 
while only traffic destined to $DESTPRT uses the other IP.  Is this what 
you are after?

> So ALL traffic on the router with a destination address MUST go out
> on eth0 and show its IP address as 10.0.0.2 even though the default
> route is out via 10.0.0.1

Hugh?  Are you saying you want all traffic leaving the system to have an 
IP address of 10.0.0.2 not 10.0.0.1?  If this is the case, switch the 
first and second IP address in your configuration.  I believe by default 
the system will use the primary IP address of an interface as it's 
default that it bind traffic to.  I.e. eth0 verses eth0:1 / eth0:2. 
Though I'm not sure, it may choose the lowest IP address not the first one.

> Hope thats clear and that someone can advise.

No, not really.  I'm having trouble identifying which types of traffic 
you are wanting to change both up top and down below.



Grant. . . .

