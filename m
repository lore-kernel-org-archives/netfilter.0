From: "GUILHEM Michel (34)" <michel.guilhem@cp.finances.gouv.fr>
Subject: how to interconnect two private network
Date: Tue, 3 Dec 2002 09:13:02 +0000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200212030913.02744.michel.guilhem@cp.finances.gouv.fr>
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


I'm trying to interconnect two private network with possibles addresses i=
n the=20
same netmask with the help on a proxy machine with two interfaces=20

example=20

in the first network i have a client with IP address in 10.34.248.134 ( c=
lass=20
C ) and i try to reach a server on the other private network with an IP=20
address 10.10.254.12 .
My problem is=20
With iptables and nat , it is possible to replace the address of clients =
with=20
the address of the proxy .
But my purpose is to replace the client address in the proxy partially=20
So i want to have a partial replacement on the input=20
So the addresse 10.34.248.134 is changed in 154.34.248.134 by the nat .
Therefore i want to change only the first byte of the client address .

In my machine proxy i have squid to requests on http, https , ftp under h=
ttp
and i have delegate to requests on another protocols or like "proxy socks=
"=20
So to manage the routes , i just need that the clients address be changed=
=20
beetwen the entry on the machine and the proxy service .
Like this the route on the proxy machine are simplified because the reque=
sts=20
destinated to server are routed on the interface ( route by default ) .
And all the request that are done by clients are routed on the other inte=
rface=20
on the nat with a rule for address 154.x.x.x and changed by the nat in=20
address 10.x.x.x .

I want trying to do this the following rule

iptables -t nat -A POSTROUTING -s 10.0.0.0/255.0.0.0 -o eth0 -j SNAT --to=
=20
source 154.0.0.0/255.0.0.0=20

But i am not sure , is my probleme solvable by a combination of iptables =
, nat=20
and route ?

Thanks for any clue=20

Guilhem michel

--=20
Guilhem michel Administrateur proxy

