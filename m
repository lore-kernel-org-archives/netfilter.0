From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 15:23:16 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054041795.678.118.camel@elendil.intranet.cartel-securite.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
	 <1054024461.694.31.camel@elendil.intranet.cartel-securite.net>
	 <1054028975.18150.65.camel@stilmant>
	 <1054032554.681.103.camel@elendil.intranet.cartel-securite.net>
	 <1054036083.18151.86.camel@stilmant>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054036083.18151.86.camel@stilmant>
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
To: ml-netfilter@adtech.be
Cc: netfilter@lists.netfilter.org

Le mar 27/05/2003 =E0 13:48, Michael Stilmant a =E9crit :
> wow this sound not pretty bad .. thanks I'll test this in some times
> (need to finish one work before, so I'll tell you if this work) but if
> other have others solutions (in case)

OK.
Other solution would be transparent routing, operating DNAT at bridge
level on interesting packets, but as you seem to need some TCP layer
informations, ebtables won't provide you valuable help on this.

> no except your other one :-) (which tell me to read features page, :-D =
)

;)

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

