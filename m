From: "Kevin Stadlmayer" <kevins@wirelessedge.ca>
Subject: TIME extension rule not matching under (Fedora) kernel 2.6.9?
Date: Fri, 4 Mar 2005 16:55:25 -0700
Message-ID: <200503042355.j24NtSu3027597@mail79.megamailservers.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Has anyone been using the TIME extension with Fedora 3 (kernel 2.6.9)?

I have patched the kernel with the patch-o-matic, and any rules that I add
show up in the iptables rules listing.  However, no packets are matching the
rules.  I can create a rule that is identical to the TIME based rule,
without the TIME constraint, and the rule matches fine.  As soon as I add
the "-m time" component to the rule, no more matching.

I am pretty sure that I am doing things the correct way, because I did the
identical thing with Red Hat 9 last year, with no problems.  

I have tried time periods of various lengths, with and without both the
"--timestart", "--timestop", and "--days" parameters.

My system clock is set correctly.  We are currently on daylight time, but I
am going with what the system clock says when I attempt my tests.

The gateway machine used for testing has eth1 on the ingress side (connected
to a 10.0.0.* network), and eth0 on the egress side (a 192.168.0.* network).
I do the following (with one POSTROUTING MASQUERADE rule in place to ensure
that the ICMP response is returned correctly):

# iptables -t nat -A PREROUTING -s 10.0.0.30 -i eth1 -p icmp -j DROP #
iptables -t nat -L PREROUTING -nv Chain PREROUTING (policy ACCEPT 12386
packets, 1463K bytes)
 pkts bytes target     prot opt in     out     source            destination

    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0

Pinging an external address from the 10.0.0.30 through the eth1, I see my
request timing out, as the packets are matched and dropped.  Also:

# iptables -t nat -L PREROUTING -nv
Chain PREROUTING (policy ACCEPT 12396 packets, 1464K bytes)
 pkts bytes target     prot opt in     out     source            destination

    2   120 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0

We see that two packets have, in fact, been matched by this rule.

Now, I add a TIME extension-based rule before this one.  If everything works
correctly, it should catch the ICMP packets before the original, non-TIME
rule does.

Today being Wednesday, I give myself one day in either direction:

# iptables -t nat -I PREROUTING 1 -s 10.0.0.30 -i eth1 -p icmp -m time
--days Tue,Wed,Thu -j DROP # iptables -t nat -L PREROUTING -nv Chain
PREROUTING (policy ACCEPT 12584 packets, 1488K bytes)
 pkts bytes target     prot opt in     out     source            destination

    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0
TIME on Tue,Wed,Thu
    2   120 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0

I ping the external address again, and:

# iptables -t nat -L PREROUTING -nv
Chain PREROUTING (policy ACCEPT 12593 packets, 1489K bytes)
 pkts bytes target     prot opt in     out     source            destination

    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0
TIME on Tue,Wed,Thu
    3   180 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0

The TIME based rule is not matching.  The original rule still matches,
though.

I try another, using the time of day:

# iptables -t nat -I PREROUTING 1 -s 10.0.0.30 -i eth1 -p icmp -m time
--timestart 01:00 --timestop 23:00 -j DROP # iptables -t nat -L PREROUTING
-nv Chain PREROUTING (policy ACCEPT 12605 packets, 1491K bytes)
 pkts bytes target     prot opt in     out     source
destination

    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0
TIME from 1:0 to 23:0 on all days
    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0
TIME on Tue,Wed,Thu
    3   180 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0

Pinging...

[root@newyork root]# iptables -t nat -L PREROUTING -nv Chain PREROUTING
(policy ACCEPT 12611 packets, 1491K bytes)
 pkts bytes target     prot opt in     out     source
destination

    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0
TIME from 1:0 to 23:0 on all days
    0     0 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0
TIME on Tue,Wed,Thu
    4   240 DROP       icmp --  eth1 *       10.0.0.30        0.0.0.0/0

Still, only the original rule is matching, not the TIME based rules.

I have tried this with iptables v1.2.11, and now I am now using iptables
v1.3.0.  No difference.

Has anyone else experienced this?


Thanks,

Kevin Stadlmayer


