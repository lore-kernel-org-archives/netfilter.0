From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: Is this firewall good enough?
Date: Wed, 9 Jun 2004 11:28:33 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406091112130.5934-100000@blackhole.kfki.hu>
References: <40C61E15.4050702@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40C61E15.4050702@linuxmail.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Feizhou <feizhou@linuxmail.org>
Cc: David Cannings <lists@edeca.net>, netfilter@lists.netfilter.org

On Wed, 9 Jun 2004, Feizhou wrote:

> > Is there any good reason not to load connection tracking?
>
> SLOW. It isn't good enough to use on a high traffic server.

Could you back your claims up with data?

At testing connection tracking we could pump trough two million concurrent
connection at 200000pps rate with opening up 20000 new connection per
second on a dual Xeon PC with Serverworks chipset and Intel copper GE
cards. Best results were achieved by Linux kernel 2.6.x with conntrack
locking and TCP window tracking patches applied and NAPI enabled.
I'd say that's not bad at all.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


