From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: request and reply/respon packets
Date: Wed, 03 Mar 2004 09:05:56 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1078301156.10573.72.camel@elendil.intranet.cartel-securite.net>
References: <071f01c400b7$63cc3900$0103a8c0@indoaksesbno>
	 <200403030059.40173.Antony@Soft-Solutions.co.uk>
	 <074a01c400bb$755f4a00$0103a8c0@indoaksesbno>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <074a01c400bb$755f4a00$0103a8c0@indoaksesbno>
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
To: bino-psn <bino@indoakses-online.com>
Cc: netfilter@lists.netfilter.org

Le mer 03/03/2004 =E0 02:04, bino-psn a =E9crit :
> I think you made a better description .. thx..
> And .. How to implement it in side the rule ?
> well ... How to let's say MARK any http-ACK coming  via an interface ?

You can also use conntrack engine.

First packet of the connection has NEW state, others have ESTABLISHED
one.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!=20

