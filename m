From: Guillaume <silencer@free-4ever.net>
Subject: Re: Trouble shooting for port forwarding ,	Want to make sure port
 is forwarded
Date: Tue, 01 Aug 2006 11:49:01 +0200
Message-ID: <44CF238D.2080702@free-4ever.net>
References: <20060801094234.35522.qmail@web55506.mail.re4.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20060801094234.35522.qmail@web55506.mail.re4.yahoo.com>
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
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: Netfilter IPtableMailinglist <netfilter@lists.netfilter.org>

John Joseph wrote:
> Hi=20
>     For the purpose of trouble shooting  , one  setup
> which I had done  for redirecting port 110 to port
> 8110 ( same machine)  . For this purpose   I gave the
> command as=20
>=20
> iptables -t nat -A PREROUTING  -p tcp --dport 110 -j
> REDIRECT --to-port  8110
>=20
>    Now after this . When I do a tcpdump for port 8110
> , I do not get any results , when I  access port 110=20
>                =20
>         Since the tcpdump results for  port 8110  is
> not  seen , what can we conclude from , Is port
> forwarding happening here ?
>                       Thanks=20
>                             Joseph John=20
>=20
>=20
> 	=09
> ___________________________________________________________=20
> Try the all-new Yahoo! Mail. "The New Version is radically easier to us=
e" =96 The Wall Street Journal=20
> http://uk.docs.yahoo.com/nowyoucan.html
>=20

Hi,

After enabling a dnat traffic, you need to allow it in the "filter"=20
table with a rule that look like this:
iptables -t filter -A INPUT -p tcp --dport 8110 -j ACCEPT

Regards
Guillaume


--=20
Guillaume
E-mail: silencer_<at>_free-4ever_<dot>_net
Blog: http://guillaume.free-4ever.net
----
Site: http://www.free-4ever.net

