From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Strange problem with iptables IP Masq
Date: 16 Sep 2002 13:23:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1032175409.719.48.camel@elendil>
References: <002001c25dc4$69549800$6400a8c0@hammer1>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <002001c25dc4$69549800$6400a8c0@hammer1>
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
To: Lior Hammer <lior@typo.co.il>
Cc: netfilter@lists.netfilter.org

Le lun 16/09/2002 =E0 23:02, Lior Hammer a =E9crit :
> I'm using the IP Masq script from the IP masq howto from TLDP.
> The connection sharing is fine except for one thing:
> in some of the sites (for example: http://httpd.apache.org or DynDNS.or=
g
> members area) my browser keep's searching and searching without any res=
ult
> (or other response) or it just print few lines and that's it.
> I thought it's a problem with my browser, so i tryed to get the page
> directly with telnet.
> i got the HTTP Headers, and the first lines, and that's it, it didn't
> disconnect or somthing, just waited.
> Everything is ok when i'm trying to get this page directrly with lynx f=
rom
> the computer that shares the conection.

Are you connected via ADSL line using PPPoE ?

If so, you have to lower TCP MSS for forwarded packets down to 1452 (MTU
1492) to avoid problems when PMTU discovery is broken. This can be done
directly on pppoed using -m switch :

	pppoe -I eth0 -T 80 -m 1452

Or this can be done using Netfilter mangle table :

	iptables -t mangle -A FORWARD -o ppp0 -p tcp --syn \
		-j TCPMSS --clamp-mss-to-pmtu

If not, forwarded hosts will export a 1460 TCP MSS (MTU 1500). Big
replies will be to big and lost.

--=20
C=E9dric Blancher
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

