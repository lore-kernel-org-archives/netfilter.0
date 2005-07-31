From: Mohamed Eldesoky <eldesoky.lists@gmail.com>
Subject: conntrack
Date: Sun, 31 Jul 2005 19:05:50 +0300
Message-ID: <1403218a050731090526593423@mail.gmail.com>
Reply-To: Mohamed Eldesoky <eldesoky.lists@gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

How does conntrack work ??
Does it care if the source/destination IPs change as well, due to load
balancers ??
I mean, if an outsider talks to x.y.z.1 and the load balancer forwards
that packet to x.y.z.2, so the outsider will get a reply from x.y.z.2
and continue the communications with it.
Does conntrack recognize that ?

--=20
Mohamed Eldesoky
www.eldesoky.net
RHCE

