From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: h323 compilation error
Date: Thu, 20 Feb 2003 09:56:38 +0100 (CET)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0302200941190.12458-100000@blackhole.kfki.hu>
References: <1045602903.1536.13.camel@kolisko>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1045602903.1536.13.camel@kolisko>
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
To: - = k o l i s k o = - <kolisko@penguin.cz>
Cc: netfilter@lists.netfilter.org

On 18 Feb 2003, - = k o l i s k o = - wrote:

> i have a linux 2.4.21-pre4 patched by h323-conntrack-nat.patch and set
> Makefile, Configure.help, Configure.in and when i compile kernel i get
> this error message:

You did not patch your kernel properly. The h323 patch requires the newnat
patch (which is alreay included in 2.4.20). But 2.4.21 is pretty old. I
don't think it could successfully be patched with recent patch-o-matic.

Next time please read http://www.netfilter.org/contact.html before bombing
all the possible addresses with the same question.

Regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


