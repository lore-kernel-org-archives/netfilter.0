From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: VPN and iptables rules
Date: Tue, 04 Nov 2003 16:18:35 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1067959115.906.99.camel@elendil.intranet.cartel-securite.net>
References: <3FA7BE9D.1000202@aiqa.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3FA7BE9D.1000202@aiqa.com>
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
To: Ozgur AKAN <akan@aiqa.com>
Cc: netfilter@lists.netfilter.org

Le mar 04/11/2003 =E0 15:58, Ozgur AKAN a =E9crit :
> After dialing my isp my winxp connects to internet and gets
> 212.2.212.1. I establish the vpn connection to linux firewall.
> Everything is ok until this point.
> My problem is I can not ping the server from client or vice versa.

You should have a look to the filtering ruleset for the PPTP link on the
server side :

	INPUT and OUTPUT for ping
	FORWARD for usual trafic

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

