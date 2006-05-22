From: Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu>
Subject: Re: error compiling nfqnl_test.c
Date: Mon, 22 May 2006 10:42:25 -0400
Message-ID: <200605221042.26597.frankabel@tesla.cujae.edu.cu>
References: <200605211515.30934.frankabel@tesla.cujae.edu.cu>
	<4471C553.8000005@wengo.fr>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=nowsp; d=tesla.cujae.edu.cu;
	s=MDaemon; t=1148309024; x=1148913824;
	i=frankabel@tesla.cujae.edu.cu; q=dns; h=DomainKey-Signature:
	Received:From:Organization:To:Subject:Date:User-Agent:References:
	In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-Disposition:Message-Id; b=OCL8hl4RVd8Cs3GSieNg+vVUMCNIOaS
	Wh598sgHzwGVuP6NfV2hljvhF5z4mvof90igLXuDlhSfmqAu8/9Za2ePKheR2Ix2
	30Dx9zUASlDV06cIiVY5zVgr4Z8lI9YnYFC42ZRfQxJ2P9LqNZIsr2CpkEeEV0Tf
	VGJ/rY76iYxg=
In-Reply-To: <4471C553.8000005@wengo.fr>
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
Content-Type: text/plain; charset="iso-8859-1"
To: Sebastien Tricaud <sebastien.tricaud@wengo.fr>, netfilter@lists.netfilter.org

Thanks Sebastien!

Now the problem is when I try to run the binary, when I put on command line:

./nfqnl_test

the following error happend:

./nfqnl_test: error while loading shared libraries: libnfnetlink.so.0: cann=
ot=20
open shared object file: No such file or directory

Nevertheless my box have theses files:
/usr/local/lib/libnfnetlink.so.0
/usr/local/lib/libnfnetlink.so.0.0.0

Beside, when I install the libnfnetlink ("./configure;make;make install") I=
=20
get a binary of nfqnl_test.c into utils directory and when I run it all is =

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

