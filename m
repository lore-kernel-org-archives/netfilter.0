From: b22@softlinx.com
Subject: How to deny private net accessing each other by private net ip
Date: Sun, 25 May 2003 16:36:58 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <16081.10602.461664.908656@joker.softlinx.com>
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
To: netfilter@lists.netfilter.org


Hi

I have following firewall setup
eth0  internet (1.1.x.x, 1.2.x.x, 1.3.x.x)
eth1  private lan 10.1.x.x snat/dnat 1.1.x.x.x
eth2  private lan 10.2.x.x snat/dnat 1.2.x.x.x
eth3  private lan 10.3.x.x snat/dnat 1.3.x.x.x

I am trying to restrict machines on ethA from accessing machines on ethB (A = 1,2,3, B=1,2,3)
by its reserved IP (10.B.x.x) and only allow access by its public (1.B.x.x) IP.

I can do it using PREROUTING chain in nat/mangle
  iptable -t nat    -A PREROUTING -i eth2 -d 10.0.0.0/8 -j DROP # or 
  iptable -t mangle -A PREROUTING -i eth2 -d 10.0.0.0/8 -j DROP

but I read a tutorial (from www.netfilter.org) saying not to do any filtering in nat/mangle tables because not all packages traverse these tables. (http://iptables-tutorial.frozentux.net/)

I cannot do it in FORWARD chain because by the time packet reaches FORWARD chain
in may have already been already DNAT-ed (I cannot tell if it was w/o marking it in mangle/nat tables)

That is in the FORWARD chain I cannot distinguish between packets 
- from eth1 d=10.2.x.x 
- from eth1 d=1.2.x.x (in FORWARD chain this packet will have d=10.2.x.x set by DNAT target)

If I need to mark package in mangle, and later drop in in FORWARD then why not drop it right in the mangle table ?
But that would be filtering in nat/mangle tables which is suppose to be a no no.

I would appreciate any help/advice

thanks
Bog


