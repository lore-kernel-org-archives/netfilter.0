From: "kaiwen" <cal_kaiwen@hotmail.com>
Subject: Re: Match packet mark with --set-mark to ip rule fwmark
Date: Wed, 7 Jan 2004 15:25:52 +0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Law11-OE66fa281NPs60001e8d8@hotmail.com>
References: <Law11-OE68Dt3HvoFOA00000021@hotmail.com> <3FFB927B.4010208@snapgear.com> <LAW11-OE14FjwUbowDp0001e8e9@hotmail.com> <3FFBA469.9080205@snapgear.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Philip Craig <philipc@snapgear.com>
Cc: netfilter@lists.netfilter.org

Hi,

I tried the following configurations:-

(1) [root@g webauth]# ip route show table test2
prohibit 192.168.250.197
192.168.8.0/24 via 192.168.8.88 dev br0

(2) [root@g webauth]# iptables -t mangle -L
Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
MARK       all  --  anywhere             anywhere           MARK set 0x5

(3) [root@g webauth]# ip ru
0:      from all lookup local
32765:  from all fwmark        5 lookup test2
32766:  from all lookup main
32767:  from all lookup 253

Ping from 192.168.8.129 will go to iptables and got marked 5, it goes to
local table, but no route match for it, so it goes to table test2.
The destination of the packet is 192.168.250.197, so it is prohibited, I
suppose the ping will not be successful.
Have I got the explanation right?

I have got a question, packet travles through routing table first or
iptables?

But, it is successful.



----- Original Message -----
From: "Philip Craig" <philipc@snapgear.com>
To: "kaiwen" <cal_kaiwen@hotmail.com>
Cc: <netfilter@lists.netfilter.org>
Sent: Wednesday, January 07, 2004 2:17 PM
Subject: Re: Match packet mark with --set-mark to ip rule fwmark


> kaiwen wrote:
> > (2)[root@g root]# ip ro show table test2
> > prohibit 192.168.8.88
> > prohibit 192.168.250.197
> >
> > (3) [root@g root]# iptables -t mangle -L
> > Chain OUTPUT (policy ACCEPT)
> > target     prot opt source               destination
> > MARK       all  --  anywhere             anywhere           MARK set 0x5
>
> But you changed both the IP address for the prohibit *and* the
> chain the mark is in.  So you still won't get packets that match
> both.  Just change one or the other.
>
> That is, if you want to drop an incoming ping packet, then the
> prohibit must specify a local IP, and the mark rule must be in
> the PREROUTING chain.  If you want to drop an outgoing ping packet,
> then the prohibit must specify a remote IP, and the mark rule must
> be in the OUTPUT chain.  You could also just always put the mark
> rule in both PREROUTING and OUTPUT.
>
> Here's another option: change the mark rule so that it specifies
> the source or destination, and also change the prohibit to be
> 'prohibit any'.
>
> > Take a look at ip rule, the first rule route all packet to table local,
> > which has a route for 192.168.8.0/24. Is it true that once there is one
rule
> > which match for the packet, it will route according to it. If so, I
remove
> > the route from table local and put it at table test2, which is
> > Configurations B.
>
> Yes, it will use the first route that matches.  Note that moving the
> route to table test2 will break routing for packets that don't use
> table test2.  You probably want to move it to table main.
>
> --
> Philip Craig - SnapGear, A CyberGuard Company - http://www.SnapGear.com
>
>

