From: "Danila Octavian" <pisic@service.agress.ro>
Subject: Re: How to drop traffic Kazza and AudioGalaxy Ports?
Date: Fri, 14 Jun 2002 11:17:47 +0300
Sender: netfilter-admin@lists.samba.org
Message-ID: <002a01c2137b$f918c350$130da8c0@pisic>
References: <BGEDKDNOALIOMEHDPHHLCEEECGAA.chsilva@linares.net.mx> <3CEFB183.90409@flash.za.org>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.samba.org>
Errors-To: netfilter-admin@lists.samba.org
List-Help: <mailto:netfilter-request@lists.samba.org?subject=help>
List-Post: <mailto:netfilter@lists.samba.org>
List-Subscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <http://lists.samba.org/listinfo/netfilter>,
	<mailto:netfilter-request@lists.samba.org?subject=unsubscribe>
List-Archive: <http://lists.samba.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: netfilter@lists.samba.org


----- Original Message -----
From: "Robert Botha" <flash@flash.za.org>
To: <netfilter@lists.samba.org>
Sent: Saturday, May 25, 2002 6:45 PM
Subject: Re: How to drop traffic Kazza and AudioGalaxy Ports?


> you have to block port 1214 on the FORWARD chain for KaZaa
> and my guess would be to block the audio galaxy servers IPs on the
> FORWARD chain since audio galaxy just use standard http port 80 and ftp
> port 21&20 for transfers and frontend
>
> Carlos Horacio Silva Elizondo wrote:
> > Hello , Any body knows how to drop the port of kazza and AudioGalaxy
> > using IPtables
> > I want to restrict All Internal Network to use This Programs
> >
> > eth0 External Network
> > eth1 Internal Network
> > Running SuSE 7.3 Kernel 2.4.-10
> > Thanks!
> >
> >
> > Informatica y Redes, S.A. de C.V.
> > Corregidora 711 y 714 Norte
> > Linares, N.L., CP.67700
> > Tels. (821) 2124600,2127080,2120198
> >       www.linaresonline.com <http://www.linaresonline.com/>
> > Tecnolog=EDa a T=FA Servicio !
> >
>
>
> --
> Robert Botha
> jabber: flash@vitalclan.co.za
> #include <witty_taglines.h>
> void main() {
> printf("%s\n",witty());
> }
>
>
>
>
>
About Kazaa I don't use it and have no ideea ...
but about AudioGalaxy I can tell ya what u have to block :
64.245.58.0/23 is their class u only have to put in your firewall something
like
iptables -A FORWARD -d 64.245.58.0/23 -j REJECT
Seeya



