From: "Andi Reinbrech" <andi@darwinistic.com>
Subject: --iif unrecognised in ROUTE target
Date: Mon, 2 Apr 2007 21:37:05 +0200 (SAST)
Message-ID: <3511.196.25.255.195.1175542625.squirrel@mail.darwinistic.com>
Reply-To: andi@darwinistic.com
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

Hi List.

I am trying to route packets from ppp0 or eth0 to lo, and it seems that
the only way to do this is to mangle the packet and rewrite it's if with =
a
"-j ROUTE --iif lo" route.

When I configure the following rule, I get an error:

iptables -t mangle -A PREROUTING -d 192.168.0.1 -p tcp --dport 9898 -j
ROUTE --iif lo

returns:

iptables v1.3.7: Unknown arg `--iif'
Try `iptables -h' or 'iptables --help' for more information.

I have configured my kernel as an advanced router, and enabled every
single netfilter option as compiled in (tried modules too).

Thank you!
Andi



