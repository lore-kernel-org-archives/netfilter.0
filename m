From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: SV: iptables 1.2.10 and linux kernel 2.6.7 problems.
Date: Thu, 24 Jun 2004 14:23:52 +0200 (CEST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.33.0406241421130.8190-100000@blackhole.kfki.hu>
References: <6BFFA187E8806C4E9740A353F715DDBDE5718E@newmailer.terraplay.com>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <6BFFA187E8806C4E9740A353F715DDBDE5718E@newmailer.terraplay.com>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: TEXT/PLAIN; charset="iso-8859-1"
To: =?iso-8859-1?Q?P=E4r_H=E4ggblad?= <par.haggblad@terraplay.com>
Cc: netfilter@lists.netfilter.org

On Thu, 24 Jun 2004, [iso-8859-1] P=E4r H=E4ggblad wrote:

> > > Now I'm using the new 2.6.7 kernel and iptables 1.2.10. > > You
> did compile iptables 1.2.10 using the 2.6.7 source code, didn't you?
> Yes of cource. There was however a compiling error which made me to
> look in this mailing list and pointed me to a patch that I used to get
> it to compile. This patch:
> http://lists.netfilter.org/pipermail/netfilter/2004-June/053639.html

I can't download the patch to check it (host could not be found) but I
suspect that cause the problem. Please use the
08_linux-2.6.7-user_attr.patch from patch-o-matic-ng instead.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
          H-1525 Budapest 114, POB. 49, Hungary


