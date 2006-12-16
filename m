From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Help on Iptables
Date: Sat, 16 Dec 2006 20:20:11 +0100
Message-ID: <458446EB.8030005@plouf.fr.eu.org>
References: <1166288655.4584270fe0f14@webmail.yanbulink.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <1166288655.4584270fe0f14@webmail.yanbulink.net>
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

wlagmay@yanbulink.net a =E9crit :
>=20
> I just want to know How am I going to do a blocking of multiple ports o=
n a
> single line let say port 700 to 800.
>=20
> Im trying this command but it is not working
>=20
> iptables -A OUTPUT -p tcp -m state --state NEW -m tcp --dport 700-800 -=
j DROP
> iptables -A OUTPUT -p tcp -m state --state NEW -m tcp --dport 700 --to =
800 -j
> DROP

man iptables says the port range syntax in port matches is "700:800".=20
The port range syntax "700-800" is used only in NAT targets.

