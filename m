From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: pppOE and Netfilter
Date: Thu, 11 Dec 2003 10:09:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1071133774.783.35.camel@elendil.intranet.cartel-securite.net>
References: <20031206001448.24838.qmail@web25202.mail.ukl.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <20031206001448.24838.qmail@web25202.mail.ukl.yahoo.com>
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
To: ONeill Jack <jackoneill9@yahoo.fr>
Cc: netfilter@lists.netfilter.org

Le sam 06/12/2003 =E0 01:14, ONeill Jack a =E9crit :
> Can Netfilter filter pppoe trafic ?

Yes. Just as any other IP traffic. PPPoE traffic appears through PPP
interface, most the time ppp0.

> (Config :
> Net -- ADSL Card|linuxbox|eth -- LAN)

Example :

	iptables -A FORWARD -s $LAN -i eth0 -o ppp0 -j ACCEPT
	iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE
	[...]

There's a lot of tutorials and scripts examples on the web that explain
this...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

