From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: STATELESS
Date: Tue, 16 Sep 2003 14:24:42 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1063715082.890.103.camel@elendil.intranet.cartel-securite.net>
References: <02ba01c37c46$bb7a5f60$798014ac@matthew>
	 <1063712957.31314.145.camel@raylinux.internal>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1063712957.31314.145.camel@raylinux.internal>
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
To: Ray Leach <raymondl@knowledgefactory.co.za>
Cc: Netfilter Mailing List <netfilter@lists.netfilter.org>

Le mar 16/09/2003 =E0 13:49, Ray Leach a =E9crit :
> On Tue, 2003-09-16 at 13:36, Matthew Mileham wrote:
> > Does any know how to change Iptables from statefull to stateless ?
> Leave out the -m state parameters ?

And unload ip_conntrack module to save load, for once module is loaded,
connection tracking is still working, even if state match is not used.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

