From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Passive FTP through IPTables DNAT
Date: 07 Mar 2003 09:17:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047025075.2819.0.camel@elendil.intranet.cartel-securite.net>
References: <4D613EBFB75BD6118A5B00508BEEC62C0111CB53@JESS>
	 <001001c403b3$79629670$0b00a8c0@runner>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c403b3$79629670$0b00a8c0@runner>
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
To: Rune <runner@mail.tele.dk>
Cc: Jonathan Humphrey <jhumphrey@codemasters.com>, netfilter@lists.netfilter.org

Le sam 06/03/2004 =E0 20:44, Rune a =E9crit :
> All  you need is having a forward rule for the ftp-data connection whic=
h
> uses the
> port below the ftp port e.g:
>     ftp at port 21
>     ftp-data at port 20

Nope. This is true for _active_ FTP, but passive ftp-data connection
uses non privilieged ports on both ends.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

