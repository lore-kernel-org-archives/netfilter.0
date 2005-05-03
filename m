From: Eric Leblond <eric@inl.fr>
Subject: Re: SNATTING FTP
Date: Tue, 03 May 2005 14:13:55 +0200
Message-ID: <1115122435.10690.20.camel@localhost.localdomain>
References: <110c7844050503050579575350@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <110c7844050503050579575350@mail.gmail.com>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Metal Gear <finattack@gmail.com>
Cc: netfilter@lists.netfilter.org

Hi,

You have to accept RELATED packet in your FORWARD rule :

	iptables -I FORWARD -m state --state RELATED -j ACCEPT

should help.

Le mardi 03 mai 2005 =E0 18:05 +0600, Metal Gear a =E9crit :
> Hi,=20
> i wanted to do SNAT on FTP connections which are destined from my local=20
> network to outside network. I tried the SNAT for ssh and it was working w=
ith=20
> the following rule
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 <http://192.168.1.0/24> =
-p=20
> tcp -m tcp --dport 22 -m state --state NEW -j SNAT --to
> 192.168.1.5<http://192.168.1.5>
>=20
> I tried the following rules for FTP but it is no working
>=20
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 <http://192.168.1.0/24> =
-p=20
> tcp -m tcp --dport ftp -m state --state NEW,ESTABLISHED,RELATED -j SNAT -=
-to=20
> 192.168.1.5 <http://192.168.1.5>
>=20
> iptables -t nat -A POSTROUTING -s 192.168.1.0/24 <http://192.168.1.0/24> =
-p=20
> tcp -m tcp --sport ftp-data -m state --state NEW,ESTABLISHED,RELATED -j S=
NAT=20
> --to 192.168.1.5 <http://192.168.1.5>
>=20
> Can someone assist me in this situation.
> Thanks


