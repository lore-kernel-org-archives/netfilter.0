From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ! means on iptables
Date: 17 May 2003 17:50:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1053186626.795.52.camel@elendil.intranet.cartel-securite.net>
References: <200305172229320387.009A0DC3@mail.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305172229320387.009A0DC3@mail.gmx.net>
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
To: wijayaj@gmx.net
Cc: netfilter@lists.netfilter.org

Le sam 17/05/2003 =E0 17:29, Julius Wijaya a =E9crit :
> iptables -A FORWARD -i eth1 -p tcp \
> 	   -s ! 172.16.30.185 \
> 	   -d www.yahoo.com -j DROP
> if i am not mistaken that rules means to drop all connection to
> www.yahoo.com except from address 172.16.30.185

That's it.
The exact meaning is to drop all connections to www.yahoo.com that _are
not_ sourced from 172.16.30.185. There's a tiny tiny little difference
;)))

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

