From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Newbie: why is this packet being dropped/logged?
Date: 04 Aug 2003 10:04:56 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059984295.921.22.camel@elendil.intranet.cartel-securite.net>
References: <3F2DEB07.1060801@mega-bucks.co.jp>
	 <1059980959.926.1.camel@elendil.intranet.cartel-securite.net>
	 <3F2E0B71.9010408@mega-bucks.co.jp>
	 <1059982839.921.10.camel@elendil.intranet.cartel-securite.net>
	 <3F2E1026.2040000@mega-bucks.co.jp>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2E1026.2040000@mega-bucks.co.jp>
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
To: Jean-Christian Imbeault <jc@mega-bucks.co.jp>
Cc: netfilter@lists.netfilter.org

Le lun 04/08/2003 =E0 09:49, Jean-Christian Imbeault a =E9crit :
> Had a look and no errors were logged in that file.

This file is not a log. This is your conntrack table. When it is full,
packets that should have been spoted as NEW are INVALID because there's
no place left to handle them. Afaik, INVALID for TCP means the packets
is really fucked or an error occured during state matching.

Could you post an iptables-save output for your INPUT chain so we can
have a complete ruleset description ?

> Also, is my rule overkill in the sense that specifying all three of NEW=
,
> ESTABLISHED and RELATED states is not necessary. I could get away with
> just NEW and RELATED?

It is a bit redundant with previous rule that allows ESTABLISHED and
RELATED packets, whatever source, destination and protocol they may
have. So, ESTABLISHED HTTP packets to 203.179.86.66 would not reach your
rule, being accepted by previous one. Moreover, RELATED is useless, as
HTTP does not have related connections such as FTP or IRC.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

