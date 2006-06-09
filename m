From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Transparent proxy errors
Date: Fri, 09 Jun 2006 17:08:21 +0200
Message-ID: <1149865702.23939.1.camel@anduril.intranet.cartel-securite.net>
References: <44365.10.137.2.111.1149854383.squirrel@mail.medcol.mw>
	<9255886c0606090507w7980d50es9d08edd12c89ee8f@mail.gmail.com>
	<448981AE.1080508@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <448981AE.1080508@gmail.com>
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
To: Diaa Radwan <diaaradwan@gmail.com>
Cc: netfilter@lists.netfilter.org

Le vendredi 09 juin 2006 =E0 17:11 +0300, Diaa Radwan a =E9crit :
> >   You can't use transparent proxy with SSL cause headers are
> > encrypted and contains no useful data about destinations.
> You can use it ,there is nothing will stop iptables from forwarding the
> requests to your proxy ports.

Yes, you can forward them, but it won't work unless your HTTP proxy
handles SSL connection itself.
Usual way to handle SSL connections proxying is explicitly declare proxy
for SSL to have web client issue a CONNECT to the proxy.=20


--=20
http://sid.rstack.org/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

