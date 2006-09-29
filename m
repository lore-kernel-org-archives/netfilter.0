From: "Gabriel Sousa" <gabriel.sousa@gmail.com>
Subject: ipset-2.2.9 + kernel 2.6.18
Date: Fri, 29 Sep 2006 13:05:11 -0300
Message-ID: <2ad878d00609290905g3df5372cmb2077fbe6bd366b5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

i had a problem when try to compile ipset-2.2.9 with kernel 2.6.18,
you can see the problem below:

/usr/src/linux/include/asm/bitops.h:244: error: syntax error before "int"
In file included from /usr/src/linux/include/asm/bitops.h:409,
                 from ipset.c:24:

I see the header file bitops.h at 244 line and found this function:

static __always_inline int constant_test_bit(int nr, const volatile
unsigned long *addr)

the ipset don't accept the *__always_* if we change this to *inline*
it compile correctly. So my function at header file was thus:

static inline int constant_test_bit(int nr, const volatile unsigned long *addr)


I want to know if anyone found another solution to this problem...

Regards,

Gabriel Sousa a.k.a call

