From: Lopsch <lopsch@lopsch.com>
Subject: Re: Shareaza and IPtables
Date: Sun, 14 Nov 2004 19:06:21 +0100
Message-ID: <41979E9D.6060909@lopsch.com>
References: <20041114041647.120.qmail@web40727.mail.yahoo.com>
	<20041114173223.GA1071@bender.817west.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20041114173223.GA1071@bender.817west.com>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Netfilter-Mailinglist <netfilter@lists.netfilter.org>

As an addition:

I think you=B4re mixing old ipchains and the "new" netfilter. Perhaps thi=
s=20
pictures help you understanding.

ipchains:=20
http://joerg.fruehbrodt.bei.t-online.de/pics/abb1_ipchains_ablaufdiagramm=
.jpg

netfilter:=20
http://joerg.fruehbrodt.bei.t-online.de/pics/abb3_netfilter_ablaufdiagram=
m.jpg

As you can see the Output chain only is reached from pakets generated on=20
the router. All forwarded pakets only see die Forward chain.


