From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: arptables
Date: 22 Nov 2002 11:18:10 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1037960290.8909.1.camel@elendil.intranet.cartel-securite.net>
References: <200211152128.58239.sysadmin@hnoe1.sth.ac.at>
	 <047701c28f97$895afb30$ac01a8c0@monday>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <047701c28f97$895afb30$ac01a8c0@monday>
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
To: Toshihiro Sonoda <toshihiro@jp.fujitsu.com>
Cc: netfilter@lists.netfilter.org

Le mar 19/11/2002 =E0 07:47, Toshihiro Sonoda a =E9crit :
> I can find the arp_filter.c and arp_tables.c in "net/ipv4/netfilter/" o=
f kernel tree (2.4.18).
> But, I can not find the document about how to use the arp filtering.
> How can I use the arp filtering in linux.

Akaik, there's still no userland tool to configure ARP filtering into
kernel (aka arptables tool) and associated library.

So the first step would be implementing kernel/userland interface...

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

