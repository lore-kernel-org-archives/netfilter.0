From: Padraig Brady <padraig.brady@corvil.com>
Subject: netfilter passive monitoring
Date: Mon, 19 May 2003 17:32:38 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <3EC90726.7010402@corvil.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hi, I've a passive monitor setup with 3
network interfaces. eth2 is the management (normal)
interface while eth0 and eth1 are my monitoring
interfaces which never transmit.


-----+-----+--------
      |     |
     eth0  eth1

so eth0 monitors the traffic one way on the link
and vice versa for eth1 (we're using a netoptics tap).

Anyway my question is I would like to pass all
traffic received on eth0 and eth1 into netfilter.
I thought by placing my rules in the PREROUTING
chain of the mangle table would work, since this
happens before any routing decision is made.
But the packets are never received by netfilter :-(

The packets are entering the box because you can
see/filter them using iptraf.

#iptables -t mangle -L PREROUTING -v
Chain PREROUTING (policy ACCEPT 189K packets, 61M bytes)
  pkts bytes target     prot opt in     out  source      destination

     0     0            icmp --  eth0   any  anywhere    anywhere

     0     0            icmp --  eth1   any  anywhere    anywhere


thanks,
P=E1draig.



