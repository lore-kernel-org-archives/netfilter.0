From: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Subject: RE: iptables2.spec
Date: Thu, 13 Mar 2003 11:06:34 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <5.2.0.9.2.20030313110550.01f8d908@172.26.0.8>
References: <7F9067FBD7B14F4387EA63434CE260033F844C@hyd-mdp-msg.wipro.c
 om>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7F9067FBD7B14F4387EA63434CE260033F844C@hyd-mdp-msg.wipro.c
 om>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: Prasanta kumar Panda <prasanta.kumar@wipro.com>, netfilter@lists.netfilter.org

Same problem here :(

[root@luismi iptables2]# make
Making all in .
make[1]: Cambiando a directorio `/root/temp/netfilter/iptables2'
make[1]: No se hace nada para `all-am'.
make[1]: Saliendo directorio `/root/temp/netfilter/iptables2'
Making all in include
make[1]: Cambiando a directorio `/root/temp/netfilter/iptables2/include'
cd .. && autoheader
cd .. \
   && CONFIG_FILES=3D CONFIG_HEADERS=3Dinclude/config.h \
      /bin/sh ./config.status
creating include/config.h
make[1]: Saliendo directorio `/root/temp/netfilter/iptables2/include'
Making all in libnfnetlink
make[1]: Cambiando a directorio `/root/temp/netfilter/iptables2/libnfnetl=
ink'
cd . && aclocal
/bin/sh ./config.status --recheck
./config.status: ./config.status: No existe el fichero o el directorio
make[1]: *** [config.status] Error 127
make[1]: Saliendo directorio `/root/temp/netfilter/iptables2/libnfnetlink=
'
make: *** [all-recursive] Error 1

Did you report it to bugzilla.netfilter.org?

At 23:40 12/03/2003 +0530, Prasanta kumar Panda wrote:

>Hi Luis
>
>But before that you should be able to build it manually. When I run make=
=20
>after a normal configure got this error
>
>
>make[1]: Entering directory=20
>`/usr/src/redhat/BUILD/iptables2-pra1/libnfnetlink'
>cd . && aclocal
>/bin/sh ./config.status --recheck
>./config.status: ./config.status: No such file or directory
>make[1]: *** [config.status] Error 127
>make[1]: Leaving directory `/usr/src/redhat/BUILD/iptables2-pra1/libnfne=
tlink'
>make: *** [all-recursive] Error 1
>
>
>Other wise this is the way to make the rpm
>
>Move the iptables2 directory to iptables2-VERSION directory and put to=20
>tar+gzip as iptables2-VERSION.tar.gz
>Next
>rpmbuild -tb iptables2-VERSION.tar.gz
>Or
>rpmbuild -ts iptables2-VERSION.tar.gz to get a srpm package which you ca=
n=20
>compile later on with rpmbuild --rebuild command.
>
>Reg.
>Prasanta
>
>
>
>
>-----Original Message-----
>From: Luis Miguel Cruz Miranda [mailto:luismi@b2bi.es]
>Sent: Wednesday, March 12, 2003 10:26 PM
>To: netfilter@lists.netfilter.org
>Subject: iptables2.spec
>
>
>I downloaded netfilter code from cvs.
>I discover it cames with a iptables2.spec.
>I tried to use it in order to create an iptables rpm, but I couldn't!!.=20
>How can I use it? rpm -ba iptables2.spec doesn't run for me.
>
>Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
>CCNA - Systems Administrator            |       Pol. Ind. de Asipo
>                                          |       C/A - Parcela 86-C
>Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
>Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN=
)
>
>
>
>

Luis Miguel Cruz Miranda.               |       B2B INTEGRAL, S.A.
CCNA - Systems Administrator            |       Pol. Ind. de Asipo
                                         |       C/A - Parcela 86-C
Tel: +34 902 506 605                    |       33.428 - CAYES - LLANERA
Fax:+34 985 980 794                     |       ASTURIAS (ESPA=D1A/SPAIN)



