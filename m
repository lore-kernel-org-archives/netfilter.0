From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: new tcp connections, without SYN
Date: 10 Apr 2003 10:48:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1049964481.790.4.camel@elendil.intranet.cartel-securite.net>
References: <7497DCA1C240C042B28F6657ADFD8E09268777@i2km11-ukbr.domain1.systemhost.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7497DCA1C240C042B28F6657ADFD8E09268777@i2km11-ukbr.domain1.systemhost.net>
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
To: dhiraj.2.bhuyan@bt.com
Cc: mklingens@ism.nl, netfilter@lists.netfilter.org

Le mer 09/04/2003 =E0 18:04, dhiraj.2.bhuyan@bt.com a =E9crit :
> I tried sending an "ACK" packet from behind my Netfilter firewall to a
> machine on the public side that actually doesn't exist.
> A look in the /proc/net/ip_conntrack tells me that Netfilter tracked th=
is
> connection as "ESTABLISHED" but "UNREPLIED". So Netfilter does infact a=
llow
> starting a TCP connection with an ACK packet.

Yes it does, unless you apply tcp-nopickup patch that enforces NEW and
RELATED TCP packets must be SYN ones, flaging others as INVALID.

This behaviour allows one to handle connections for which firewall have
not seen SYN packet, such as asymetrical routing, failover, reboot and
stuff.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

