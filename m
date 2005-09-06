From: Askar <askarali@gmail.com>
Subject: by passing transparent proxy
Date: Tue, 6 Sep 2005 16:11:53 +0500
Message-ID: <a0f69e5050906041135c802fb@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
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
To: netfilter@lists.netfilter.org

hi list

i have a very simple question, we have a transparent proxy "squid" for our=
=20
users, this machine is also the default gateway for the user. which mean al=
l=20
the traffic of the client do pass from this machine whether its port 80 or=
=20
not.
All teh port 80 traffic redirected to squid 3128 by ...

$iptables -t nat -A PREROUTING -i eth0 -p tcp -s 0/0 --dport 80 -j REDIRECT=
=20
--to-port 3128

Now I want to a client -s xx.xx.xx.xx access a site -d xx.xx.xx.xx then his=
=20
traffic by pass the squid. actaully if the client xx.xx goes through squid=
=20
while accessing that site then the far end web server gives him permission=
=20
denied.
However on web server I could only allow the static ip of the client
xx.xxbut not the squid server. its a secure web server.


any help in this regards wil be greatly appreciated

regards

askar






--=20
Unix is very simple, but it takes a genius to understand the simplicity.
(Dennis Ritchie)
