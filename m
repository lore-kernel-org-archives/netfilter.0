From: =?ISO-8859-1?Q?G=E1sp=E1r_Lajos?= <swifty@freemail.hu>
Subject: Re: Iptables and rate limiting per ip address
Date: Fri, 13 Oct 2006 10:01:52 +0200
Message-ID: <452F47F0.2040108@freemail.hu>
References: <452F3949.2050502@optusnet.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <452F3949.2050502@optusnet.com.au>
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
To: "Brendan S (Scratch User)" <gobnat@optusnet.com.au>
Cc: netfilter@lists.netfilter.org

Brendan S (Scratch User) =EDrta:
> Hi =20
>
> I am an iptables beginner. I want to set up my firewall to rate limit i=
ncoming packets based on a particular source IP address (but not any othe=
r IP).
>
> I understand that there are dstlimit and hashlimit options for iptables=
.  It is not clear to me whether these apply the same limit (x packets/se=
c) to each ip address (ie all IP addresses limited at x packets/sec) or w=
hether their action can be applied to a single address (I suspect the for=
mer).
>
> If it is the latter, can the hashlimit switch be limited by (eg) -s?   =
Alternatively can I jump past the rule for other ip addresses?
>
>  =20
You can use -s switch
> Would either of these work?
> ...
> -A src_limit -s !<limit_ip> -j ACCEPT
> -A src_limit -m hashlimit --hashlimit 2/min --hashlimit-burst 10 --hash=
limit-mode srcip,dstport --hashlimit-name per_src --hashlimit-htable-gcin=
terval 60000 --hashlimit-htable-expire 300000 -j ACCEPT
>
>  =20
1. Accept EVERYTHING from EVERYONE except <limit_ip>
2. Accept EVERYTHING ELSE (from <limit_ip>) if hashlimit module permits

> ...
> or
>
> -A src_limit -s <limit_ip> -m hashlimit --hashlimit 2/min --hashlimit-b=
urst 10 --hashlimit-mode srcip,dstport --hashlimit-name per_src --hashlim=
it-htable-gcinterval 60000 --hashlimit-htable-expire 300000 -j ACCEPT
>
>  =20
1. Accept from <limit_ip> if haslimit module permits
> Thanks
>
>
> Brendan
>
>  =20
Do not forget the DROP policy in the chain...

Swifty

