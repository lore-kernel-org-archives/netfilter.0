From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: How to Uninstall iptables?
Date: Fri, 12 Sep 2003 11:40:11 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063359611.889.21.camel@elendil.intranet.cartel-securite.net>
References: <20030912090600.50450.qmail@web20701.mail.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20030912090600.50450.qmail@web20701.mail.yahoo.com>
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
To: ads nat <adsnat@yahoo.com>
Cc: netfilter@lists.netfilter.org

Le ven 12/09/2003 =E0 11:06, ads nat a =E9crit :
> I want to uninstall existing iptables 1.2.6a and install 1.2.8 fresh.
> Guide me how to uninstall iptables 1.2.6a.

It depends on how you installed iptables 1.2.6a.

If you installed it from your distribution package, then you have to use
the package mangement tool to remove the iptables package :

	apt-get remove iptables (Debian)
	rpm -e iptables (Red Hat)
	etc.

Hence, you can keep this package if dependencies want it. As an example,
on Debian distros, a packet filter is required, ipchains or iptables.
You can still install iptables 1.2.8 from source in /usr/local then set
your PATH such as /usr/local/sbin is searched before /sbin. Finally, you
can upgrade this package to the latest version :

	apt-get install iptables (Debian)

If you installed iptables from source, then a new iptables installation
from sources will overwrite the old one. However, files should be :

	in /usr/local/sbin for binaries (iptables*, ip6tables*)
	in /usr/local/lib/iptables for extensions
	in /usr/local/man/man8 for manpages (iptables*.8, ipt6tables*.8)

Just delete all of them, if you want to be sure.

Afaik, there's also a "make uninstall" available.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

