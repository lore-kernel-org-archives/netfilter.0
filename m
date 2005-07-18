From: Eric Leblond <eric@inl.fr>
Subject: RE: [Announce] Nulog 1.1.0 is available
Date: Mon, 18 Jul 2005 17:23:42 +0200
Message-ID: <1121700222.27293.20.camel@localhost.localdomain>
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
Content-Type: text/plain; charset="iso-8859-1"
To: matt <matt@darcy.demon.co.uk>
Cc: netfilter@lists.netfilter.org

Le lundi 04 juillet 2005 =E0 18:07 +0100, matt a =E9crit :
> The Nulog 1.1.0 release has a bug.
>=20
> The mysql dumpfile does not contain the conntrack_ulog table.
>=20
> This has been reported to the nulog email account.

Hi,

This is related to default value of variables that are badly set (Or at
least badly documented).

Set=20
	$conntrack_enabled=3D"no";
	$actif_and_passif=3D0;
in include/config.inc

PS : sorry for the delay, I did not see this e-mail till today.

BR,
--=20
Eric Leblond <eric@inl.fr>


