From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: why DROP in PREROUTING
Date: Fri, 27 Oct 2006 11:59:58 +0200
Message-ID: <4541D89E.1080507@freemail.hu>
References: <4541D552.2070802@eccotours.co.za>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4541D552.2070802@eccotours.co.za>
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
To: Brent Clark <bclark@eccotours.co.za>
Cc: netfilter@lists.netfilter.org


Brent Clark =EDrta:
> Hi all
>
> Would please help me understand as to why you would do some dropping=20
> in the PREROUTING as opposed to the filter of INPUT or FORWARD (e.g.)
>
It is not really nice, BUT...

the reason is:

You can filter all of these packets at one point no matter where they=20
coming from and going to....

> Ive been browsing a few sites and I see sites like iptablesrocks.org=20
> etc all have rules like so
>
> A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN,RST,PSH,ACK,URG=20
> FIN,PSH,URG -j DROP
=2E..
> -A PREROUTING -p tcp -m tcp --tcp-flags FIN,SYN FIN,SYN -j DROP
>
> Just something I was thinking.
>
> Kind Regards
> Brent Clark
>
>
Swifty


