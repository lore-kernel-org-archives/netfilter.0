From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Passed chains from local process to local ip
Date: Mon, 26 Jul 2004 10:41:41 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1090831301.2059.20.camel@anduril.intranet.cartel-securite.net>
References: <1090825381.2463.59.camel@anduril.intranet.cartel-securite.net>
	 <9196.1090828459@www51.gmx.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <9196.1090828459@www51.gmx.net>
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
To: Andreas Sachs <andilist@gmx.de>
Cc: netfilter@lists.netfilter.org

Le lun 26/07/2004 =E0 09:54, Andreas Sachs a =E9crit :
> i can bind mysql to one or to all ip-addresses. so it's not possible to=
 bind
> mysql 3 to all ip-addresses without ip-b.=20

Why don't you bind MySQL to 127.0.0.1, using a dedicated port for each
MySQL version (127.0.0.1:A for MySQL 3 and 127.0.0.1:B for MySQL 4) and
then use REDIRECT target to send packets to proper port :

	iptables -t nat -A PREROUTING --tcp -d $IPA --dport $MYSQL \
		-j REDIRECT --to-ports $PORT_A
	iptables -t nat -A PREROUTING --tcp -d $IPB --dport $MYSQL \
		-j REDIRECT --to-ports $PORT_B
	[etc.]

By the way, I tested it for you. I binded my SSHd to 127.0.0.1 only and
then issued :

	 iptables -t nat -A OUTPUT -p tcp -d $EXT_IP --dport 22 \
		-j REDIRECT

Then doing a ssh my external IP from the box itself works like a charm.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

