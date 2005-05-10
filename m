From: Andy Furniss <andy.furniss@dsl.pipex.com>
Subject: Re: Help: iptables NAT broken with pppoe
Date: Tue, 10 May 2005 14:19:33 +0100
Message-ID: <4280B4E5.1070209@dsl.pipex.com>
References: <42808D9C.2000603@dsl.pipex.com>
	<1115397393l.3864l.0l@antares.localdomain>	<427C5C41.3010407@riverviewtech.net>	<1115496014l.3549l.0l@antares.localdomain>	<427EFB7D.8010503@riverviewtech.net>	<1115663859l.3308l.0l@antares.localdomain>	<427FAF51.9000102@riverviewtech.net>
	<4448571.1115722979939.JavaMail.ngmail@webmail-06.arcor-online.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4448571.1115722979939.JavaMail.ngmail@webmail-06.arcor-online.net>
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
To: =?ISO-8859-1?Q?Albrecht_Dre=DF?= <albrecht.dress@arcor.de>
Cc: netfilter@lists.netfilter.org, gtaylor@riverviewtech.net

Albrecht Dre=DF wrote:
>>One thought - the tcpdump is incomplete by just looking at port 80 you=20
>>can't see what ICMP are being sent.
>=20
>=20
> Well, the idea was to reduce the amount of data reported by tcpdump. My=
 naive assumption was that running the two tcpdump's on eth0 and ppp0, I =
would see the request packet coming from eth0, the masqueraded one on ppp=
0, and the same process in the opposite direction for the reply.
>=20
> Why do you think it would be important to see the icmp's, too?

Just thought it would be better to be able to see all what was going on=20
- I have no specific ideas, though.

Andy.

