From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: port forwarding not working
Date: Thu, 15 Apr 2004 17:58:02 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082044682.1700.15.camel@anduril.intranet.cartel-securite.net>
References: <004601c422f1$9162a3c0$ce00a8c0@xppro1>
	 <1082038036.23863.41.camel@raylinux.internal>
	 <33770.212.251.31.59.1082039282.squirrel@newmail.gnet.gr>
	 <200404151553.36634.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404151553.36634.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Le jeu 15/04/2004 =E0 16:53, Antony Stone a =E9crit :
> > iptables -t nat -A POSTROUTING -o dmzinterface -j MASQUERADE
> I disagree with this rule.   It will make all connections to servers in=
 the=20
> DMZ network appear to come from the firewall, which will destroy any us=
eful=20
> logging on the services which are running.

One may just add a "-s $LAN" statement so DMZ do not see packets using
internal addressing scheme (obfuscation), but keep external addresses
unmodified for logging purposes.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

