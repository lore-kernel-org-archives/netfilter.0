From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: filtering by VLAN possible?
Date: Tue, 18 May 2004 16:37:45 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF5679352@alderaan.smgtec.com>
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
To: Cybr0t McWhulf <cybre@killcybre.org>, netfilter@lists.netfilter.org

Cybr0t McWhulf wrote:
> I'm trying to figure out how one might do this (without interrupting
> current physical topology or subnetting)..=20
>=20
> I've tried several things so far, but it seems short of assigning
> entire subnets to the VLAN interfaces created by vconfig, which would
> kidnof defeat the purpose of what I'm trying to accomplish, it isn't
> possible.  =20
>=20
> Has anyone tried this before with any success?

Seems to be a ebtables feature:

