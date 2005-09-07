From: "Salim" <salim.si@askey.com.tw>
Subject: Re: iptables: can't set any ip address in rules
Date: Wed, 7 Sep 2005 17:10:33 +0800
Message-ID: <01a301c5b38c$10742e50$205f030a@askeyrd3>
References: <005e01c5b1df$46279630$205f030a@askeyrd3>
	<017c01c5b385$3f7bfe00$205f030a@askeyrd3>
	<431EA842.2050502@toxicnet.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: Sascha Reissner <sascha.reissner@toxicnet.de>
Cc: netfilter@lists.netfilter.org

no Sascha, it was not the problem with protocol. And yes, i added -t nat to
the rule, it was a typing error that i missed it in the post.
for DNAT, I reckon, it is not necessary to add protocol, unless port number
is specified.
The problem was with strtoull function, I changed it to strtoul and it works
fine.
thanks

----- Original Message -----
From: "Sascha Reissner" <sascha.reissner@toxicnet.de>
To: "Salim" <salim.si@askey.com.tw>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, September 07, 2005 4:43 PM
Subject: Re: iptables: can't set any ip address in rules


> Argh, i mean please add a protocol to the rule, and add the nat table to
> the rule.. you always use -t but you do not specify the nat table.. in
> your rules "-t" should be replaced with "-t nat"
>
> regards,
> sascha
>
> Salim wrote:
> > this issue has been solved. seems like 'unsigned long long' doesn't work
on
> > my system. changed 'strtoull' to 'strtoul'. Now it looks okay.
> > thanks for all who have spent time on my question.
> >
> > ----- Original Message -----
> > From: "Salim" <salim.si@askey.com.tw>
> > To: <netfilter@lists.netfilter.org>
> > Sent: Monday, September 05, 2005 2:01 PM
> > Subject: iptables: can't set any ip address in rules
> >
> >
> > Hello all,
> >     I am not able to set any rule that contsin ip address in the
iptables.
> > For example I give this command
> >
> >
> >>iptables -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
> >
> >
> > then, I issue the command >iptables -t nat -L.
> >
> > the result is
> >
> > Chain POSTROUTING (policy ACCEPT)
> > target           DNAT
> > prot              all
> > opt                --
> > source          anywhere
> > destination    0.0.0.0   to:0.0.0.0
> >
> >
> > I gave the command with verbose
> >
> >>iptables -v -t -A PREROUTING -d 1.1.1.1 -j DNAT --to-destination 2.2.2.2
> >
> >
> > it showed
> > DNAT all opt -- in * out * 0.0.0.0/0 -> 0.0.0.0 to:0.0.0.0
> >
> >
> > for any command which has an ipaddress, the ip address always is always
> > takes as 0.0.0.0
> >
> > I am using Redhat Linux 2.4.25
> > iptables v1.3.3
> > MIPS embedded system.
> >
> > I am confused. Any help will be greatly appreciated.
> >
> > regards
> > Salim
> >
> >
> >
>


