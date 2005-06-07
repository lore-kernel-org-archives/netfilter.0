From: "Gustavo Castro Puig" <gcastro@gcp.com.uy>
Subject: Route traffic per protocol - it is possible?
Date: Tue, 7 Jun 2005 13:55:27 -0300 (UYT)
Message-ID: <40473.200.125.13.172.1118163327.squirrel@webmail.prolinux.net.uy>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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

Hi, list!

  I've got an issue to resolve and I want to know if it's possible to do
it with netfilter/iproute2. I've been googling for some time, but I
couldn't find the way to do this (may be I'm not searching the correct
way), so any help from you will be *VERY* appreciated.
  I have a firewall with two links, on direct to Internet and another (to
internet too) through another firewall. All traffic is now going to
Internet through the other firewall, but I want to know if it's possible
to send some traffic (not all) through the direct link to Internet. I
don't want to redirect all traffic coming from some IPs, intead, I want
to redirect only SSH traffic (for example) from the box through the
direct link and all other traffic to the other firewall. Something like
a "per-protocol routing policy". I've been trying with iproute2 and
iptables, marking packets and routing them with two routing tables, but
it didn't work.
  The firewall have two nic, one (eth0) with an address 192.168.0.15 and
the other (eth1) with the public address.
  This is what I've done:

------------------------------------------------------------------------
ip route flush table NEW
ip route add 192.168.0.0/24 dev eth0 table NEW
ip route add default via XXX.XXX.XXX.XXX table NEW dev eth1

iptables -t nat -A POSTROUTING -o eth1 -j MASQUERADE

ip rule add fwmark 1 table NEW

ip rule add from XXX.XXX.XXX.XXX table NEW

iptables -t mangle -A OUTPUT -p tcp --dport 22 -j MARK --set-mark 1
------------------------------------------------------------------------
  None of this lines generate errors.
  May be this is not possible, but if it is, how could be done?
  Thanks in advance!

Cheers,
     G.Castro P.



