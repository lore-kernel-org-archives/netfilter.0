From: =?iso-8859-1?Q?Paul_Blond=E9?= <jpb@entel.ca>
Subject: RE: ip_conntrack table full after upgrade from RHEL3 (2.4/1.2.8) to
	RHEL4U4 (2.6.9/1.2.11)
Date: Tue, 22 May 2007 09:10:13 -0700
Message-ID: <000b01c79c8b$adc478b0$5a05a8c0@nisgaa.net>
References: <4652BF00.2080501@plouf.fr.eu.org>
Reply-To: jpb@entel.ca
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4652BF00.2080501@plouf.fr.eu.org>
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
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.netfilter.org

Note that since RHEL is the enterprise Linux version from RedHat, you =
should
probably keep your updates fairly close to theirs. The focus of =
enterprise
releases of Linux is stability and security, so you would be better off
updating to RHEL5 than RHEL4 at this time. This will also ensure that =
you
get at least a reasonably recent version of netfilter/iptables, although =
it
wouldn't hurt to update that further if it is not the latest.

There is also a good list of PREROUTING filters for a number of purposes =
at
the iptablesrocks.org site, I have used their "general web server =
firewall"
configuration virtually unchanged with much success.



~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
Paul Blond=E9


> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org=20
> [mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of=20
> Pascal Hambourg
> Sent: Tuesday, May 22, 2007 2:59 AM
> To: netfilter@lists.netfilter.org
> Subject: Re: ip_conntrack table full after upgrade from RHEL3=20
> (2.4/1.2.8) to RHEL4U4 (2.6.9/1.2.11)
>=20
>=20
> Hello,
>=20
> Alex Tang a =E9crit :
> >=20
> > I've been having a problem on a machine that does a high volume of=20
> > sendmail traffic.  The machine gets approx 50,000=20
> connections per hour=20
> > to port 25.
> > The machine was upgraded from a RHEL3 based system (kernel rpm=20
> > 2.4.21-47.EL and iptables rpm 1.2.8-12.3) to a RHEL4 based system=20
> > (kernel rpm 2.6.9-55.EL and iptables rpm 1.2.11-3.1.RHEL4).
>=20
> You should really consider upgrading to something more=20
> recent, because=20
> kernel 2.6.9 and iptables 1.2.11 are *badly* outdated.
>=20
> > Since the upgrade has occurred, the conntrack table fills=20
> up relatively=20
> > fast (within one day).  The max size is 65536 (as per=20
> > /proc/sys/net/ipv4/netfilter/ip_conntrack_max).
> >=20
> > I've been searching through the archives, faq, etc and have=20
> found the=20
> > usual standard answer is to increase the ip_conntrack_max. =20
> However, I'm=20
> > concerned for a couple of reasons that this may not be the=20
> proper answer.
> >=20
> > In particular, i have another machine which is still=20
> running the RHEL3=20
> > (kernel 2.4.21-47.EL/iptables 1.2.8-12.3), that gets more=20
> connections=20
> > per hour (80,000 vs. 50,000), and there are only about 9000=20
> entries in=20
> > the ip_conntrack table on that machine.
> >=20
> > The problem with the conntrack table filling up fast=20
> started as soon as=20
> > we did the upgrade.
> >=20
> > Also, on the machine that is currently experiencing=20
> problems, most (98%)=20
> > of the connections are in the ESTABLISHED state, however=20
> the majority of=20
> > these connections are not seen when doing a "netstat".
> >=20
> > I admit that I do not fully understand the details of the iptables=20
> > implementation, but it seems that the connection close is not being=20
> > "seen" by the conntrack code and connections that have=20
> already gone away=20
> > are still in the ip_conntrack table, and we have to wait for these=20
> > connections to "timeout" before they are expired from the=20
> conntrack table.
>=20
> And the default timeout for established TCP connections is 5=20
> days, so it=20
> takes a looong time.
>=20
> A noticeable difference between kernel 2.6.9 and earlier=20
> versions is the=20
> TCP window tracking, which was added in 2.6.9. It adds TCP sequence=20
> number checking to the connection tracking, so any TCP packet with an=20
> out-of-window sequence number is tagged INVALID. If the TCP window=20
> tracking considers that the FIN packet sequence numbers are=20
> out-of-window for whatever reason, this may be the reason why=20
> the 2.6.9=20
> kernel connection tracking keeps old connexions. You may add LOG=20
> iptables rules to track TCP FIN packets states.
>=20
> > I could of course, increase the max size of the table, or=20
> decrease the=20
> >=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_establis
> hed, but=20
> > it seems that would only mask the problem, not actually fix it.
>=20
> I agree. You could also decrease the value of=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_timeout_established to=20
> something much shorter than 5 days but again this would only mask the=20
> problem.
>=20
> Try to set=20
> /proc/sys/net/ipv4/netfilter/ip_conntrack_tcp_be_liberal to=20
> 1. This setting makes TCP window tracking more liberal, so only=20
> out-of-window TCP RST packets are tagged INVALID.
>=20
> Note that later kernel versions provided some bugfixes for the TCP=20
> window tracking that may fix this issue.
>=20
>=20


