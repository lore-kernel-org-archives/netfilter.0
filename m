From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: how to drop out of state packets
Date: 07 Jul 2003 19:08:24 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1057597703.2133.12.camel@elendil.intranet.cartel-securite.net>
References: <Law14-OE12MFaukyCKD00060f8d@hotmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Law14-OE12MFaukyCKD00060f8d@hotmail.com>
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
To: Lombardo Federico <egopfe@hotmail.com>
Cc: netfilter@lists.samba.org

Le lun 07/07/2003 =E0 17:38, Lombardo Federico a =E9crit :
> INVALID state also matches ACK out of state packets ?

Unless you've patched your kernel with tcp-no-pickup patch, no.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

