From: Robert Botha <flash@flash.za.org>
Subject: Re: How to drop traffic Kazza and AudioGalaxy Ports?
Date: Sat, 25 May 2002 17:45:07 +0200
Sender: netfilter-admin@lists.samba.org
Message-ID: <3CEFB183.90409@flash.za.org>
References: <BGEDKDNOALIOMEHDPHHLCEEECGAA.chsilva@linares.net.mx>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.samba.org

you have to block port 1214 on the FORWARD chain for KaZaa
and my guess would be to block the audio galaxy servers IPs on the=20
FORWARD chain since audio galaxy just use standard http port 80 and ftp=20
port 21&20 for transfers and frontend

Carlos Horacio Silva Elizondo wrote:
> Hello , Any body knows how to drop the port of kazza and AudioGalaxy
> using IPtables
> I want to restrict All Internal Network to use This Programs
> =20
> eth0 External Network
> eth1 Internal Network
> Running SuSE 7.3 Kernel 2.4.-10
> Thanks!
> =20
> =20
> Informatica y Redes, S.A. de C.V.
> Corregidora 711 y 714 Norte
> Linares, N.L., CP.67700
> Tels. (821) 2124600,2127080,2120198
>       www.linaresonline.com <http://www.linaresonline.com/>
> Tecnolog=EDa a T=FA Servicio !
> =20


--=20
Robert Botha
jabber: flash@vitalclan.co.za
#include <witty_taglines.h>
void main() {
	printf("%s\n",witty());
}




