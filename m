From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: krn 2.4.30, iptables 1.3.1, last pom and condition extension
 problem
Date: Wed, 20 Apr 2005 14:04:03 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0504201403180.24434@blackhole.kfki.hu>
References: <4263FD5D.4050205@arcoscom.com> <4266407B.7060909@arcoscom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4266407B.7060909@arcoscom.com>
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
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?ISO-8859-15?Q?Samuel_D=EDaz_Garc=EDa?= <samueldg@arcoscom.com>
Cc: netfilter@lists.netfilter.org

On Wed, 20 Apr 2005, [ISO-8859-15] Samuel D=EDaz Garc=EDa wrote:

> > I had trying to use -m condition iptables extension module, but when I
> > see /proc/net I cant see ipt_condition directory and I can't make it.
> >
> > How can I make the /proc/net/ipt_condition directory?

modprobe ipt_condition

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

