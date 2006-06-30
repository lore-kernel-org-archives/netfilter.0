From: "Michael Novelo" <development@novellogic.de>
Subject: Help for some Rules
Date: Fri, 30 Jun 2006 08:24:56 +0200
Message-ID: <000b01c69c0d$e832a960$7a00a8c0@nove1>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Our Firewall-Administrator is on Vacation for the next 4 Weeks. Now i =
have
the Problem that he installed a new Firewall (Endian) but he has =
forgoten to
set certain Rules:

The Main-Office want to get Access to out network without setting on all
Machines a route:

=20
Our internal Network is 192.168.171.xxx=20
Firewall Adress: 192.168.171.99=20
ISDN-Router(Gateway to the Main-Office): 192.168.171.80

Main-Office Network: 192.168.1.xxx

=20
now the Main Office want to access our network via an ISDN Router they
dialin in a bintec bingo router which has 192.168.171.80 as ip adress. I
have set a route for their network(route add -net 192.168.1.0 netmask
255.255.255.0 gw 192.168.171.80) everything works fine for me in our
network. i can send a ping to the servers on their network. traceroute =
works
also fine on all of our machines. But the Main-Office want to get access =
to
our Machines the only two ways which are working are =20
1.) i set on every machine a route via route add=20
2.) i change the default Gateway to 192.168.1.80

Can sombody help me to set some rules to route all traffic who comes =
from
the MainOffice Network the right way?

Greetings=20

Novelo


