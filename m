From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP conntrack
Date: 18 Oct 2002 12:54:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034938450.8912.29.camel@elendil>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org>
	<20021018082812.QQWL292.mta03-svc.ntlworld.com@there>
	<1034931957.8912.13.camel@elendil> 
	<200210180952.g9I9qEL27957@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210180952.g9I9qEL27957@vulcan.rissington.net>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="iso-8859-1"
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter@lists.netfilter.org

Le ven 18/10/2002 =E0 11:52, Antony Stone a =E9crit :
> Although I agree with what you've said here, it's not really relevant
> to the  original poster's question, because in these cases you'll
> still never see an ICMP entry in the connection tracking table. =20
> Because the ICMP packets are RELATED to the original connection, it's
> the original packet which you'll see in the conntrack table - the ICMP
> replies simply get through because of their
> relationship to the original packet.

True ;)

> > So, for ICMP requests, you have some kind of conntrack, based on ICMP
> > sequence number. For ICMP errors, conntrack tries to associate them t=
o
> > an existing entry.
> ICMP sequence number ???   What's that ?

cbr@elendil:~$ ping thor
PING thor (192.168.10.50): 56 data bytes
64 bytes from 192.168.10.50: icmp_seq=3D0 ttl=3D255 time=3D0.3 ms
64 bytes from 192.168.10.50: icmp_seq=3D1 ttl=3D255 time=3D0.3 ms
64 bytes from 192.168.10.50: icmp_seq=3D2 ttl=3D255 time=3D0.2 ms
64 bytes from 192.168.10.50: icmp_seq=3D3 ttl=3D255 time=3D0.3 ms
64 bytes from 192.168.10.50: icmp_seq=3D4 ttl=3D255 time=3D0.3 ms

			     ^^^^^^^^^^
				This

Just spy an ICMP request/reply stuff such as ping with ethereal and look
at sequence number field. It aims to associate received reply to the
good sent request.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

