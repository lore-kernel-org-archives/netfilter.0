From: YN <yutaka_web@hotmail.com>
Subject: ULOG with dport problem?
Date: Mon, 06 Oct 2003 22:00:05 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031006211617.739B.YUTAKA_WEB@hotmail.com>
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

Hi all.

I try to log usin ULOG and ulogd.

When I sent tcp packet using netperf, ulogd (ulogd.syslogemu) get packet
log only about 9 packet.
iptable command line is here.
# iptables -A INPUT -p tcp --dport 5001 -i eth3 -j ULOG --ulog-nlgroup 1
--ulog-cprange 40 --ulog-qthreshold 50

But when I set iptable without dport, ulogd can get all packet.
# iptables -A INPUT -p tcp -i eth3 -j ULOG --ulog-nlgroup 1
--ulog-cprange 40 --ulog-qthreshold 50

=46rom the result when not specifying dport, ULOG seemed to work fine.

Does someone know why ulogd cannot get all packet when specifying dport
and how to config iptable.

Thanks in advance.

Yutaka
yutaka_web@hotmail.com



