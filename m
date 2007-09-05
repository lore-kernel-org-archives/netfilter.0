From: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Subject: Re: IPSET iptree problem
Date: Wed, 5 Sep 2007 12:39:01 +0200 (CEST)
Message-ID: <Pine.LNX.4.64.0709051233270.17878@blackhole.kfki.hu>
References: <E1IPe95-0001aO-B9@welnowiec.net>
	<Pine.LNX.4.64.0708271837440.6383@blackhole.kfki.hu>
	<20070827205249.o36eoudvhz3sqymk@m.safari.iki.fi>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <20070827205249.o36eoudvhz3sqymk@m.safari.iki.fi>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"; format="flowed"
Content-Transfer-Encoding: 7bit
To: Sami Farin <safari-netfilter@safari.iki.fi>
Cc: netfilter@lists.netfilter.org

On Mon, 27 Aug 2007, Sami Farin wrote:

> Your mask_to_bits function results into infinite loop if called
> with parameter 1, for example.
>
> If you care only about first set bit, i.e. you do not bother checking
> is netmask valid, you can use:
>
> static inline unsigned int mask_to_bits(ip_set_ip_t mask)
> {
>  if (mask == 0) return 0;
>  return 33 - ffs(mask);
> }

ipset does not allow to pass '1' as the parameter to this function.
But you are right, a malicious root user is able to form a request
which can contain not properly handled values.

I can't recall why I did not use ffs at the first place.

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlec@sunserv.kfki.hu
PGP key : http://www.kfki.hu/~kadlec/pgp_public_key.txt
Address : KFKI Research Institute for Particle and Nuclear Physics
           H-1525 Budapest 114, POB. 49, Hungary

