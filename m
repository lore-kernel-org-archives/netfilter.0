From: "Netfilter" <none@none.com>
Subject: What's the best way to block these IP's?
Date: Sat, 18 Jun 2005 11:29:59 -0500
Message-ID: <001d01c57422$f8bf64d0$45d4a8c0@martin>
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

What's the best way to block these IP's?


:FORWARD ACCEPT [0:0]
:INPUT ACCEPT [0:0]
:OUTPUT ACCEPT [0:0]
-A INPUT -p tcp -s 61.0.0.0/32 -i eth1 -j  DROP
-A INPUT -p tcp -s 66.0.0.0/32 -i eth1 -j  DROP
-A INPUT -p tcp -s 80.0.0.0/32 -i eth1 -j  DROP
-A INPUT -p tcp -s 82.0.0.0/32 -i eth1 -j  DROP
-A INPUT -p tcp -s 211.0.0.0/32 -i eth1 -j DROP
-A INPUT -p tcp -s 213.0.0.0/32 -i eth1 -j DROP

or

-A INPUT -p tcp -s 218.0.0.0 -i eth1 -j DROP
-A INPUT -p tcp -s 219.0.0.0 -i eth1 -j DROP
-A INPUT -p tcp -s 219.0.0.0 -i eth1 -j DROP

thanks
