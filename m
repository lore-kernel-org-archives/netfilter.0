From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: from iptable user
Date: 20 Feb 2003 13:22:50 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045743770.15853.89.camel@elendil.intranet.cartel-securite.net>
References: <200302171909.23866.admin@getsense.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200302171909.23866.admin@getsense.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: nikita <admin@getsense.net>
Cc: netfilter@lists.netfilter.org

Le lun 17/02/2003 =E0 17:09, nikita a =E9crit :
> iptable -A FORWARD -m mac -mac-source 00:C0:DF:10:4D:99 -j REJECT
>=20
> and=20
>=20
> i have been answered the following
>=20
>=20
> Couldn't load match ac-source:
> /lib/iptables/libipt_ac-source.so ....
>=20
> Please,
> What shell i do in that case?

"man" would be a great idea...

iptable -A FORWARD -m mac --mac-source 00:C0:DF:10:4D:99 -j REJECT
			  ^^
			  Much better...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


