From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: can iptables block ARPS
Date: Sat, 30 Sep 2006 14:41:30 +0200
Message-ID: <1159620090.13180.3.camel@anduril.intranet.cartel-securite.net>
References: <b06339d40609290721o57703505m4de20360ac6aca30@mail.gmail.com>
	<451D2D66.20301@zoomnet.ro>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <451D2D66.20301@zoomnet.ro>
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
To: Alexandru Dragoi <alex@zoomnet.ro>
Cc: netfilter@lists.netfilter.org, Ralph Blach <ralph.blach@gmail.com>

Le vendredi 29 septembre 2006 =E0 17:27 +0300, Alexandru Dragoi a =E9crit :
> > Can Ip Tables Block arp request from certain Mac address or IP address?
> Nope, use arptables. It has similar syntax with iptables.

Or ebtables, using arp match. See http://ebtables.sourceforge.net/


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

