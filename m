From: Jozsef Kadlecsik <kadlec@netfilter.org>
Subject: Re: [ANNOUNCE] ipset 7.13 released
Date: Wed, 28 Jul 2021 14:44:10 +0200 (CEST)
Message-ID: <fa47f565-f7ea-1b98-718a-6c4251e1cdf@netfilter.org>
References: <f5d9071-7558-17a-9cd1-6ac0922710@netfilter.org> <2233nn0-11ns-4o5s-r629-n3n7p0q7r223@vanv.qr>
Mime-Version: 1.0
Return-path: <netfilter-devel-owner@vger.kernel.org>
In-Reply-To: <2233nn0-11ns-4o5s-r629-n3n7p0q7r223@vanv.qr>
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: Jan Engelhardt <jengelh@inai.de>
Cc: netfilter@vger.kernel.org, netfilter-devel@vger.kernel.org

On Wed, 28 Jul 2021, Jan Engelhardt wrote:

> On Tuesday 2021-07-27 12:35, Jozsef Kadlecsik wrote:
> >
> >I'm happy to announce ipset 7.13 - 7.12 was released but not announced due 
> >to additional fixes required in two patches.
> 
> Did you really try building that?
> 
> [   19s] Making all in src
> [   19s] make[2]: Entering directory '/home/abuild/rpmbuild/BUILD/ipset-7.13/src'
> [   19s] gcc -DHAVE_CONFIG_H -I. -I..    -I../include  -std=gnu99  -O2 -DNDEBUG -O2 -Wall -D_FORTIFY_SOURCE=2 -fstack-protector-strong -funwind-tables -fasynchr
> onous-unwind-tables -fstack-clash-protection -Werror=return-type  -g -c -o ipset.o ipset.c
> [   19s] /bin/sh ../libtool  --tag=CC   --mode=link gcc -std=gnu99  -O2 -DNDEBUG -O2 -Wall -D_FORTIFY_SOURCE=2 -fstack-protector-strong -funwind-tables -fasynch
> ronous-unwind-tables -fstack-clash-protection -Werror=return-type  -g   -o ipset ipset.o ../lib/libipset.la
> [   19s] libtool: link: gcc -std=gnu99 -O2 -DNDEBUG -O2 -Wall -D_FORTIFY_SOURCE=2 -fstack-protector-strong -funwind-tables -fasynchronous-unwind-tables -fstack-
> clash-protection -Werror=return-type -g -o .libs/ipset ipset.o  ../lib/.libs/libipset.so -lmnl -ldl -Wl,-rpath -Wl,/usr/lib64
> [   19s] /usr/lib64/gcc/x86_64-suse-linux/11/../../../../x86_64-suse-linux/bin/ld: ipset.o: in function `main':
> [   19s] /home/abuild/rpmbuild/BUILD/ipset-7.13/src/ipset.c:35: undefined reference to `ipset_xlate_argv'
> [   19s] collect2: error: ld returned 1 exit status
> 
> abuild@a4:~/rpmbuild/BUILD/ipset-7.13> readelf -aW lib/.libs/libipset.so.13.2.0 | grep ipset_xlate_argv
>    199: 0000000000019c40  4361 FUNC    LOCAL  DEFAULT   15 ipset_xlate_argv
> 
> Function not exported, hence link failure.

Ohh right, got it. I'm going to release the next version today. 

Best regards,
Jozsef
-
E-mail  : kadlec@blackhole.kfki.hu, kadlecsik.jozsef@wigner.hu
PGP key : https://wigner.hu/~kadlec/pgp_public_key.txt
Address : Wigner Research Centre for Physics
          H-1525 Budapest 114, POB. 49, Hungary
