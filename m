From: =?koi8-r?Q?=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF_?= =?koi8-r?Q?=EB=CF=D3=D4=C9=CB?= <casper@meteor.dp.ua>
Subject: iptables rules disappearing!!!
Date: Tue, 23 Jan 2007 10:46:24 +0200
Message-ID: <1169541984.4380.16.camel@localhost.localdomain>
Reply-To: casper@meteor.dp.ua
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <lartc-bounces@mailman.ds9a.nl>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=unsubscribe>
List-Archive: <http://mailman.ds9a.nl/pipermail/lartc>
List-Post: <mailto:lartc@mailman.ds9a.nl>
List-Help: <mailto:lartc-request@mailman.ds9a.nl?subject=help>
List-Subscribe: <http://mailman.ds9a.nl/cgi-bin/mailman/listinfo/lartc>,
	<mailto:lartc-request@mailman.ds9a.nl?subject=subscribe>
Sender: lartc-bounces@mailman.ds9a.nl
Errors-To: lartc-bounces@mailman.ds9a.nl
Content-Type: text/plain; charset="koi8-r"
To: netfilter@lists.netfilter.org
Cc: lartc@mailman.ds9a.nl

Hi all.

I have got to see a strange thing. Some of my iptables' rules are
disaprearing after several days!!!

I have many rules like:

# iptables -t mangle -A $MYCHAIN -s $SRC_IP -d $DST_IP -j MARK
--set-mark $MARK

for classifying traffic for shaping, total about 100 rules with
different 20 marks, and rules like

# iptables -A FORWARD -m mark --mark $MARK

for accounting shaping classes, total 20 rules (for all marks). The are
also many other filtering and nat rules.

Some of the mark rules in FORWARD chain are disapearing after several
days. How can this happen? Can this happen without user intrusion?

Considering that all those rules are inserted during boot by
iptables-restore. I double checked that during ppp up/down rules
inserted/removed only in "-t mangle", "-t nat" and "-A USERCHAIN".

System: Debian Sarge, 2.6.8-3-k7, iptables v1.2.11

--=20
=F0=CF=CB=CF=D4=C9=CC=C5=CE=CB=CF =EB=CF=D3=D4=C9=CB <casper@meteor.dp.ua=
>
