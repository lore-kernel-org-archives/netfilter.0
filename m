From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DROP Fin Scan
Date: 12 Dec 2002 17:31:20 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1039710680.11849.68.camel@elendil.intranet.cartel-securite.net>
References: <20021124093933.24186.71076.Mailman@kashyyyk>
	 <1039703255.3df89cd74ff10@zigzag.cantine.org>  <3DF8AA68.3040900@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3DF8AA68.3040900@libero.it>
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
To: Blizzards <blizzards@libero.it>
Cc: Dade <mailing@cantine.org>, netfilter@lists.netfilter.org

Le jeu 12/12/2002 =E0 16:25, Blizzards a =E9crit :
> (only pachet with the SYN bit set and ACK,RST,FIN cleared can initiate =
a new=20
> connection)

A SYN-FIN can initiate a connection according to RFC. That's why --syn
is equal to SYN,ACK,RST SYN and not to SYN,ACK,RST,FIN SYN.

> iptables -A INPUT -p tcp --tcp-flags FIN,SYN FIN,SYN -j DROP

One can do this. It is clear that thoses packets should not exist. But
FIN bit is ignored, so...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

