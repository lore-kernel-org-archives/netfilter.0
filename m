From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: block port 137
Date: Tue, 3 Aug 2004 09:41:11 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200408030941.11162.Antony@Soft-Solutions.co.uk>
References: <267354A234DF4D46AA6AE56E1240BEF004A3BF@tv.wcslnet.net> <200408030717.59289.Antony@So ft-Solutions.co.uk> <1091518405.4693.15.camel@dc.nucleussoftware.com>
Reply-To: netfilter@lists.netfilter.org
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1091518405.4693.15.camel@dc.nucleussoftware.com>
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

On Tuesday 03 August 2004 8:33 am, Dhananjoy Chowdhury wrote:

> On Tue, 2004-08-03 at 11:47, Antony Stone wrote:
> >
> > I disagree.
> >
> > Try ACCEPTing the packets you *want* to go through the firewall, and DROP
> > everything else.
>
> Your terminology is very much true but David has already applied  the
> rule
> #iptables -A FORWARD -p udp -s 0/0 --dport 137 -j DROP

That is not the same rule as "iptables -I FORWARD......"

I suspect he has a rule somewhere in the ruleset which is allowing the packets 
(perhaps based on source address?), which adding a rule at the end will not 
solve.   Putting the DROP rule at the top of the ruleset makes a big 
difference.

If the problem is packets to random destination ports, *from* UDP port 137, 
then it doesn't sound like what the ISP originally complained about, and 
what's the threat anyway (since destination port is what matters in terms of 
vulnerabilities and exploits)?

Regards,

Antony.

-- 
If the human brain were so simple that we could understand it,
we'd be so simple that we couldn't.

                                                     Please reply to the list;
                                                           please don't CC me.


