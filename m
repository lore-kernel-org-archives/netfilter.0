From: Antony Stone <Antony@Soft-Solutions.co.uk>
Subject: Re: Gateway \ FW
Date: Mon, 19 Jul 2004 10:36:52 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407191036.52096.Antony@Soft-Solutions.co.uk>
References: <HAEOIFPIBBBLGLHOMLLIKEHMCEAA.bclark@eccotours.biz>
Reply-To: "iptables" <netfilter@lists.netfilter.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <HAEOIFPIBBBLGLHOMLLIKEHMCEAA.bclark@eccotours.biz>
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
To: iptables <netfilter@lists.netfilter.org>

On Monday 19 July 2004 9:49 am, Brent Clark wrote:

> Hi all
>
> I once again ask if anyone would be so kind as to review my rules and, sure
> some advice.

> I also have a rule as such /sbin/iptables -A FORWARD -i eth1 -o eth0 -j
> ACCEPT which looks very wrong to me,

Why does it look very wrong to you?   What's the problem with it?   It seems 
to me to be a rule allowing any traffic from your internal network to the 
Internet - is that not what you want?

A few other comments on your ruleset:

1. You have a LOT of INPUT and OUTPUT rules, and apparently very few FORWARD 
rules, and yet this machine seems to be acting as a gateway router to the 
Internet.

2. You have a lot of specific DROP rules (as well as a default DROP policy).   
Is there some good reason why you do not simply have specific ACCEPT rules 
for the traffic you *want* (the rules for which would presumably be much 
simpler and shorter than all the rules for the stuff you want to DROP), and 
then the default DROP policy?

3. You have a line near the top of your ruleset: "/sbin/iptables -A FORWARD -m 
state --state ESTABLISHED,RELATED -j ACCEPT", and then about half way down: 
"/sbin/iptables -A FORWARD -i eth0 -o eth1 -m state --state 
ESTABLISHED,RELATED -j ACCEPT".   The second is redundant, as the first will 
accept ESTABLISHED and RELATED packets no matter what the interfaces are.

Regards,

Antony.

-- 
Bill Gates has personally assured the Spanish Academy that he will never allow 
the upside-down question mark to disappear from Microsoft word-processing 
programs, which must be reassuring for millions of Spanish-speaking people, 
though just a piddling afterthought as far as he's concerned.

 - Lynne Truss, "Eats, Shoots and Leaves"

                                                     Please reply to the list;
                                                           please don't CC me.


