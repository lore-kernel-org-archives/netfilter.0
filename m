From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: ICMP conntrack
Date: 18 Oct 2002 11:05:57 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1034931957.8912.13.camel@elendil>
References: <Pine.LNX.4.44.0210171713000.6045-100000@altaica.tigerknight.org>
	<3DAF772A.7BE6FB37@nestac.com> 
	<20021018082812.QQWL292.mta03-svc.ntlworld.com@there>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20021018082812.QQWL292.mta03-svc.ntlworld.com@there>
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

Le ven 18/10/2002 =E0 10:28, Antony Stone a =E9crit :
> > I was wondering why I'm not getting any conntrack entires for icmp
> > connections?
> There is no concept of a "connection" for ICMP.

Yes it's true, but for some, you have a request/reply concept.
=20
> A single ICMP packet is sent to indicate some situation has occurred.  =
=20
> There's no reply, there's no follow-up packet, therefore there's no nee=
d to=20
> keeptrack of a "connection" for something which consists of only a sing=
le=20
> packet.

Two cases :

	request/reply : echo, timestamp, address mask and info
		First packet (request) is NEW, others (replies) are
		ESTABLISHED ; entries have a 30s timeout.
		If a unsolicitated reply is received, then INVALID.

	ICMP erros : ICMP payload is a quotation extracted from the IP
		packet that has generated the error. This quotation is
		used to identify the related session in conntrack table.
		If ICMP match an active entry, then it's RELATED. If
		not, it's INVALID.

So, for ICMP requests, you have some kind of conntrack, based on ICMP
sequence number. For ICMP errors, conntrack tries to associate them to
an existing entry.


--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

