From: Cody Harris <hchs@ns.sympatico.ca>
Subject: Re: Not forwarding?
Date: Sun, 28 Mar 2004 17:07:33 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040328170733.23247779@darna.vectec.net>
References: <20040328155231.32b07799@darna.vectec.net>
	<200403282143.47746.lists@edeca.net>
	<200403282154.17071.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200403282154.17071.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

I rewrote the rules following your suggestions. It still doesn't work:

Chain INPUT (policy ACCEPT 300 packets, 77689 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:10000
    0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:631
    0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:http
    0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:smtp
    0     0 DROP       tcp  --  eth0   any     anywhere             anywhere           tcp dpt:ftp
    0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp echo-reply
    0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp destination-unreachable
    0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp redirect
    0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp echo-request
    0     0 ACCEPT     icmp --  eth0   any     anywhere             anywhere           icmp time-exceeded
    0     0 DROP       icmp --  eth0   any     anywhere             anywhere

Chain FORWARD (policy ACCEPT 0 packets, 0 bytes)
 pkts bytes target     prot opt in     out     source               destination
    0     0 ACCEPT     all  --  eth1   any     anywhere             anywhere
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere           icmp echo-reply
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere           icmp destination-unreachable
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere           icmp redirect
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere           icmp echo-request
    0     0 ACCEPT     icmp --  any    any     anywhere             anywhere           icmp time-exceeded
    0     0 ACCEPT     tcp  --  any    any     anywhere             192.168.0.2        tcp dpt:ssh state RELATED,ESTABLISHED

Chain OUTPUT (policy ACCEPT 301 packets, 66019 bytes)
 pkts bytes target     prot opt in     out     source               destination


On Sun, 28 Mar 2004 21:54:17 +0100,
Someone named Antony Stone <Antony@Soft-Solutions.co.uk> wrote:

> On Sunday 28 March 2004 9:43 pm, David Cannings wrote:
> 
> > On Sunday 28 March 2004 20:52, Cody Harris wrote:
> > > This is my firewall setup:
> > > Chain FORWARD (policy ACCEPT)
> > > target     prot opt source               destination
> > > ACCEPT     all  --  anywhere             anywhere
> > > ACCEPT     icmp --  anywhere             anywhere           icmp
> > > echo-reply ACCEPT     icmp --  anywhere             anywhere
> > > icmp destination-unreachable ACCEPT     icmp --  anywhere
> > > anywhere           icmp redirect ACCEPT     icmp --  anywhere
> > >   anywhere           icmp echo-request ACCEPT     icmp --  anywhere
> > >         anywhere           icmp time-exceeded ACCEPT     tcp  --
> > > anywhere             192.168.0.2        tcp dpt:ssh
> > > We have noticed that ssh isn't getting forwarded. What's wrong?
> >
> > What about the replies from SSH which will come from source port 22?
> > Either add a rule to explicitly allow from sport ssh or add an
> > ESTABLISHED/RELATED rule in there.
> 
> That might be covered by the first rule:
> 
> > > ACCEPT     all  --  anywhere             anywhere
> 
> We won't know until we see the output of a listing with -v to show us the 
> interfaces too.
> 
> However your point about there being no ESTABLISHED,RELATED rule is a good one 
> - it suggests that netfilter is not being used statefully, which means it is 
> very difficult to make the system (a) work and (b) secure at the same time.
> 
> Regards,
> 
> Antony.
> 
> -- 
> Wanted: telepath.   You know where to apply.
> 
>                                                      Please reply to the list;
>                                                            please don't CC me.
> 
> 


-- 
+------------------+-----------------------------+
| Cody Harris      | --------------------------- |
| ---------------- | --------------------------- |
+------------------+-------+---------------------+---+
| *Sigh*. No key.                                    |
+----------------------------------------------------+

