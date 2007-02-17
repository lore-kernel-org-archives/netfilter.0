From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Whats faster? multiple rules vs. multiport match
Date: Sat, 17 Feb 2007 15:24:25 +0100
Message-ID: <45D71019.2010405@plouf.fr.eu.org>
References: <20070215213729.GA27689@outback.rfc2324.org>
	<Pine.LNX.4.61.0702171428540.32079@yvahk01.tjqt.qr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.61.0702171428540.32079@yvahk01.tjqt.qr>
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
To: netfilter@lists.netfilter.org

Hello,

Jan Engelhardt a =E9crit :
>=20
> To match N ports with N/20 rules using a multiport spec  [...]

Note that the multiport match does not support more than 15 ports (and a=20
port range counts as two ports). ;-)

