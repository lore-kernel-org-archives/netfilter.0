From: SaVaGE  <pc-secure@home.nl>
Subject: Re: Local IP not being local
Date: Tue, 29 Apr 2003 08:33:40 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200304290833.40340.pc-secure@home.nl>
References: <20030429012755.66519.qmail@web11501.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030429012755.66519.qmail@web11501.mail.yahoo.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Op dinsdag 29 april 2003 03:27, schreef Miguel Manso:
> Hi there,
>
> I've a linux machine acting as a router. I'm VERY happy with it and I'm
> learning a lot (iptables rocks).
>
> Now, I've something strange that I don't know how to solve.
>
> I've a static public IP, let's imagine - 100.100.100.1
>
> All the requests to that IP are redirected to the internal ip - 192.168=
=2E1.6
>
> Now, inside 192.168.1.6 if I ping 100.100.100.1 I get:
>
> 64 bytes from 100.100.100.1: icmp_seq=3D16 ttl=3D61 time=3D23.7 ms
>
> But, if I ping 'localhost' I get:
>
> 64 bytes from localhost.localdomain (127.0.0.1): icmp_seq=3D1 ttl=3D64
> time=3D0.044 ms
>
>
> This means that the ping that I'm doing to 100.100.100.1 is going to th=
e
> router, going to the outside, coming back to the router and to the inte=
rnal
> machine again.
>
> Can I "say" something to the linux router to just redirect all the requ=
ests
> to the 100.100.100.1 ip to the internal machine 192.168.1.6?
>
> Thanks a lot for the help.
>
> =3D=3D=3D=3D=3D
> Miguel Manso
> mmanso@yahoo.com
>
> __________________________________
> Do you Yahoo!?
> The New Yahoo! Search - Faster. Easier. Bingo.
> http://search.yahoo.com

My guess is, you have to alter your /etc/hosts file , cause when internal=
 ip=20
not is recognized ,then a query to the outside wil be made.

/etc/hosts

127.0.0.1=09=09localhost.localdomain=09=09localhost
192.168.1.6       yourname domain =09=09yourname=20
100.100.100.1   yourname2domain=09=09yourname2


Pascal (PC-Secure)


