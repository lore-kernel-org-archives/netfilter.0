From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: tunneling and iptables
Date: Wed, 10 Mar 2004 10:02:28 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078909348.2757.13.camel@anduril.intranet.cartel-securite.net>
References: <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
	 <5.2.1.1.2.20040309214501.00b47310@postoffice6.mail.cornell.edu>
	 <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <5.2.1.1.2.20040310030818.00b40808@postoffice6.mail.cornell.edu>
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
To: Hitesh Ballani <hb69@cornell.edu>
Cc: netfilter@lists.netfilter.org

Le mer 10/03/2004 =E0 09:15, Hitesh Ballani a =E9crit :
> thanks for your comments on tunnels ... actually i am working on a mode=
l=20
> for anycast deployment and need to have the 16 bits so that i can suppo=
rt=20
> 256*(2^16) services using a single /24 block ..

OK.

If I understand your context (what may not be true), your problem is
that you have to route packets against destination port and that MARK
capabilities are too limited for you to have Netfilter communicate
within policy routing.

So, have you considered using ROUTE target (from patch-o-matic), that
allows one to specify a specific route for a given packet within
Netfilter. With it, you could implement rule just like this :

	iptables -t mangle -A POSTROUTING -p tcp --dport $myservice \
		-j ROUTE --gw $myservicegw


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

