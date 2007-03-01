From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Blocking direct private IP address
Date: Thu, 01 Mar 2007 22:02:52 +0100
Message-ID: <45E73F7C.1000605@plouf.fr.eu.org>
References: <BAY119-F1661D1CA6F86B692550992D6800@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY119-F1661D1CA6F86B692550992D6800@phx.gbl>
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

Andrew Kraslavsky a =E9crit :
>=20
> 2) The reason I care about not allowing the private address to work=20
> directly is that, well, it is a private address and should not be=20
> meaningful on the public network and why give clues to any hackers out=20
> there?

s/hackers/bad guys/

What kind of clue do you give by allowing direct access with the private=20
address ? First, people can use it only if they already know it. Second,=20
what can they do with the private address that they could not already do=20
with the public address ?

> Perhaps the confusion surrounding this interest was again clouded by my=
=20
> attempt to keep my example simple -- I used 10.0.0.1, a reserved privat=
e=20
> address, as my public IP address in my explanation while in reality the=
=20
> public IP address is one that is valid on the Internet.

You could use instead the 192.0.2.0/24 range which is reserved for=20
documentation and examples.

