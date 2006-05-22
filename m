From: Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu>
Subject: Re: error compiling nfqnl_test.c
Date: Mon, 22 May 2006 12:44:41 -0400
Message-ID: <200605221244.43013.frankabel@tesla.cujae.edu.cu>
References: <200605211515.30934.frankabel@tesla.cujae.edu.cu>
	<200605221042.26597.frankabel@tesla.cujae.edu.cu>
	<9255886c0605220748w5ebfccb1r3ef016fff2d5b0da@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=nowsp; d=tesla.cujae.edu.cu;
	s=MDaemon; t=1148316350; x=1148921150;
	i=frankabel@tesla.cujae.edu.cu; q=dns; h=DomainKey-Signature:
	Received:From:Organization:To:Subject:Date:User-Agent:References:
	In-Reply-To:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-Disposition:Message-Id; b=CtohN4IDbg1/jjavV/PdV/muyyu0Guh
	3gzcHvHycuF4kWR6jSmlnNcj29hsXao7fm+Jogwln+QekzzkM/cNOrs0Or4vHvk6
	NyECHUZ4JavghPcz6ZtNj2iqkrgpQVQcVBFy7A4h/oYB0h4QjIz0KioPCYTu29lR
	n3u7L5/WX/Vg=
In-Reply-To: <9255886c0605220748w5ebfccb1r3ef016fff2d5b0da@mail.gmail.com>
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
To: Rodrigo Montoro <spooker@gmail.com>, netfilter@lists.netfilter.org

Thanks very much!!!
I'm advancing... lol

I need modify the nfqnl_test.c, specifically  I need access to ip.h and the=
=3D
=3D20
icmp.h headers. So I add "#include <linux/ip.h>" to the beginning of the fi=
=3D
le=3D20
nfqnl_test.c.

and when I try to compile with

gcc -Wall -o nfqnl_test nfqnl_test.c -lnfnetlink -lnetfilter_queue

the following errors:

In file included from nfqnl_test.c:10:
/usr/include/linux/ip.h:93:2: error: #error "Endian problem - this didn't=
=3D20
happen"
=3D2E......

the second line say something funy... :)

somebody known how solve this problem?


Salute
=3D46rank Abel

On Monday 22 May 2006 10:48 am, you wrote:
>   Try to run ldconfig
>   If this fails ,try to edit /etc/ld.so.conf and add
>   /usr/local/lib
>   So run ldconfig again.
>
> Att,
>
> On 5/22/06, Frank Abel Cancio Bello <frankabel@tesla.cujae.edu.cu> wrote:
> > Thanks Sebastien!
> >
> > Now the problem is when I try to run the binary, when I put on command
> > line:
> >
> > ./nfqnl_test
> >
> > the following error happend:
> >
> > ./nfqnl_test: error while loading shared libraries: libnfnetlink.so.0:
> > cannot open shared object file: No such file or directory
> >
> > Nevertheless my box have theses files:
> > /usr/local/lib/libnfnetlink.so.0
> > /usr/local/lib/libnfnetlink.so.0.0.0
> >
> > Beside, when I install the libnfnetlink ("./configure;make;make install=
=3D
")
> > I get a binary of nfqnl_test.c into utils directory and when I run it a=
=3D
ll
> > is fine.
> >
> > Salute
> > Frank Abel
> >
> > On Monday 22 May 2006 10:06 am, you wrote:
> > > Frank Abel Cancio Bello wrote:
> > > > Hi all!
> > > >
> > > > A newbie question:
> > > > When I try to compile "nfqnl_test.c" putting on command line:
> > > >
> > > > "gcc -Wall -o nfqnl_test nfqnl_test.c"
> > > >
> > > > the following error occur:
> > >
> > > [snip errors]
> > >
> > > you forgot to include required library symbols:
> > >
> > > gcc -Wall -o nfqnl_test nfqnl_test.c -lnfnetlink -lnetfilter_queue
> > >
> > > will do
> >
> > __________________________________________
> >
> > XIII Convenci=3DC3=3DB3n Cient=3DC3=3DADfica de Ingenier=3DC3=3DADa y A=
rquitectura
> > 28/noviembre al 1/diciembre de 2006
> > Cujae, Ciudad de la Habana, Cuba
> > http://www.cujae.edu.cu/eventos/convencion


__________________________________________

XIII Convenci=F3n Cient=EDfica de Ingenier=EDa y Arquitectura
28/noviembre al 1/diciembre de 2006
Cujae, Ciudad de la Habana, Cuba
http://www.cujae.edu.cu/eventos/convencion

