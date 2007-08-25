From: "G.W. Haywood" <ged@jubileegroup.co.uk>
Subject: Re: stop/start iptables vs. "iptables-restore"
Date: Sat, 25 Aug 2007 23:11:18 +0100 (BST)
Message-ID: <Pine.LNX.4.58.0708252219290.11021@mail3.jubileegroup.co.uk>
References: <200708251004.l7PA4Q5a008128@mail3.jubileegroup.co.uk>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200708251004.l7PA4Q5a008128@mail3.jubileegroup.co.uk>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

On Sat, 25 Aug 2007 Alex Tang wrote:

> We run a linux based product (RHEL4 based, kernel-2.6.9-55, and
> iptables-1.2.11).

Both versions sound a little old but I guess the guys at RH know what
they're doing.

> During the running of the product, when we make changes to the
> iptables configuration, we use the SysV-like RHEL script
> "/etc/init.d/iptables restart", which effectively stops iptables,
> unloads all of the iptables based kernel modules, then starts
> iptables and all the kernel stuff.

There's no iptables 'daemon', the iptables binary just modifies some
table in the kernel, so the script in init.d doesn't really stop (nor
start) anything.  The script probably just removes all the rules and
replaces them.  While you have no rules in the tables, you might have
no firewalling!

> A colleague recently asked why we're not using "iptables-restore"

I might have asked the same question. :)

> I'm looking to see if you know of any reasons why we should or
> should not use iptables-restore vs. "stop/start".  Does it matter if
> the number of connections on the system is high?

It depends what you're doing, what you want to know, exactly what's in
the script, and who is trying to do what to your machine.  You won't
break any connections if you delete the rules in the kernel's table
using the iptables command, but you might break them if you add rules
which prevent packets reaching their destination when your previous
rules allowed them.  I'd feel exposed if my start-stop script was
allowing unlimited access to a machine of mine even for brief periods.

We have tens of thousands of rules, and we also log packet and byte
counts.  Using simple scripts like those found in many distros isn't
an option for us on performance grounds alone (iptables is notoriously
slow to insert large numbers of rules) and using the '-c' option of
iptables-restore allows us to maintain the packet and byte counts.

The iptables kernel code is very slow to process packets through large
rulesets unless you use something like ipsets.  Performance with a few
hundred rules might be acceptable but if you have many more rules than
that, and if you have a lot of traffic, you should probably be looking
at better ways of doing it.  There are quite a few good reports on the
performance of iptables and other packet filtering tools.  Google will
find them for you.

Our rules are dynamically modified by scripts which call the iptables
and ipset binaries to add/delete individual rules.  Rulesets with
thousands of entries (generally blocking sources of network abuse) are
handled using ipset, rulests with small numbers of entries (things like
permitting ssh access for our remote users) by iptables.  Rulesets are
saved periodically as a backup by iptables-save (also ipset --save),
running from the crontab.  At boot time (i.e. at least once a year:)
the rulesets are restored from the backups using iptables-restore and
ipset --restore.

Unfortunately using ipsets means patching the kernel, that might not
be an option for you unless either RH have included the appropriate
patches in their kernel or you're prepared to build your own (and no
doubt lose some RH support).

--

73,
Ged.

