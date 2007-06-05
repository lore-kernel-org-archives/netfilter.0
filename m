From: Werner Maier <maier@fidion.de>
Subject: Problem with FTP and NAT
Date: Tue, 05 Jun 2007 10:43:52 +0200
Message-ID: <E80175D89344E0193465FF03@[192.168.42.19]>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org


Hi there,

I've seen this problem has been announced on this list at least once,
but I did not find the answer in the archive.

I'd have checked the bugzilla, but the bugzilla throws errors like

DBD::mysql::st execute failed: Unknown column 'grant_type' in 'where clause' [for Statement "SELECT groups.name,...

when trying to log in.

anyway: I'm searching for hints:

Setup:
Server behind Firewall, Server has private IP.
Firewall running Kernel 2.6.19 (gentoo-r6), iptables-1.3.5

Server does FTP traffic to external FTP Server (download).

after some time I can trace (firewall, external interface) things like
this:

Server IP external (after NAT) : a.b.c.d,
Server IP internal (before NAT): 192.168.1.161
External Server: w.x.y.z

4.107198 a.b.c.d -> w.x.y.z FTP Request: PORT a,b,c,d,179,87
4.330290 a.b.c.d -> w.x.y.z FTP [TCP Retransmission] Request: PORT 192,168,1,161,179,87

so, if the answer of the external host takes too long,
the internal hosts issues an TCP Retransmission and (I guess)
the conntrack_ftp does not SNAT the PORT command a second time,
as it should.

After switching from outgoing active to outgoing passive FTP,
it is working again, but this is only a workaround for outgoing
traffic, as long as the remote server does not run the same
configuration (linux/nat/netfilter/iptables).

I can observe the same problem with incoming FTP traffic as well.
everytime the Server issues an PORT command (this time it is
incoming passive ftp), the same thing happens: everytime the
remote host does not answer a PORT request fast enough,
there will be a TCP retransmission. And in that retransmission
the PORT request there is no second NAT and the private IP
is shown in the port

Of course there would be other workarounds for this:

A)
- using stateless rules for port 21 and a portrange for the
  data connectinos
- configuring the ftp server to "masquerade as" external ip
- configuring the ftp server to use only the portrange
  mentioned above.

B)
- dont use nat at all, use external IPs in the DMZ. just let
  the firewall do routing and not masquerading.

But these are only workarounds.

Any hints or pointers?

best regards

Werner Maier
--
Werner Maier, Dipl.-Ing. Univ.         Friedrich-Bergius-Ring 15
fidion GmbH                            97076 W=FCrzburg


