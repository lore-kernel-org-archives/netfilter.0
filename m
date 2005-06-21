From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: iptables leaking blocked ip addresses.
Date: Tue, 21 Jun 2005 11:40:43 +0200 (CEST)
Message-ID: <Pine.LNX.4.58.0506211137000.3687@blackhole.kfki.hu>
References: <49bf7d7050620083448c1dee9@mail.gmail.com>
	<200506201055.25861.rob0@gmx.co.uk>
	<42B7DF8D.3060304@linuxmail.org>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <42B7DF8D.3060304@linuxmail.org>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Feizhou <feizhou@linuxmail.org>
Cc: netfilter@lists.netfilter.org

On Tue, 21 Jun 2005, Feizhou wrote:

>
> > I do see that you've disabled CONFIG_IP_NF_CONNTRACK, which is a very
> > odd choice. Connection tracking is the strength of iptables!
>
> You mean weakness.
>
> netfilter's conntrack module sucks in performance and at the same time
> is not fully stateful.

Could you please back your claims with data (performance) and examples
(not fully stateful)?

About netfilter performance *data* you can read
http://people.netfilter.org/kadlec/nftest.pdf.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary

