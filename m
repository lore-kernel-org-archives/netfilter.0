From: Jim Laurino <nfcan.x.jimlaur@dfgh.net>
Subject: Re: DNAT problem /  question (nfcan: addressed to exclusive sender for this address)
Date: Mon, 21 Jun 2004 00:25:10 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040621042510.GA25073@salty>
References: <519AD2BA94FC6E4DB5DE078B2E37CB10A76C99@PDBEX01E.pdb.fsc.net>
Reply-To: nfcan.x.jimlaur@dfgh.net
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <519AD2BA94FC6E4DB5DE078B2E37CB10A76C99@PDBEX01E.pdb.fsc.net> (from +nfcan+jimlaur+89aa08404c.Bert.Arnauts#fujitsu-siemens.com@spamgourmet.com on Sun, Jun 20, 2004 at 18:24:16 -0400)
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; format="Flowed"; delsp="Yes"; charset="us-ascii"
To: netfilter@lists.netfilter.org

On 2004.06.20 18:24, Arnauts Bert  - Bert.Arnauts@fujitsu- 
siemens.com wrote:
> Hello all,
> 
> thx already for the hints, but I am still in a strugle.
> I changed my destination ip to 207,
> because 220 could cause problems.
> Forgive me that I don't understand why.
> Anyway, these rules give even a more confusing result.
> I am still not able to access my 11.0.0.16
> box through the 172.25.239.207 DNAT'ed alias.
> (not pingable, not nothing)
> I also can not connect anymore to my netfilter box
> anymore after executing this script,
> BUT my active ssh connection stays open ! ?
> I am still on my machine remotly,
> but I can not ping it anymore ?? :(
> 
> Any more ideas ?
> ------------------------------------------------------------
> 
> echo "Activating firewall script generated
> Thu Jun 10 15:03:22 2004 CEST by root"
> 
> $IPTABLES -t nat -A PREROUTING -d 172.25.239.207/27
> -j DNAT --to-destination 11.0.0.16
> 
> $IPTABLES -A INPUT   -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A OUTPUT  -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> $IPTABLES -A FORWARD -m state --state
> NEW,ESTABLISHED,RELATED -j ACCEPT
> 
> $IPTABLES -N RULE_0
> $IPTABLES -A OUTPUT  -d 11.0.0.16  -m state --state NEW
> - j RULE_0
> $IPTABLES -A FORWARD -d 11.0.0.16  -m state --state NEW
> -j RULE_0
> $IPTABLES -A RULE_0  -j LOG --log-level info
> --log-prefix "RULE 0 -- ACCEPT "
> $IPTABLES -A RULE_0  -j ACCEPT
> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> execution of this script gives me this :
> (why is there 192 ? in stead of 207 ?)

> [root@linuxrouter root]# iptables -t nat -L
> Chain PREROUTING (policy ACCEPT)
> target     prot opt source               destination
> 
> DNAT       all  --  anywhere              
> 172.25.239.192/27 to:11.0.0.16

Because the programmers were being kind to you :)
The 192 is the base address for the range 192-223,
and is exactly what you need for a .207/27.
(That is, the low 5 bits need to be zeros.)

It will be less confusing, later,
if you change your rule to:

$IPTABLES -t nat -A PREROUTING -d 172.25.239.192/27
-j DNAT --to-destination 11.0.0.16
(but see below, I think you may not mean to do this)

If you change the List command from:

iptables -t nat -L
to
iptables -t nat -L -nvx

The -v (--verbose) and -x (--exact) flags
will give you (among other things) the
exact number of packets that have matched
each rule.

To look at the main (filter) table do:
iptables -L -nvx

I think that you will see that all packets
here match these first rules:

-m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Therefore the "Rule 0" test, which comes later,
will never get a chance to look at them,
and will have a zero count.

Change those first rules to:

-m state --state ESTABLISHED,RELATED -j ACCEPT

Then the "Rule 0" tests will match NEW packets.

The PREROUTING rule says that any packet
addressed to 172.25.239.207 will be changed
to a destination address of 11.0.0.16.
(In fact any address 172.25.239.192 through
172.25.239.223 will become 11.0.0.16)

Therefore, when a packet originally addressed
to 172.25.239.207 (in on eth1) arrives (later)
at the filter table it will have a
destination address 11.0.0.16 and will
traverse the FORWARD chain and leave by eth0.
Only the host with that address (.16) will receive packets.
This explains why the netfilter host is inacessible.

Also, you said:

> I have everything in the 172.25.239.0/27 network.

This must be a typo, because this does not
include 172.25.239.207, which is one of
the 31 addresses in the 172.25.239.192/27 network.

From other things you have said,
I think you may be trying to translate a series
of addresses exactly one to one:

172.25.239.207 <--> 11.0.0.16

I think you can best do this by using an
explicit PREROUTING rule for each pair.
That is, get rid of the /27,
and add a rule for each address pair.
Then you can keep, say .208, not translated,
and allow this to be used as the address
of the netfilter host. Like this:

$IPTABLES -t nat -A PREROUTING -d 172.25.239.207
-j DNAT --to-destination 11.0.0.16

Jim

