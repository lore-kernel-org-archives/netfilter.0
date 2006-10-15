From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Can't get access to local servers using external IP
Date: Sun, 15 Oct 2006 20:21:16 +0200
Message-ID: <45327C1C.1090507@plouf.fr.eu.org>
References: <BAY102-F34366D66CEBC07CEBB779FBC0A0@phx.gbl>	<453111A5.8000603@rtij.nl>	<45322F80.3090502@plouf.fr.eu.org>
	<45327853.4070101@rtij.nl>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <45327853.4070101@rtij.nl>
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

Martijn Lievaart a =E9crit :
>
>> 8) Set up a "split DNS" server so the internal requests receive the=20
>> private address and the external request receive the public address.
>=20
> I do that too, it may actually be the best advice from this list.

Nooo, we're on a Netfilter/iptables list !

> A bitch to set up[1], but once it's working it works like a charm.

Well, it depends a lot on what you've got.

If you have your own Bind9 authoritative DNS server for the name, you=20
must set up "views". May be heavy.

If you have a DNS relay running dnsmasq, you just need to put the name=20
in the /etc/hosts file of the box running dnsmasq. Easy.

