From: George Alexandru Dragoi <waruiinu@gmail.com>
Subject: Re: Accounting for national/international traffic
Date: Wed, 22 Dec 2004 00:36:01 +0200
Message-ID: <3063e5041221143655fc9644@mail.gmail.com>
References: <20041221085518.92203.qmail@web42105.mail.yahoo.com>
	<200412211333.00841.Alistair@nerdnet.ca>
Reply-To: George Alexandru Dragoi <waruiinu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200412211333.00841.Alistair@nerdnet.ca>
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
To: Alistair Tonner <Alistair@nerdnet.ca>
Cc: netfilter@lists.netfilter.org

Such ISPs use a different dscp in tos parameter in IP header. Here
some ISPs uses tos 0x80 or 0x84 or 0x21 . If you see tos 0x80 you can
match it with -m dscp --dscp 0x20 . For such details, better ask your
ISP.


On Tue, 21 Dec 2004 13:33:00 -0500, Alistair Tonner <Alistair@nerdnet.ca> wrote:
> On December 21, 2004 03:55 am, Jean Hoderd wrote:
> > Hi,
> >
> > Here's the situation: in many countries it is customary for IPS's to
> > have separate quotas for national/international traffic (in my case the
> > limits are 20GB/2GB per month).
> >
> > Now, given an IP address, knowing whether it is national or
> > international is a solved problem: there are publicly available lists
> > with the ranges of national IP addresses.
> >
> > The problem: how to keep track of the monthly internet usage divided
> > into national/international traffic.
> >
> > Please note that I am not interested in enforcing quotas per se (the
> > "quota" module, I believe).  Rather, I would simply like to know what
> > is the total traffic per category since the beginning of the month.
> >
> > I have searched netfilter's repository, and it seems that the
> > ipt_account module might do the trick.  However, since I am still a
> > newbie with netfilter, I am having some trouble defining the actual
> > rules to make it work.  Let us imagine, for instance, that I have n
> > ranges of national IP addresses.  Adding them to a "national" counter
> > seems easy:
> >
> > iptables -A INPUT -m account --addr "range1" --aname national
> > iptables -A INPUT -m account --addr "range2" --aname national
> > ...
> > iptables -A INPUT -m account --addr "rangen" --aname national
> >
> > The question is: how do I implement the logic for all non-matching
> > ranges, which should be added to an "international" counter?
> > Furthermore, I have already plenty of rules in my firewall, and I wish
> > that the traffic accounting would not interfere with them.
> 
>  You want to have two user chains to do this.
>  create the 'accounting' chain in which you will account the packets with the
> rules you've given, and *AFTER* each accounting rule put a matching rule that
> RETURNS the packets to the calling chain.  At the end of the 'accounting'
> chain add one rule to an 'international' chain that accounts for all non
> returned packets.  At the end of the 'international chain the packets will
> return to the 'accounting'  chain and since they are already on the end of
> that they will RETURN to the calling chain.
> 
> iptables -A accounting -m account --addr 'range1' --aname national
> iptables -A accounting -d range1 -j RETURN
> iptables -A accounting -m account --addr 'range2' --aname national
> iptables -A accounting -d range2 -j RETURN
> iptables-A accounting -j international
> iptables -A international -m account --aname international
> 
> 
>  Alistair Tonner
> 
> 
> >
> > Thanks in advance for any help you can give me!
> > Regards,
> > Jean
> >
> >
> >
> >
> >
> > __________________________________
> > Do you Yahoo!?
> > Send a seasonal email greeting and help others. Do good.
> > http://celebrity.mail.yahoo.com
> 
> 


-- 
Bla bla

