From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: discard TCP SYN
Date: 06 Aug 2003 14:27:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1060172871.712.13.camel@elendil.intranet.cartel-securite.net>
References: <000001c35c0e$5ba651f0$c800a8c0@klintan.local>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <000001c35c0e$5ba651f0$c800a8c0@klintan.local>
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
To: Michael K <micke@klintan.se>
Cc: netfilter@lists.netfilter.org

Le mer 06/08/2003 =E0 13:32, Michael K a =E9crit :
> Then I use stateful inspection, accepting estabished,related.
> However, the nessus scanner is reporting this:
> -----
> The remote host does not discard TCP SYN packets which
> have the FIN flag set.

SYN/FIN packets are valid according to RFC793. RFC specify that if RST
and ACK are not set, and SYN is set, packet must get treated as opening
a connection without examining other flags.

> Depending on the kind of firewall you are using, an
> attacker may use this flaw to bypass its rules.

Some people say that some firewalls may accept this kind of packets
through closed ports. That is not Netfilter's behaviour.

> Should I be worried?=20

Not with Netfilter.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

