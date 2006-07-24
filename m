From: "Martijn Lievaart" <m@rtij.nl>
Subject: Re: Help with IPtables and NAT
Date: Mon, 24 Jul 2006 17:16:15 +0200 (CEST)
Message-ID: <10101.1946484961$1153914510@news.gmane.org>
References: <44C16109.20704@jemconsult.biz> <44C17846.4080403@plouf.fr.eu.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <44C17846.4080403@plouf.fr.eu.org>
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
To: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Cc: netfilter@lists.netfilter.org

<citaat van=3D"Pascal Hambourg">
> Hello,
>
> James Marcinek a =C3=A9crit :
>
> You forgot the whole 127.0.0.0/8 subnet which can be used on the
> loopback interface. Anyway, why don't you just allow all traffic on the
> loopback interface ?

Even worse, loopback is used for communicating with any local address, no=
t
just the one assigned to the lo interface. Don't restrict loopback unless
you know exactly what you're doing.

M4


