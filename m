From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: pop3 and dns
Date: Wed, 12 May 2004 21:34:05 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1084390445.1791.30.camel@anduril.intranet.cartel-securite.net>
References: <F22386C3FEB012449238672E38ED61E706C2D5@overlord.overturemedia.com>
	 <162701c4375d$1f28a4a0$49caa8c0@caris.priv>
	 <20040512042251.GB24345@samad.com.au>
	 <1084346112.24001.35.camel@raylinux.internal> <40A2777E.4010008@netgods.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40A2777E.4010008@netgods.us>
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
To: Netfilter Mailing List <netfilter@lists.netfilter.org>

Le mer 12/05/2004 =E0 21:14, Dana Bourgeois a =E9crit :
> >>tcp for zone transfers
> > and large answers ...
> ...where a 'large answer' is usually taken to be a UDP packet of more=20
> than 512 bytes.

I don't quite understand the meaning of this answer... So, I clarify.

When a DNS server has to reply on UDP with more than 512 bytes of data,
it sends back an answer with TC bit (truncated) set to let client know
answer is not complete and have him send it again using TCP.

The reason seems to be tied to old 576 bytes MTU which leaves a bit more
than 512 bytes for answer datas.


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

