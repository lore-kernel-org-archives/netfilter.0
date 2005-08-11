From: Felix <fmontes@gmail.com>
Subject: Forcing traffic out the same interface on a dual homed server
	(without using routes) ?
Date: Thu, 11 Aug 2005 17:50:11 -0400
Message-ID: <eaa1cc6d05081114501eb09f74@mail.gmail.com>
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

Hi all,

If i have 2 interfaces on a linux server, say eth0 and eth1, and=20
a) default gateway is eth0 =3D production
b) there is a complex network on eth1 =3D administration
c) i can't have routing entries for the administration network
(dont ask why, its an OSI layer 9 problem (the political layer))

Can iptables restrict traffic that came in through eth1/administration to=
=20
only go out through eth1?

I think what i'm trying to do is bypass the routing decision if somehow it=
=20
was known on which interface the connection initiated. And even if iptables=
=20
could manage to send the traffic out the same interface, would it just be=
=20
dropped on the local subnet? how would it be sent to the default gateway on=
=20
that subnet?

Your enlightening comments will be appreciated.

Regards,
-Felix
