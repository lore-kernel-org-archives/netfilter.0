From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: transparent tcp proxy
Date: 27 May 2003 10:34:21 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054024461.694.31.camel@elendil.intranet.cartel-securite.net>
References: <09B04A55822EFF4DA48D2E0BB2941D4A019241@wardrive.citadelcomputer.com.au>
	 <1053938722.17259.6.camel@stilmant>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1053938722.17259.6.camel@stilmant>
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

Le lun 26/05/2003 =E0 10:45, Michael Stilmant a =E9crit :
> Rappel:
> when C send not filtered packet to A, A see the C MAC address with IP
> 10.0.0.32. when B send filtered TCP/IP packet to A with IP address=20
> 10.0.0.32 A see the B MAC address. This work but it's not acceptable.
> the A MAC-IP association table will change setup all the time.=20

What about a layer 2 SNAT on OUTPUT chain from B to A for filtered
packets ?
ebtables can achieve this.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

