From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Using heartbeat for fall over on IPTables Firewall
Date: 18 Mar 2003 09:02:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1047974560.5049.8.camel@elendil.intranet.cartel-securite.net>
References: <3019863CF306D211BA4500A0CC30812DC67938@exchange.cyberwolf.com>
	 <Pine.LNX.4.53.0303171701120.7151@gypsy>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <Pine.LNX.4.53.0303171701120.7151@gypsy>
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
To: Steve Mickeler <steve@warning.ca>
Cc: Chip Upsal <cupsal@cyberwolf.com>, Antonio Paulo Salgado Forster <aforster@br.ibm.com>, netfilter@lists.netfilter.org

Le lun 17/03/2003 =E0 23:08, Steve Mickeler a =E9crit :
> Just off the top of my head:
> 1) heartbeat is limited to 2 nodes
> 2) keepalived config is much cleaner and easier to manage.

Moreover, keepalived supports VRRP, which means it can interoperate with
other devices that support this protocole and is far more flexible in
terms of configuration. It also supports IPSEC-AH authentication, as
defined in VRRPv2.

VRRP has been defined to provide flexible failover for routers, and is
so applicable to packet filters. In this usage, it is to my mind much
efficient than heartbeat.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


