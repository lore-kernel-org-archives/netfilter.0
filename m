From: odanes@free.fr
Subject: REDIRECT to more than one port does not work
Date: Wed,  2 Mar 2005 18:35:29 +0100
Message-ID: <1109784929.4225f9611dd4a@imp2-q.free.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

Hi,

I would like to forward tcp connection to port 8000 to ports 8080 and 808=
1 on
the same machine in order to load balance HTTP request to two processes. =
So
I'va add the following rule

iptables -t nat -A  PREROUTING -p tcp --dport 8000 -m state --state NEW -=
j
REDIRECT --to-ports 8080-8081

I think that the first connection will be forwarded to 8080 and the senco=
nd to
8081 and so on. But when I connect to the port 8000 the connection is alw=
ays
redirected to the same port 8080.

Is my thought wrong ?

regads, olivier.

here is some information on my linux box
# uname -a
Linux mowgli.lannion.citypassenger.com 2.4.20-8 #1 Thu Mar 13 17:18:24 ES=
T 2003
i686 athlon i386 GNU/Linux
# iptables --version
iptables v1.2.7a

