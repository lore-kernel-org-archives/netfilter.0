From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: iptables and iproute
Date: Mon, 26 Apr 2004 09:51:25 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1082965885.1794.1.camel@anduril.intranet.cartel-securite.net>
References: <1082964013.1772.14.camel@Toshiba.Toshiba>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1082964013.1772.14.camel@Toshiba.Toshiba>
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
To: Antonio Alvarez <aramirez@teneinformatica.com>
Cc: netfilter <netfilter@lists.netfilter.org>

Le lun 26/04/2004 =E0 09:20, Antonio Alvarez a =E9crit :
> The problem is how can i control the packet localy generated( ip and
> port )??? =20
> i can't mangle this packet before routing :-/

You can mangle them in OUTPUT chain...

> In sumarize it's possible to use different routing tables with packet
> generated localy??

Yes.
One solution, amoung others : mark them in OUTPUT and route against
nfmark.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

