From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables immutable
Date: 10 Feb 2003 08:42:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1044862955.9119.4.camel@elendil.intranet.cartel-securite.net>
References: <20030207014437.GC28004@placemark.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030207014437.GC28004@placemark.com>
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
To: Kelly Setzer <Kelly.Setzer@placemark.com>
Cc: netfilter@lists.netfilter.org

Le ven 07/02/2003 =E0 02:44, Kelly Setzer a =E9crit :
> We are in the process of implementing a firewall based on iptables.
> Our basic implementation is laid out, and now we are searching for
> every scrap that might improve security.  One thing I'd like is the
> ability to "lock" the iptables configuration so that no further
> changes can be made (without rebooting).

See LIDS :

	http://www.lids.org/

Things such as CAP_NET_ADMIN should do the trick. Consider also
CAP_NET_RAW to prevent someone from injecting layer 2 stuff under the
firewalling process.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


