From: Jan Engelhardt <jengelh@linux01.gwdg.de>
Subject: Re: Whats faster? multiple rules vs. multiport match
Date: Sat, 17 Feb 2007 16:33:08 +0100 (MET)
Message-ID: <Pine.LNX.4.61.0702171632220.32079@yvahk01.tjqt.qr>
References: <20070215213729.GA27689@outback.rfc2324.org>
	<Pine.LNX.4.61.0702171428540.32079@yvahk01.tjqt.qr>
	<45D71019.2010405@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45D71019.2010405@plouf.fr.eu.org>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

Hi,


> Jan Engelhardt a =C3=A9crit :
>>=20
>> To match N ports with N/20 rules using a multiport spec  [...]
>
> Note that the multiport match does not support more than 15 ports (and a =
port
> range counts as two ports). ;-)

Oh right. Then substitute 20 by 15 and 19 by 14.


Jan
--=20
ft: http://freshmeat.net/p/chaostables/

