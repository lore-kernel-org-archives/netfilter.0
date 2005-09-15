From: Edmundo Carmona <eantoranz@gmail.com>
Subject: Re: Limit access to one subnet?
Date: Thu, 15 Sep 2005 12:58:53 -0400
Message-ID: <65aa6af905091509582d1adbb0@mail.gmail.com>
References: <200509151546.j8FFk1di004133@nenya.memphis.edu>
Reply-To: eantoranz@gmail.com
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200509151546.j8FFk1di004133@nenya.memphis.edu>
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
To: netfilter@lists.netfilter.org

on the server:

iptables -A INPUT -s 141.225/16 -p tcp -dport 8080 -j ACCEPT
iptables -P INPUT DROP

Use with care.

On 9/15/05, Jason Luka <jluka@geshp.com> wrote:
> I'm trying to figure out how to allow only 141.225.x.x to access port 808=
0
> on a server.  It's a proxy server and obviously I don't want anyone outsi=
de
> of campus to be able to access it.
>=20
>=20
>

