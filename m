From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: RE: Re: Ports closed in spite of opening them?
Date: Fri, 02 Apr 2004 22:09:01 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080936541.1655.46.camel@anduril.intranet.cartel-securite.net>
References: <AD8D39C727CBD411BB2C0090273A727408F9F139@mortimer.law.uconn.edu>
	 <1080936038.22816.3.camel@ranjeet-pc2.zultys.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <1080936038.22816.3.camel@ranjeet-pc2.zultys.com>
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
To: Ranjeet Shetye <ranjeet.shetye2@zultys.com>
Cc: "Hurley, Michael" <MHurley@law.uconn.edu>, "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Le ven 02/04/2004 =E0 22:00, Ranjeet Shetye a =E9crit :
> you might have "/etc/hosts.allow" and "/etc/hosts.deny" files lying
> around that WILL interfere, without you being aware of what's happening.

A port scan will see thoses ports as opened, as an application wrapper,
such as tcpd, needs the TCP connection establishment to complete for
getting client IP from the socket. It's something like

	Client			Server
		----- SYN ---->
		<-- SYN/ACK ---
		----- ACK ---->
				Check for client IP =3D> forbiden
		<-- RST/ACK ---

When you portscan, you consider the port as opened as soon as you get
the SYN/ACK from server (half-open scan, e.g. nmap -sS) or see the
socket opened (connect scan, e.g. nmap -sT). Both theses two methods
will show port as open, even if wrapped.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

