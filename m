From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Controlling UDP RELATED match
Date: Wed, 10 Mar 2004 15:24:31 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078928671.2757.116.camel@anduril.intranet.cartel-securite.net>
References: <1078927341.21848.6.camel@fish.homewiththebitch.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1078927341.21848.6.camel@fish.homewiththebitch.co.uk>
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
To: Oli Comber <oli@niceltowers.co.uk>
Cc: netfilter@lists.netfilter.org

Le mer 10/03/2004 =E0 15:02, Oli Comber a =E9crit :
> Is there any way to view/control how long a UDP pseudo connection will
> be held open for by Netfilter? Or to put it another way, can I control
> how long an incomming UDP packet is considered RELATED to an outgoing
> UDP packet?

Have a look at H323 conntrack helper that handle UDP connections, or ask
devel mailing list.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

