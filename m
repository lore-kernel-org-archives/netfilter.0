From: Askar <askarali@gmail.com>
Subject: Re: ram and processor cycles for a firewall machine
Date: Sat, 2 Oct 2004 12:19:27 +0600
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <a0f69e504100123195d7b2323@mail.gmail.com>
References: <a0f69e504093023354ec7c59e@mail.gmail.com>
	<1096637833.22962.36.camel@wolfpack.ljm.dom>
	<a0f69e5041001122911e148b5@mail.gmail.com>
	<8ca4228204100113182b5bdc06@mail.gmail.com> <415DC76F.9050801@pbl.ca>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <415DC76F.9050801@pbl.ca>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Aleksandar Milivojevic <amilivojevic@pbl.ca>
Cc: netfilter@lists.netfilter.org

Thanks Jason, Aleksandar now the things kinda clear to me about the
magic of "optimize" a ruleset :)

regards
askar

On Fri, 01 Oct 2004 16:09:03 -0500, Aleksandar Milivojevic
<amilivojevic@pbl.ca> wrote:
> Mike wrote:
> > Me too--- I'd like to learn what it means to optimize my iptables.
> > After using iptables for 2 years but never really taking the time to
> > digest what it means to filter data across tables, I'm trying to
> > really understand what's going on.  I've started with Oskar
> > Andreasson's tutorial, but I definitely don't see anything about
> > optimization in there.
> 
> It can mean many things, and depends on actual configuration and needs.
>   Idea behind optimization is to minimize average number of rules that
> packets will traverse.
> 
> Simple example could be if you have bunch of rules with "-m state
> --state NEW" and than somewhere at the end you have catch-all "-m state
> --state ESTABLISHED", moving that rule to the top will make huge
> difference (because majority of packets will be matched by it).
> 
> On a very bussy site with simple set of rules (but huge number of
> simultanious connections) eliminating connection tracking could increase
> performance (if traversing couple of rules is faster than lookup into a
> huge table, of course).  I don't know how connection tracking table is
> organized and how the entries are looked up, so don't ask me for a
> numbers when it makes sense not to use connection tracking, but majority
> of people probably wouldn't benefit from turning it off.  However, do
> note that this will be tradeoff between performance and security.
> 
> Another example is if you have bunch of rules allowing access to service
> only from certain IP addresses (say there's 20 of them).  Creating user
> defined chain for that service (for example -p tcp --dport 80 -j HTTP),
> and than checking if packet is from one of 20 allowed IP addresses means
> that all other packets will have to be checked only by 1 rule, not by 20
> of them.  Or you can go the other way around, if you are checking single
> IP address agains number of services (in this case using multiport
> module can be usefull too).  Something like -s a.b.c.d -j CLIENT_A.
> 
> These are just some simple and obvious examples.  The idea is to
> minimize number of checks that need to be done on a packet before it is
> accepted or dropped.  Obviously, what can be done differs from one
> config to another.
> 
> P.S.
> Offtopic: seems that Google mail is becoming quite popular on the
> mailinglist...
> 
> --
> Aleksandar Milivojevic <amilivojevic@pbl.ca>    Pollard Banknote Limited
> Systems Administrator                           1499 Buffalo Place
> Tel: (204) 474-2323 ext 276                     Winnipeg, MB  R3T 1L7
> 
> 



-- 
(after bouncing head on desk for days trying to get mine working, I'll make
your life a little easier)

