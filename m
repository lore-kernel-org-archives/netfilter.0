From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Is it possible to sync ip_conntrack between 2 hosts?
Date: 03 May 2003 00:32:51 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1051914771.21196.4.camel@elendil.intranet.cartel-securite.net>
References: <1051912895.26015.49.camel@martin.etecom.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1051912895.26015.49.camel@martin.etecom.com>
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
To: Zack Lawson <zack@etecom.com>
Cc: netfilter@lists.netfilter.org

Le sam 03/05/2003 =E0 00:01, Zack Lawson a =E9crit :
> I am trying to setup up a failover firewall using heartbeat. Everything
> seems to work just fine except for the fact that the state of existing
> connections is lost when the running firewall is stopped.
> Is there any way to share the info in /proc/net/ip_conntrack between
> these 2 systems?

I am not aware of a free working solution based on Netfilter that would
provide firewall states failover. There have been discussion (see low
traffic netfilter-failover mailing list) about this.

> If not, does anyone else have any ideas or solutions to this problem?
> I know that Cisco firewalls have this capability. I would be surprised
> if netfilter couldn't accomplish this as well.

It can't now, but it is planed. It will use nf-netlink and ct-netlink
you can find in POM.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

