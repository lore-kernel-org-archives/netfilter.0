From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: passive ftp
Date: 12 Feb 2003 11:05:07 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1045044307.12854.2.camel@elendil.intranet.cartel-securite.net>
References: <5.2.0.9.2.20030211174150.01b9b4f8@172.26.0.8>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.0.9.2.20030211174150.01b9b4f8@172.26.0.8>
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
To: Luis Miguel Cruz Miranda <luismi@b2bi.es>
Cc: netfilter@lists.netfilter.org

Le mar 11/02/2003 =E0 17:43, Luis Miguel Cruz Miranda a =E9crit :
> Ok, I spend more than 30 minutes and I couldn't discover how to allow=20
> inbound passive ftp.

Just load ip_conntrack_ftp then allow RELATED state and you're done.

> Can anyone write me a generic iptables rules?

iptables -A INPUT -m state --state RELATED -j ACCEPT

Can't be more generic.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE



