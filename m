From: "Sietse van Zanen" <sietse@wizdom.nu>
Subject: RE: error compiling nfqnl_test.c
Date: Mon, 22 May 2006 16:49:36 +0200
Message-ID: <02BB8A4AC86C564C89C7F14CF98CE0C4012766@knowledge.wizdom.nu>
References: <200605211515.30934.frankabel@tesla.cujae.edu.cu><4471C553.8000005@wengo.fr>
	<200605221042.26597.frankabel@tesla.cujae.edu.cu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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
To: Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu>, Sebastien Tricaud <sebastien.tricaud@wengo.fr>, netfilter@lists.netfilter.org

Add /usr/local/lib to ld.conf or LD_LIBRARY_PATH env variable.
=20
-Sietse

________________________________

From: netfilter-bounces@lists.netfilter.org on behalf of Frank Abel =
Cancio Bello
Sent: Mon 22-May-06 16:42
To: Sebastien Tricaud; netfilter@lists.netfilter.org
Subject: Re: error compiling nfqnl_test.c



Thanks Sebastien!

Now the problem is when I try to run the binary, when I put on command =
line:

./nfqnl_test

the following error happend:

./nfqnl_test: error while loading shared libraries: libnfnetlink.so.0: =
cannot
open shared object file: No such file or directory

Nevertheless my box have theses files:
/usr/local/lib/libnfnetlink.so.0
/usr/local/lib/libnfnetlink.so.0.0.0

Beside, when I install the libnfnetlink ("./configure;make;make =
install") I
get a binary of nfqnl_test.c into utils directory and when I run it all =
is
fine.

Salute
Frank Abel


On Monday 22 May 2006 10:06 am, you wrote:
> Frank Abel Cancio Bello wrote:
> > Hi all!
> >
> > A newbie question:
> > When I try to compile "nfqnl_test.c" putting on command line:
> >
> > "gcc -Wall -o nfqnl_test nfqnl_test.c"
> >
> > the following error occur:
>
> [snip errors]
>
> you forgot to include required library symbols:
>
> gcc -Wall -o nfqnl_test nfqnl_test.c -lnfnetlink -lnetfilter_queue
>
> will do


__________________________________________

XIII Convenci=F3n Cient=EDfica de Ingenier=EDa y Arquitectura
28/noviembre al 1/diciembre de 2006
Cujae, Ciudad de la Habana, Cuba
http://www.cujae.edu.cu/eventos/convencion




