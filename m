From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: question
Date: Wed, 21 Jun 2006 14:23:14 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C40127AB@knowledge.wizdom.nu>
References: <12ec50350606210514j630bc4b4vd1064cd3d1f978b9@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: "Fabio S. Silva" <fabiofoz@gmail.com>, netfilter@lists.netfilter.org

Usually you would test your firewall with the applications you need to =
use through it. That would be the only realistic test application wise.
=20
For testing sustained tcp connections you can use a tool tike TTCP, =
which can open the connection and test throughput of your firewall.
http://www.pcausa.com/Utilities/pcattcp.htm
=20
Foor DDOS simulations, you would need multiple pc's on your network and =
a simulation tool:
http://www.ssfnet.org/javadoc/SSF/App/DDoS/package-summary.html
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Fabio S. Silva
Sent: Wed 21-Jun-06 14:14
To: netfilter@lists.netfilter.org
Subject: question



Hi all, i trying to find tools to test my firewall, i need to make
some test like "Sustained TCP Connections" but i dont know tools to do
it.. and... i need some tools to simulate an ddos to my firewall to
see if its droping packets, etc..
anybody can help me ??

best regards..

Fabio S. Silva




