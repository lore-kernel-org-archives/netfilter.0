From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ipconntract
Date: 16 Oct 2002 20:51:07 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034794267.13389.1.camel@elendil>
References: <20021016182728.12947.qmail@web14003.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021016182728.12947.qmail@web14003.mail.yahoo.com>
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
To: alex leeken <leeken_alex@yahoo.com>
Cc: netfilter@lists.samba.org

Le mer 16/10/2002 =E0 20:27, alex leeken a =E9crit :
> How can i delete all state enteries
> from state table?

You just can't, unless you reboot.

nfnetlink/ctnetlink patch from patch-o-matic aims to make userspace
interactions with state table possible, but I have no idea about its
current status.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

