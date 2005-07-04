From: "matt" <matt@darcy.demon.co.uk>
Subject: RE: [Announce] Nulog 1.1.0 is available
Date: Mon, 4 Jul 2005 18:07:27 +0100
Message-ID: <38562.8269905739$1120496897@news.gmane.org>
References: <1120426995.8058.14.camel@localhost.localdomain>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1120426995.8058.14.camel@localhost.localdomain>
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


The Nulog 1.1.0 release has a bug.

The mysql dumpfile does not contain the conntrack_ulog table.

This has been reported to the nulog email account.



-----Original Message-----
From: netfilter-bounces@lists.netfilter.org
[mailto:netfilter-bounces@lists.netfilter.org] On Behalf Of Eric Leblond
Sent: 03 July 2005 22:43
To: R. DuFresne
Cc: netfilter@lists.netfilter.org
Subject: Re: [Announce] Nulog 1.1.0 is available

Le vendredi 01 juillet 2005 =E0 15:34 -0400, R. DuFresne a =E9crit :
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA1
>=20
>=20
> considering the history of php, and many php applications and their=20
> bi-weekly appearance in the various sec lists for newly discovered =
vulns,=20
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


--=20
No virus found in this incoming message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.8.8/37 - Release Date: 01/07/2005
=20

--=20
No virus found in this outgoing message.
Checked by AVG Anti-Virus.
Version: 7.0.323 / Virus Database: 267.8.8/37 - Release Date: 01/07/2005
=20


