From: <support@supsrv.com>
Subject: dnat problem
Date: Tue, 21 May 2002 16:53:51 -0400
Sender: netfilter-admin@lists.samba.org
Message-ID: <003e01c20109$9d514e40$6f01a8c0@ollie>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.samba.org

hello all,
this is my first time posting to this board.  i am having trouble
with my iptables rules.  my configuration consists of a linux
router as the main network gateway and firewall providing NAT and
ipsec.  i have compiled kernel 2.4.17 with freeS/WAN version
1.91.   i have a source nat rule set up so my non-routable
addresses can use the gateway to reach the internet.  i did not use
the MASQUERADE target.

here is my Source nat rule

iptables -t nat -A POSTROUTING -s 192.168.1.0/24 -o eth1 -j SNAT --to
w.x.y.z

I also have some destination nat rules set up.
iptables -t nat -A PREROUTING -d w.x.y.a -p tcp -m tcp --dport 80 -j
DNAT --to-destination 192.168.1.48

There are about 5 additional dnat rules that are basically the same
so I won't list them.

the problem i am having is that the internal private subnet
(192.168.1.0/24) on my network is unable to bring up sites that
have been setup using dnat rules.  external users have no problem
viewing the sites i have set up dnat rules for.

any help would be greatly appreciated.

thanks

---
Ollie Gallardo


