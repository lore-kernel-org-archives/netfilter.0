From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: re: -m state --state
Date: 17 Jun 2003 08:52:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1055832745.674.4.camel@elendil.intranet.cartel-securite.net>
References: <20030616233414.GC7125@tweedle.finchhaven.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030616233414.GC7125@tweedle.finchhaven.net>
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
To: John Sage <jsage@finchhaven.com>
Cc: netfilter@lists.netfilter.org

Le mar 17/06/2003 =E0 01:34, John Sage a =E9crit :
> From man 8 iptables, and the Linux 2.4 Packet Filtering HOWTO:
> "--state [state]
> Where state is a comma separated list of the connection states
> to match..."
> "Specifying `-m state' allows an additional `--state' option, which is
> a comma-separated list of states to match (the `!'  flag indicates not
> to match those states).  These states are..."
> Is this comma-separated list creating a series of AND's or OR's?

OR

> Thus -m state --state INVALID,NEW is
> INVALID AND NEW
> or
> INVALID OR NEW?

INVALID OR NEW

A packet has only one state at time. So, AND does not make sens at all.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux - Cartel S=E9curit=
=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

