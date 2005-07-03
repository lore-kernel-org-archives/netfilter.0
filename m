From: Eric Leblond <eric@inl.fr>
Subject: Re: [Announce] Nulog 1.1.0 is available
Date: Sun, 03 Jul 2005 23:43:15 +0200
Message-ID: <1120426995.8058.14.camel@localhost.localdomain>
References: <1120136387.4696.54.camel@localhost.localdomain>
	<Pine.LNX.4.60.0507011532460.16419@darkstar.sysinfo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.60.0507011532460.16419@darkstar.sysinfo.com>
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
To: "R. DuFresne" <dufresne@sysinfo.com>
Cc: netfilter@lists.netfilter.org

Le vendredi 01 juillet 2005 =E0 15:34 -0400, R. DuFresne a =E9crit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> considering the history of php, and many php applications and their=20
> bi-weekly appearance in the various sec lists for newly discovered vulns,=
=20
> how afe is this application and would one want to place it on or near=20
> their main security device?

This application exists since some years now and we have proceed to some
code audits and have carefully checked user entries to avoid SQL
injection or other problems.

The other point is that this application has not to be available for
evryone has it contains private information. Thus, it can be protected
from "bad people" by authentication or other mean. To be simple, access
has to be restricted to admins.

An other point is that permissions on the MySQL database should and can
be carefully set to have only read-only permission on the table
containing the ulogd/NuFW logs. This restricted permissions can assure
that the logged datas can not be corrupted. Futhermore, in the case of
an Ulogd installation, the logged packets can be duplicated in syslog,
thus any hypothetic datas corruption is armless.

Finally, as ulogd can log on a database running on a separate host, your
firewall is safe as there is no server running on it.=20

BR,
--=20
Eric Leblond <eric@inl.fr>


