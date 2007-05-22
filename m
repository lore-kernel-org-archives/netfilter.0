From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: ip_conntrack table full after upgrade from RHEL3 (2.4/1.2.8)
 to RHEL4U4 (2.6.9/1.2.11)
Date: Tue, 22 May 2007 11:59:28 +0200
Message-ID: <4652BF00.2080501@plouf.fr.eu.org>
References: <465239AA.9020007@funkware.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <465239AA.9020007@funkware.com>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Alex Tang a =E9crit :
>=20
> I've been having a problem on a machine that does a high volume of=20
> sendmail traffic.  The machine gets approx 50,000 connections per hour=20
> to port 25.
> The machine was upgraded from a RHEL3 based system (kernel rpm=20
> 2.4.21-47.EL and iptables rpm 1.2.8-12.3) to a RHEL4 based system=20
> (kernel rpm 2.6.9-55.EL and iptables rpm 1.2.11-3.1.RHEL4).

You should really consider upgrading to something more recent, because=20
kernel 2.6.9 and iptables 1.2.11 are *badly* outdated.

> Since the upgrade has occurred, the conntrack table fills up relatively=
=20
> fast (within one day).  The max size is 65536 (as per=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_max).
>=20
> I've been searching through the archives, faq, etc and have found the=20
> usual standard answer is to increase the ip_conntrack_max.  However, I'=
m=20
> concerned for a couple of reasons that this may not be the proper answe=
r.
>=20
> In particular, i have another machine which is still running the RHEL3=20
> (kernel 2.4.21-47.EL/iptables 1.2.8-12.3), that gets more connections=20
> per hour (80,000 vs. 50,000), and there are only about 9000 entries in=20
> the ip_conntrack table on that machine.
>=20
> The problem with the conntrack table filling up fast started as soon as=
=20
> we did the upgrade.
>=20
> Also, on the machine that is currently experiencing problems, most (98%=
)=20
> of the connections are in the ESTABLISHED state, however the majority o=
f=20
> these connections are not seen when doing a "netstat".
>=20
> I admit that I do not fully understand the details of the iptables=20
> implementation, but it seems that the connection close is not being=20
> "seen" by the conntrack code and connections that have already gone awa=
y=20
> are still in the ip_conntrack table, and we have to wait for these=20
> connections to "timeout" before they are expired from the conntrack tab=
le.

And the default timeout for established TCP connections is 5 days, so it=20
takes a looong time.

A noticeable difference between kernel 2.6.9 and earlier versions is the=20
TCP window tracking, which was added in 2.6.9. It adds TCP sequence=20
number checking to the connection tracking, so any TCP packet with an=20
out-of-window sequence number is tagged INVALID. If the TCP window=20
tracking considers that the FIN packet sequence numbers are=20
out-of-window for whatever reason, this may be the reason why the 2.6.9=20
kernel connection tracking keeps old connexions. You may add LOG=20
iptables rules to track TCP FIN packets states.

> I could of course, increase the max size of the table, or decrease the=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established, but=20
> it seems that would only mask the problem, not actually fix it.

I agree. You could also decrease the value of=20
/proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established to=20
something much shorter than 5 days but again this would only mask the=20
problem.

Try to set /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to=20
1. This setting makes TCP window tracking more liberal, so only=20
out-of-window TCP RST packets are tagged INVALID.

Note that later kernel versions provided some bugfixes for the TCP=20
window tracking that may fix this issue.

