From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: different DMZs which is better?
Date: 13 Jan 2003 15:59:40 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1042469979.8859.143.camel@elendil.intranet.cartel-securite.net>
References: <001e01c2bb10$05d79300$9865fea9@win2k.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001e01c2bb10$05d79300$9865fea9@win2k.com>
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
To: Mike <mikeeo@msn.com>
Cc: netfilter@lists.netfilter.org

Le lun 13/01/2003 =E0 15:28, Mike a =E9crit :
> Hey guys Im deciding how I want to implement a DMZ for my company can a=
nyone
> tell me the pros and cons of my DMZs below? should I got with a routabl=
e
> hosts in my DMZ and just filter out any port I don't want open or just =
port
> forward over certain ports and use IP alias?

The resulting architecture will provide the same result. Forwarding a
port to an IP or opening one to it is mainly the same in term of
security.

What changes between the two architectures, is the fact you do not have
to split your public addresses pool when you do NAT. So it can save
addresses if you're short, because all used public IPs will be aliased
on your firewall and simply NATed to a private addresses DMZ.

By the way, your filtering policy must not depend on the architecture
you'll choose. NAT does not constitute a security mecanism in you case,
so you have to consider it just as a trick, not a security feature.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
Consultant en s=E9curit=E9 des syst=E8mes et r=E9seaux  - Cartel S=E9curi=
t=E9
T=E9l: +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE


