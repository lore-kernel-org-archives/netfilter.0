From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: redirecting on a local machine
Date: Fri, 19 Jan 2007 20:24:41 +0100
Message-ID: <45B11AF9.8060209@plouf.fr.eu.org>
References: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <008101c73bf9$dc9d99c0$0700a8c0@stormbook>
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

saspan a =E9crit :
>=20
> iptables -t -nat -A OUTPUT -m owner ! --owner-uid squid -p tcp --dport=20
> 80 -j REDIRECT --to-destination 3128

'--to-destination' is not a valid option for REDIRECT. The only valid=20
option is '--to-ports'.

> doesn't seem to work,

That does not provide much info. Can you elaborate ?

> cause a browser would not be expecting a reply=20
> from a transparent proxy when waiting for replies to its requests.

Huh ?

