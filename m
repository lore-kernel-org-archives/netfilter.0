From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Re: iptables help
Date: Thu, 29 Jul 2004 19:28:48 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407291928.48974.Antony@Soft-Solutions.co.uk>
References: <Pine.LNX.4.44.0407291026030.2121-100000@ivanhoe.pcraft.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0407291026030.2121-100000@ivanhoe.pcraft.com>
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
To: netfilter@lists.netfilter.org

On Thursday 29 July 2004 5:29 pm, Ashley M. Kirchner wrote:

> On Thu, 29 Jul 2004, Antony Stone wrote:
> > 1. What help do you need?   Adding rules to block specific traffic is
> > quite simple:
>
> 	Simple, yes, I agree.  However, because there are several sections
> in this iptables file, I'm not sure _where_ I need to be inserting more
> rules for it to work properly.
>
> > iptables -I FORWARD -s a.b.c.d -d w.x.y.z -p tcp --dport 80 -j REJECT

"-I" will insert the rule at the top of the FORWARD chain, and therefore 
guarantees that these packet will be REJECTed, no matter other rules follow 
in your ruleset.

> > a.b.c.d is the machine in your network you want the block to apply to
> > w.x.y.z is a machine on the Internet you don't want them to access
>
> 	However, with places such as Yahoo and Hotmail, where there's a
> whole farm of machines doing the work, blocking per IP will simply result
> in a long list of rules, correct?  Is there a way to use a CIDR address?

Yes, you can say:

iptables -I FORWARD -s a.b.c.d -d w.x.y.z/n -p tcp --dport 80 -j REJECT

where w.x.y.z could be 192.168.38.64/29 for example, to block destination 
addresses 192.168.32.64 to 192.168.38.72

Regards,

Antony.

-- 
The truth is rarely pure, and never simple.

 - Oscar Wilde

                                                     Please reply to the list;
                                                           please don't CC me.


