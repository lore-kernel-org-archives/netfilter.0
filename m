From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ip_conntrack
Date: 17 Oct 2002 12:12:33 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034849553.13111.2.camel@elendil>
References: <A4C806B83AC1974E8A2AC21267B922D62D272E@exchange.int.ngi.be>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <A4C806B83AC1974E8A2AC21267B922D62D272E@exchange.int.ngi.be>
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
To: jrw@ngi.be
Cc: netfilter@lists.netfilter.org

Le jeu 17/10/2002 =E0 11:37, jrw@ngi.be a =E9crit :
> How could I remove a connection listed in the ip_conntrack file?
> Because, now, I must wait until the timeout...

See ipconntrack thread : you can't.

> And if it's not possible, is there a way to change the timeout?

Apply patch-o-matic tcp-window-tracking patch which provide a set of
sysctl (/proc/sys/net/ipv4/netfilter/) to tweak conntrack behaviours,
such as timeout. As far as I can remember, this feature has been
released separatly from TCP windows tracking and posted to devel mailing
list, but I can't find related post :/

Another way is to directly hack kernel sources to modify thoses timeouts
into header files.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

