From: "Ian! D. Allen" <idallen@idallen.ca>
Subject: set-mark, OUTPUT routing, martian addresses, rp_filter
Date: Wed, 9 Feb 2005 05:11:59 -0500
Message-ID: <20050209101155.GA3101@elm.home.idallen.ca>
Mime-Version: 1.0
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Back in November 2000 Rusty noted that you have to disable route filtering
to make OUTPUT routing work:

  http://lists.netfilter.org/pipermail/netfilter/2000-November/006089.html

For example, to route packets for a certain group id out the second
interface (eth1), I do approximately this:

   # iptables -t mangle -A OUTPUT -o eth0 -m owner --gid-owner 500 \
           -j MARK --set-mark 500
   # ip rule add fwmark 500 table 2
   # ip route add default via $EXTGW dev eth1 src $EXTIP table 2
   # echo 0 >/proc/sys/net/ipv4/conf/eth1/rp_filter

This works.

The reason one has to turn of route filtering is to avoid this blockage:

    kernel: martian source XXX from YYY, on dev eth1

where XXX is the IP address of the eth0 interface and YYY is the Internet
destination IP of the re-routed packet.

This blockage occurs because the ip fwmark rule that re-routes the packet
from going out eth0 to going out eth1 doesn't fix the source address -
the packet still looks like it should be coming from eth0 even though it
is being sent out eth1, and the kernel doesn't like that.  (Only packets
with sources on the eth1 network should be leaving on eth1?)

Turning off route filtering seems like the wrong thing to do here; it's
covering up the symptom instead of fixing the problem.  Ideally, there
should be a way to set the source address so that the marked and re-routed
packets have the source address of their new output interface - eth1.

Adding a NAT rule does fix the outgoing address, e.g.

    # iptables -t nat -A POSTROUTING -m mark --mark 500 \
        -j SNAT --to-source $EXTIP

where EXTIP is the IP address of the eth1 interface; but, it doesn't
stop the kernel from complaining about the martian addresses.  (I guess
that the martian check is done before the NAT is applied?)

Is there a better fix for the martian address problem than simply
disabling the check for martian addresses?  Is there a way for the
marked packets to have their source address set so that the kernel
doesn't see them as martian on the eth1 interface?

-- 
-IAN!  Ian! D. Allen   Ottawa, Ontario, Canada
       EMail: idallen@idallen.ca   WWW: http://www.idallen.com/
       College professor (Linux) via: http://teaching.idallen.com/
       Support free and open public digital rights:  http://eff.org/

