From: Guenter.Sprakties@team4.de
Subject: double NAT problem
Date: Sun, 22 Jan 2006 15:58:18 +0100
Message-ID: <OF6B883CA0.55969AF9-ONC12570F9.003CCACE-C12570FE.0052578D@team4.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Hello,

I've got an urgend problem with double netfilter NAT.
The router has the following interfaces:

eth0: 220.100.100.1/24   -> Internet
eth1: 172.24.24.1/24     -> Intranet (INTNET)
eth2: 192.168.100.1/24   -> DMZ

Now the iptables ruleset:

  #NAT
1 iptables -t nat -A POSTROUTING -o eth0 -s 192.168.100.4 -d ! "$INTNET"=20
-j SNAT --to 220.100.100.4
2 iptables -t nat -A PREROUTING  -i eth0 -d 220.100.100.4 -j DNAT --to=20
192.168.100.4
3 ip addr add 220.100.100.4 dev eth0

4 iptables -t nat -A POSTROUTING -o eth1 -s 192.168.100.4 -d "$INTNET" -j=20
SNAT --to 172.24.24.4
5 iptables -t nat -A PREROUTING  -i eth1 -s "$INTNET" -d 172.24.24.4 -j=20
DNAT --to 192.168.100.4
6 ip address add 172.24.24.4 dev eth1=20

The idea is to get the DMZ from inside by their 172.. IP and from outside=20
by their 220... IP while te 'real IP is an 192.. net IP. So far, so good.=20
From inside, everything is fine. Going to outside, the outgoing packets=20
are also ok. The problem are the ext-dmz direction: we see this packets by =

tcpdump with the 220... IP coming from outside, but not in iptables -=20
neither with an 192.. nor with an 220 destination address.

Is double natting not allowed? If its like this, we need another router -=20
one for inside NAT and one for outside NAT.=20

Amybody any idea?

Greetings,

G=FCnter

