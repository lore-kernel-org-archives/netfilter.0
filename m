From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: RFE: ability to show the current state tables?
Date: 04 Nov 2002 11:15:53 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036404953.8845.29.camel@elendil>
References: <Pine.LNX.4.44.0211031228460.27222-100000@netcore.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.44.0211031228460.27222-100000@netcore.fi>
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
To: Pekka Savola <pekkas@netcore.fi>
Cc: netfilter@lists.netfilter.org

Le dim 03/11/2002 =E0 11:37, Pekka Savola a =E9crit :
> I've been looking for a way to check the current netfilter '-m state'=20
> tables.  This should be invaluable in debugging.  I couldn't find any w=
ay=20
> to do it.  I think this could be important.

See /proc/net/ip_conntrack file which contains all informations about
current states.

You can also have a look at iptstate :

	http://home.earthlink.net/~jaymzh666/iptstate/

It is a top like curses based tool which allows you to observe state
table.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

