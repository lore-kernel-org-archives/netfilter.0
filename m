From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: connection tracking without iptables?
Date: Thu, 30 Sep 2004 16:20:46 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E37E@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Jiann-Ming Su <sujiannming@gmail.com>
Cc: netfilter@lists.netfilter.org

> Another thing I'm interested in is the total number of current
> connections.  Does /proc/net/ip_conntrack provide this info?  I've
> taken my iptables firewall offline,  and I would expect
> /proc/net/ip_conntrack to show very few connections, but it seems to
> still have quite a bit of historical connections left in it.

/proc/net/ip_conntrack lists all the connections the firewall is
involved with and all traffic that flows through the firewall. If you've
got a lot of active sessions, you may need to filter down the number of
entries you are using. Active sessions always use the ESTABLISHED state
value, so you may just have a lot of CLOSE_WAIT's around. They may be
relevent if you have TOO many closed states. When I first applied the
tcp_window patches to netfilter, I saw thousands of close_waits.

Ex:
cat /proc/net/ip_conntrack | wc -l                  =20
    598
cat /proc/net/ip_conntrack | grep ESTABLISHED | wc -l
    362
cat /proc/net/ip_conntrack | grep ESTABLISHED | grep dport=3D25 | wc -l
      7
cat /proc/net/ip_conntrack | grep ESTABLISHED | grep dport=3D80 | wc -l  =

    211

