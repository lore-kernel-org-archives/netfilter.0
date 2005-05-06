From: Greg Cope <gregcope@gmail.com>
Subject: Re: How to Get a DMZ hosts's trafic routed via a particular IP
	address on a firewall - NOW solved
Date: Fri, 6 May 2005 15:57:39 +0100
Message-ID: <c0e9781f050506075726b2942e@mail.gmail.com>
References: <c0e9781f05050509315ff51a77@mail.gmail.com>
	<20050505213458.GA24884@bender.817west.com>
	<c0e9781f05050607362e5d644e@mail.gmail.com>
	<20050506144027.GA27512@bender.817west.com>
Reply-To: Greg Cope <gregcope@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20050506144027.GA27512@bender.817west.com>
Content-Disposition: inline
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
To: Jason Opperisano <opie@817west.com>, netfilter@lists.netfilter.org

> not even...bill joy?

Hum...

> remember the part where i said, "make sure the 2nd rule comes *before*
> any outbound SNAT/MASQ rule that is less specific"...i do--man, those
> were good times.
> anyways, since you match all 192.168.0.0/16 traffic with the MASQ rule,
> the SNAT rule for 192.168.254.3 will never be matched.
>=20
> translation:  put the dang SNAT rule for the mail server first.
>=20

Ah - thanks - I am SURE I tried that.....

Anyway this now works with:

$IPTABLES -t nat -A POSTROUTING -o ${INET_IFACE} -s $DMZ_MAIL_IP -p
tcp --dport 25 -j SNAT --to-source $MAIL_INET_ALIAS

Many, many, many thanks.

Greg

> -j
>=20
> --
> "Lois: I'll be just like Hillary Clinton, only you know, without the
>  penis."
>         --Family Guy
>=20
>

