From: Philip Craig <philipc@snapgear.com>
Subject: Re: Match packet mark with --set-mark to ip rule fwmark
Date: Wed, 07 Jan 2004 16:17:13 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3FFBA469.9080205@snapgear.com>
References: <Law11-OE68Dt3HvoFOA00000021@hotmail.com> <3FFB927B.4010208@snapgear.com> <LAW11-OE14FjwUbowDp0001e8e9@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <LAW11-OE14FjwUbowDp0001e8e9@hotmail.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: kaiwen <cal_kaiwen@hotmail.com>
Cc: netfilter@lists.netfilter.org

kaiwen wrote:
> (2)[root@g root]# ip ro show table test2
> prohibit 192.168.8.88
> prohibit 192.168.250.197
> 
> (3) [root@g root]# iptables -t mangle -L
> Chain OUTPUT (policy ACCEPT)
> target     prot opt source               destination
> MARK       all  --  anywhere             anywhere           MARK set 0x5

But you changed both the IP address for the prohibit *and* the
chain the mark is in.  So you still won't get packets that match
both.  Just change one or the other.

That is, if you want to drop an incoming ping packet, then the
prohibit must specify a local IP, and the mark rule must be in
the PREROUTING chain.  If you want to drop an outgoing ping packet,
then the prohibit must specify a remote IP, and the mark rule must
be in the OUTPUT chain.  You could also just always put the mark
rule in both PREROUTING and OUTPUT.

Here's another option: change the mark rule so that it specifies
the source or destination, and also change the prohibit to be
'prohibit any'.

> Take a look at ip rule, the first rule route all packet to table local,
> which has a route for 192.168.8.0/24. Is it true that once there is one rule
> which match for the packet, it will route according to it. If so, I remove
> the route from table local and put it at table test2, which is
> Configurations B.

Yes, it will use the first route that matches.  Note that moving the
route to table test2 will break routing for packets that don't use
table test2.  You probably want to move it to table main.

-- 
Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com


