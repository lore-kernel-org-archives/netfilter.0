From: =?ISO-8859-15?Q?J=F6rg_Sch=FCtter?= <netfilter@schuetter.org>
Subject: Re: Here's a nice tool
Date: Fri, 31 Oct 2003 21:07:42 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20031031210742.62eaac35.netfilter@schuetter.org>
References: <1067608372.1428.12.camel@main.tqmcube.com>
Mime-Version: 1.0
Content-Type: multipart/mixed;
 boundary="Multipart=_Fri__31_Oct_2003_21_07_42_+0100_4xu2sqUS3/aEa1SA"
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1067608372.1428.12.camel@main.tqmcube.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: netfilter@lists.netfilter.org

This is a multi-part message in MIME format.

--Multipart=_Fri__31_Oct_2003_21_07_42_+0100_4xu2sqUS3/aEa1SA
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: quoted-printable

Hallo David,

On Fri, 31 Oct 2003 08:52:52 -0500
"David C. Hart" <DCH@TQMcube.com> wrote:

> This creates an ad server s*list in IPTables.
>=20
I wrote a script around this URL to set my rules to the actual content
of this list of addserver. In my FORWARD chain the line
iptables -A FORWARD -p tcp -m multiport --dports 80,8080,443 -j adservers
does the rerouting of the packets to the adservers chain.


J=F6rg

--=20
J=F6rg Sch=FCtter           http://www.lug-untermain.de/
joerg@schuetter.org     http://www.schuetter.org/joerg/
ICQ: 298982789          http://mypenguin.bei.t-online.de/


--Multipart=_Fri__31_Oct_2003_21_07_42_+0100_4xu2sqUS3/aEa1SA
Content-Type: text/plain;
 name="reject_adservers"
Content-Disposition: attachment;
 filename="reject_adservers"
Content-Transfer-Encoding: quoted-printable

#! /bin/sh
#
# reject_adservers
#		This script adds reject rules to the chain adservers
#		for every "known" addserver
# Autho:	Joerg Schuetter <joerg@schuetter.org>

PATH=3D/usr/local/sbin:/usr/local/bin:/sbin:/bin:/usr/sbin:/usr/bin
DAEMON=3D/sbin/iptables
NAME=3Dreject_adservers
DESC=3D"iptables chain to reject adservers"

test -x $DAEMON || exit 0

set -e

case "$1" in
  start)
	echo -n "Starting $DESC: $NAME"
	for i in `lynx --source 'http://pgl.yoyo.org/adservers/iplist.php?ipformat=
=3Dplain&showintro=3D1&mimetype=3Dplaintext' | grep -E "^[[:digit:]]+\.[[:d=
igit:]]+\.[[:digit:]]+\.[[:digit:]]+$"`; do iptables -A adservers -d $i -j =
REJECT; echo -n "."; done
	echo "."
	;;
  stop)
	echo -n "Stopping $DESC: $NAME "
	iptables -F adservers
	echo "."
	;;
  status)
  	echo "Status of $NAME"
	iptables -L adservers -n -v | awk '{print $1 " " $2 " " $9;}' | \
	grep "^[0-9]" | grep -v "^0 " | sort -n
	echo "."
	;;
  *)
	N=3D/etc/init.d/$NAME
	echo "Usage: $N {start|stop|status}" >&2
	exit 1
	;;
esac

exit 0

--Multipart=_Fri__31_Oct_2003_21_07_42_+0100_4xu2sqUS3/aEa1SA--

