From: "Marek Zachara" <marek.zachara@telperion.pl>
Subject: Strange behaviour of NAT under iptables
Date: Thu, 17 Jul 2003 11:04:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <005501c34c42$78fb6640$019ea8c0@eriador>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

I have a trustix 2.0 distribution installed with 2.4.21 kernel and 1.2.8 =
iptables.
thich machine is used as a gateway to the internet for a small lan of 25 =
computers.
All computers in local network have private 192.168.x.x addresses.
eth1 at the router is connected to DSL/internet, eth0 to local lan.

I have a couple (4) of static public IPs which I want to assign to =
certain of these
25 computers, the rest of them communicate with internet via masquerade.

Everything worked fine when I used kernel 2.2 and ipchains with fast =
nat.
Now I have upgraded to the 2.4/iptables. I have set up rules in firewall =
script=20
to SNAT and DNAT packets coming to/from machines that should have public =
IPs.
Now the funny part begins (here is the scenario):

I boot up the router with iptables script which set up NAT for one of =
the machines in the local
 network (let's call it X - it has address in local network like =
192.168.15.1).
The NAT works. I can login to (X) from outside computer using the public =
IP,
when I log from this machine (X) to other computers, the connection is =
shown
as made from the right public ip that is assigned to (X).

Everything seems fine, but works only for about 5 minutes. Then the =
connection
to the (X) is unavailable - can't ping it, log in to it, no traceroute - =
in either (in/out) directions.
everything is blocked at the router.

Most strange thing is that if I set up an alias for eth1:1 with the =
public IP
assigned for (X) the traffic half-works (which is expectable) - I can =
login from (X) to any
other computer outside local network (and connection is registered as =
from (X) public IP),
but I can't login to (X) from outside - which is also fine since the =
alias 'catches' all the
incoming traffic.=20
Now if I delete the alias the NAT works fine both directions .... for =
another couple
of minutes. Then all access to/from (X) is unavailable.
If I set up the alias again I can repeat this scenario again and again. =
When I put up a script
which sets/deletes the alias every 2 mins, the connection lasts, but of =
course there are
short periods every 2 min. (between the alias set up and deletion which =
takes about 2 seconds)
when all traffic incoming to this IP is directed to the alias - which is =
not good.

I have tried several things, but nothing works :(  Any ideas? At least =
how to debug it?
Any help really appreciated.

Marek

