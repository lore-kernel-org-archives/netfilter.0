From: Johan Cimen <c99jcn@cs.umu.se>
Subject: Re: iptables newbie
Date: Sat, 27 Dec 2003 18:05:12 +0100 (MET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.GSO.4.58.0312271715200.23735@peppar.cs.umu.se>
References: <Pine.GSO.4.58.0312271424260.10965@peppar.cs.umu.se>
 <1072536610.1868.41.camel@jasiiitosh.nexusmgmt.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1072536610.1868.41.camel@jasiiitosh.nexusmgmt.com>
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
To: "John A. Sullivan III" <john.sullivan@nexusmgmt.com>
Cc: netfilter@lists.netfilter.org


A more precise explanation of my problem:
When I use below command within my script,

iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
--set-tos 0x10

where I have an iptables -L at the very end, I can see the results:

Chain OUTPUT (policy ACCEPT)
target  prot opt source  destination
TOS     udp -- anywhere  anywhere    udp dpt:7001 TOS set Maximize-Throughput

But very next used: iptables -L at my prompt shows nothing else than
headlines. The results shown from my script are disapeared! iptables -L
was the last thing my script did before exit 0.

> On Sat, 2003-12-27 at 08:31, Johan Cimen wrote:
> > Problem that I have is:
> > 1. I cannot use:
> >    iptables -t mangle -A OUTPUT -o $IFACE -p UDP --dport 7001 -j TOS
> > --set-tos 0x10
> >    Using iptables -L shows nothing under OUTPUT headline.

#2 below was just an example used at prompt. If I use iptables command
without tables, because tables used at prompt are not shown:
iptables -A OUTPUT -o $IFACE -p UDP --dport 7001,
And after that using iptables -L shows:

Chain OUTPUT (policy ACCEPT)
target  prot opt source  destination
        udp -- anywhere  anywhere

But if I use PREROUTING or POSTROUTING it says: No chain/target/match by
that name. I cannot use PREROUTING and POSTROUTING at prompt, which is
possible in script.

> > 2. I cannot use (just an example, nothing to do with what i want to do):
> >    iptables -A POSTROUTING -o $IFACE -p UDP --dport 7001

> >    iptables says: No chain/target/match by that name
> >    Above iptable command works for INPUT, FORWARD and OUTPUT chains.


> On Sat, 27 Dec 2003, John A. Sullivan III wrote:
> Are you remembering to specify the table with -t mangle or -t nat if you
> are not using the filter table? You do this in rule #1 but not rule #2
> and if you do iptables -L OUTPUT you will see the rules of the filter
> table OUTPUT chain and not mangle or nat.  Good luck - John

Yes I understand that I have to use -t mangle if I dont use filter table.
But I cannot se the results from my commands included with -t mangle. Is
this not possible? If not, why is my script showing results that are
disapeared after execution of my script terminations?

What I am trying to explain is that I got results when I am using iptables
commands in my script and those are disapeared after the termination of my
scripts. And I am trying to say that if I use iptables commands without
tables and without PREROUTING, POSTROUTING, its OK, but I want to use
tables and PREROUTING, POSTROUTING as well in script as at prompt. I
cannot do this.

Suggestions ??

 -Johan-

