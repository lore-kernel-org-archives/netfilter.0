From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Linux firewall and high availability
Date: Tue, 13 Jan 2004 16:39:10 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF56790D7@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: Drag0n <dragon@atlantacon.org>, netfilter@lists.netfilter.org

Yes, I have been playing with heartbeat and ipfail for a few weeks, and
even though it isn't in production, it seems to do the job

Drag0n wrote:
> I have a situation that i need to have firewall fail over capability.
> 2 separate systems with identical rules with 3 interfaces, (internet,
> DMZ, and LAN) =20
>=20
> Has anyone set up this situation and have any recommendations on how
> it should be approached? I have looked into the linux HA system
> (http://www.linux-ha.org/). is it possible to load ballance between
> the two and shift on failure of the primary?  =20
>=20
> Any info or direction would be appreciated.
>=20
> Drag0n
> dragon@atlantacon.org

