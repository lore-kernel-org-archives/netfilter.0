From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Filter ARP and Broadcasts
Date: 03 Jun 2003 22:26:45 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1054672005.6107.6.camel@elendil.intranet.cartel-securite.net>
References: <1054308660.3250.45.camel@bguerra.dtr-software.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1054308660.3250.45.camel@bguerra.dtr-software.com>
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
To: bguerra@dtr-software.com
Cc: netfilter@lists.netfilter.org

Le ven 30/05/2003 =E0 17:31, Bobby Guerra a =E9crit :
> I have noticed my production subnets broadcasts and ARP request are
> leaking into my DMZ.

ARP stuff is not supposed to be routed across different networks...

>  My goal is to keep the DMZ clean of all but
> necessary communication.  Is their a way to filter ARP and broadcasts?=20
> If so could you please give syntax.  Thanks for any help you may give.

Netfilter has no userspace code to filter ARP. However, you can use
ebtables that provides full ARP filtering on a bridged interface.

	http://ebtables.sourceforge.net/

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

