From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: HELP!!! (ip_conntrack: table full)
Date: Fri, 19 Sep 2003 18:06:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063987589.5022.56.camel@elendil.intranet.cartel-securite.net>
References: <20030919144311.55129.qmail@web13310.mail.yahoo.com>
	 <1063984503.782.564.camel@shaolin.gridlocksecurity.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063984503.782.564.camel@shaolin.gridlocksecurity.com>
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
To: Nox <pheusion@snet.net>
Cc: Alpha Technologies <alphaside@yahoo.com>, netfilter@lists.netfilter.org

Le ven 19/09/2003 =E0 17:15, Nox a =E9crit :
> You can flush conntrack entries for masqueraded connections
> by doing either a down/up or ip addr add/del on the associated
> interface.  This probably won't help you in this case though
> because the problem conntrack is not masqueraded.  I don't
> know of any other ways of flushing conntracks.

Afaik, if you use SNAT, then IP address removal won't change anything,
as you can SNAT on IP that does not belong to the box.
For MASQUERADE, you may have to bring the interface down to flush
associated conntrack entries.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

