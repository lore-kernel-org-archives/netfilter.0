From: Steve Mickeler <steve@warning.ca>
Subject: internal > external > internal NAT
Date: Mon, 10 Mar 2003 13:02:46 -0500 (EST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.53.0303101302320.5044@gypsy>
Mime-Version: 1.0
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


I have a requirement where I need to NAT some internal connections to
make sure everything to the destination appears to be coming from the same
source.

The network layout is like this:

client [ internal net eth3 ] 192.168.32.100
  \/
  \/ client has a statuic host rouute for 172.17.4.200 via 192.168.32.200
  \/
iptables box [internal net eth1] 192.168.32.200
  \/
  \/
iptables box [external net eth2] 172.17.4.200
  \/
  \/
linux lvs box [interal net] 192.168.32.18
  \/
  \/
web servers on the 192.168.32.0 net

What I need to do is this:

If the destination IP = 172.17.4.200 then redirect it to 192.168.32.18 but
first NAT the source IP to 192.168.32.200

Anyone know a simple way to do this ?



