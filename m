From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: RELATED connections and the feeling of security
Date: Fri, 13 Apr 2007 13:30:28 +0200
Message-ID: <1176463828.9361.14.camel@anduril.intranet.cartel-securite.net>
References: <200704131202.27971.Hugo.Mildenberger@t-online.de>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <200704131202.27971.Hugo.Mildenberger@t-online.de>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="iso-8859-1"
To: Hugo Mildenberger <Susan.Scheibe@t-online.de>
Cc: netfilter@lists.netfilter.org

Le vendredi 13 avril 2007 =E0 12:02 +0200, Hugo Mildenberger a =E9crit :
> "iptables -A INPUT -m state --state ESTABLISHED, RELATED - j ACCEPT"
> This means to allow inbound connections having nothing in common with the=
=20
> initiating outbound connection, except for the ip-address pair used by th=
e=20
> initiating connection, leaving your nominal firewalled systems exposed to=
 any=20
> malicious site you accidentally stumble on, whereas using "ESTABLISHED" a=
lone=20
> here would restrict connections to be outbound only.

On what ground do you base this statement ? AFAIK, RELATED state applies
to:

	. expectations created by protocol helpers such as FTP or IRC,
	  that therefore have "something in common with the initiating
	  outbound connection";
	. ICMP errors that match an existing conntrack entry, that again
	  have a relation with previously allowed connections.

Behaviour you're referring to applies to the first category. As I have
not check the code recently, could you specificly point some modules
that create such unexpected and lax expectations ? Thoses would indeed
be a serious security issue to me.


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

