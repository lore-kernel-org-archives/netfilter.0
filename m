From: Kevin Dwyer <kevin@pheared.net>
Subject: Re: Using heartbeat for fall over on IPTables Firewall
Date: Mon, 17 Mar 2003 14:11:56 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030317141156.579b5eed.kevin@pheared.net>
References: <3019863CF306D211BA4500A0CC30812DC67927@exchange.cyberwolf.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3019863CF306D211BA4500A0CC30812DC67927@exchange.cyberwolf.com>
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
To: Chip Upsal <cupsal@cyberwolf.com>
Cc: netfilter@lists.netfilter.org, linux-ha@muc.de

On Mon, 17 Mar 2003 09:16:46 -0700
Chip Upsal <cupsal@cyberwolf.com> wrote:

> I am looking to use heartbeat to provide fall over for my iptables
> firewall. I am looking for those with experience using these tools
> together. 
> 
> I plan to use RH7.2 on the firewalls.

I've been using a modified debian, but most distributions should be
fine.

> I made some attempts at implementing such a solution but i ran into a
> few problems. 
> 
> I would like suggestions on setup of the heartbeat configuration
> files. Pointers on the iptables startup script. and advice on what
> kernel version to use and if any patches need to be applied.

One way to do it is to setup heartbeat with ipfail.  Consult the mailing
list archives and the documentation for more details.

You'll probably want a fairly generic ruleset that you can apply to both
firewalls.  I've successfully done this by hand and with fwbuilder.

Depending on how you set things up you may or may not need a resource
script for heartbeat to execute when the firewall picks up the virtual
IP or loses it.  I had to do this to handle problems with both machines
holding the same aliases for my NATs.  Sometimes that will create some
ARP hell, but it's very situation dependent.  If you need to do this,
consult the scripts that are installed in $sysconfdir/ha.d/resource.d/
for examples.

The one big thing that is missing from this setup is state table
replication.  I've been interested in getting that working but the
nf-failover list has been quiet, and I haven't had a lot of free time to
poke at code.  If anyone out there is interested in working on it, I'd
like to hear from you.

-- 
/* kevin@pheared.net               http://pheared.net/devel/ */
/* Network Security Engineer       http://pheared.net/~kevin */
/* Sabotage will set us free.   Throw a rock in the machine. */
/*   >++++++++++[<++++++++++>-]<.+++++.----.[-]++++++++++.   */

