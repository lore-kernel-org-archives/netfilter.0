From: "Pablo Sanchez" <pablo@blueoakdb.com>
Subject: RE: voip question
Date: Fri, 24 Mar 2006 22:01:29 -0500
Message-ID: <NEBBLLCNFOFHMALJMDDEEEICCBAB.pablo@blueoakdb.com>
References: <fcfe0b070603241557n768205dkd919adc6a09e9b5b@mail.gmail.com>
Reply-To: pablo@blueoakdb.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <fcfe0b070603241557n768205dkd919adc6a09e9b5b@mail.gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org



> -----Original Message-----
> From: netfilter-bounces@lists.netfilter.org
> [mailto:netfilter-bounces@lists.netfilter.org]On Behalf Of Matthew =
Pepar
> Sent: Friday, March 24, 2006 6:58 PM
> To: netfilter@lists.netfilter.org
> Subject: voip question
>=20
>=20
> I was wondering if I could improve my VOIP calls using netfilter.

I use L7-filter coupled with tc and iptables to give VOIP packets a =
higher priority over other packets:

	http://l7-filter.sourceforge.net/

I hope that helps.
-pablo

ps:  If you want to see my prioritized traffic real-time, you can go =
here:

	http://www.hillsandlakes.com/stats/graphs/shaping_one_hour.html

pps:  I cap http uploads at 256kbps.


