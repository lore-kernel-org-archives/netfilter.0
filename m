From: Tharindu Rukshan Bamunuarachchi <bsd.tharindu@gmail.com>
Subject: No chain target match by that name
Date: Thu, 5 Jan 2006 10:39:57 +0600
Message-ID: <d23987670601042039r6bab4299i3fae872424e77dd1@mail.gmail.com>
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

netfilter@lists.netfilter.org

hi all,
 when i tried to add following rule,

 $IPTABLES -t nat -N Proxy

 $IPTABLES -t nat -A Proxy -m iprange --dst-range
100.298.10.9-100.298.10.40 -j RETURN

 i got following error,

 iptables: No chain/target/match by that name

 Please comment,

 iptable version is 1.2.11
 kernel version is 2.4.29-lug

 Regards
 --
Tharindu Rukshan Bamunuarachchi
all fabrications are subject to decay

