From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: pktstat and netfilter
Date: 05 Aug 2003 10:31:06 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060072266.749.8.camel@elendil.intranet.cartel-securite.net>
References: <3F2F6235.5080100@belfordhk.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2F6235.5080100@belfordhk.com>
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
To: Edmund <cc@belfordhk.com>
Cc: Netfilter <netfilter@lists.netfilter.org>

Le mar 05/08/2003 =E0 09:52, Edmund a =E9crit :
> Anyway, today I was majorly surprised to see
> a Local IP sending a packet to a remote LAN
> on port 80.
>     tcp  192.168.10.3:2041 <-> x.x.x.x:80
> Is this supposed to happen?  Assuming that
> pktstat listens to the resulting packet
> after NAT'd, shouldn't the 192.168.10.3
> be my actual Internet IP?

Afaik, libpcap capture outgoing traffic at last routing point, i.e.
before NF_IP_POST_ROUTING hook. Thus, packets you get are not yet
SNATed.
I think it's merely the same for inbound traffic (need someone to
confirm), that is captured after NF_IP_PRE_ROUTING hook, and so is
already DNATed.

It's quite wierd as one would like to capture the very traffic that is
sent to the wire or traffic recieved from the wire unaltered, whatever
active ruleset.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

