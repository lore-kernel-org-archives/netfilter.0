From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Transparent proxying using REDIRECT
Date: 17 Jul 2003 09:22:49 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1058426569.747.1.camel@elendil.intranet.cartel-securite.net>
References: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <4.2.2.20030717085400.00cb6ac0@vttmail.vtt.fi>
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
To: Mikko Alutoin <mikko.alutoin@vtt.fi>
Cc: netfilter@lists.netfilter.org

Le jeu 17/07/2003 =E0 08:24, Mikko Alutoin a =E9crit :
> I have a question about transparent proxying. Suppose I have the follow=
ing=20
> rule in my kernel:
> iptables -t nat -A PREROUTING -i eth1 -p tcp --dport 80 -j REDIRECT=20
> --to-port 3128
> The purpose of the rule is that all web traffic is captured by a proxy=20
> listening to a local port. Now the question:
> How does the proxy get to know the original destination IP address and=20
> port? By looking into the HTTP-request, perhaps? If so, what if the=20
> application protocol (some other than HTTP) does not contain the=20
> destination URL?

Because clients now use HTTP/1.1, which requests contains destination
host name :

	GET / HTTP/1.1
	host: www.google.com

This is the way name virtual hosts work, and so transparent proxying.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

