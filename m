From: "Gary W. Smith" <gary@primeexalia.com>
Subject: Re: --policy DROP kills everything?
Date: Wed, 08 Jun 2005 22:04:24 -0700
Message-ID: <BECD1BE8.8F6A%gary@primeexalia.com>
References: <23591.65.121.191.30.1118318071.squirrel@lithium.edoceo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <23591.65.121.191.30.1118318071.squirrel@lithium.edoceo.com>
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
To: busby@edoceo.com, netfilter@lists.netfilter.org

This may or my not help your situation.  Included are my rules for the INPUT
chain on one of my firewalls.  We don't default drop (which can be bad) but
rather end all our chains with REJECT icmp-host-prohibited.  But something
you might want to do to quickly solve this problem is to try the following:

Instead of defaulting to DROP put a LOG at the end of the INPUT chain with
something like '-j LOG --log-prefix "INPUT_DROP: " --log-level 1'.  Then do
a tail -n 0 -f /var/log/messages | grep "INPUT_DROP".  It will tell you
exactly what you have missed.

While you are at it you might want to do the same for FORWARD and OUTPUT to
rule out the usual suspects.

The output from the logs might be more useful to you that trying to guess at
why the related connection isn't working.

BTW, here is my INPUT.  eth0 if external IF, eth1 is internal IF, lo, well
if I explain that you need some funamentals, ppp+ is the PPTPD IF.
Basically I allow all interfaces to come in.  eth0 doesn't actually accept
any data but just log the number of bytes that travel across it's IF for
accounting purposes.

Chain INPUT (policy ACCEPT 0 packets, 0 bytes)
target     prot opt in     out     source               destination
INCOUNT    all  --  eth0   *       0.0.0.0/0            123.123.123.1
ACCEPT     all  --  lo     *       0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  eth1   *       0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  ppp+   *       0.0.0.0/0            0.0.0.0/0
ACCEPT     icmp --  *      *       0.0.0.0/0            0.0.0.0/0
ACCEPT     all  --  eth0   *       0.0.0.0/0            0.0.0.0/0
state RELATED,ESTABLISHED

ACCEPT     all  --  eth0   *       0.0.0.0/0            0.0.0.0/0
MARK match 0x1 

filter_firewall  all  --  eth0   *       0.0.0.0/0            0.0.0.0/0
filter_trusted  all  --  *      *       0.0.0.0/0            0.0.0.0/0
LOG        all  --  *      *       0.0.0.0/0            0.0.0.0/0
LOG flags 0 level 1 prefix `INPUT: '

REJECT     all  --  *      *       0.0.0.0/0            0.0.0.0/0
reject-with icmp-host-prohibited

Hope the helps, 

Gary Smith


On 6/9/05 4:54 AM, "busby@edoceo.com" <busby@edoceo.com> wrote:

> My OUTPUT and FORWARD tables have policy ACCEPT and no rules.
> It's only INPUT that is causing headache.  In my current state (below) an
> established connection is OK (like ssh in then start) but after adding
> these rule no new connection can be made.
> 
> Config:
>> 
>> imperium root # iptables -L INPUT -n
>> Chain INPUT (policy DROP)
>> target     prot opt source               destination
>> ACCEPT     all  --  127.0.0.0/8          0.0.0.0/0
>> ACCEPT     udp  --  192.168.42.1         192.168.42.2        udp spt:53
> ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:22
> ACCEPT     tcp  --  0.0.0.0/0            192.168.42.2        tcp dpt:80
> ACCEPT     all  --  0.0.0.0/0            0.0.0.0/0           state
> RELATED,ESTABLISHED
>> LOG        all  --  0.0.0.0/0            0.0.0.0/0           LOG flags 0
> level 4
>> 
> 
> 
> 
> 


