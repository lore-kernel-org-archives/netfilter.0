From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Re-2: connection to vpn Server (pptp) behind iptables FW
Date: Fri, 12 Mar 2004 13:01:36 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1079092896.2722.17.camel@anduril.intranet.cartel-securite.net>
References: <DIIE.000000F200002A31@sbgit.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <DIIE.000000F200002A31@sbgit.com>
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
To: peter.gehle@sbgit.com
Cc: netfilter@lists.netfilter.org

Le ven 12/03/2004 =E0 11:34, peter.gehle@sbgit.com a =E9crit : =20
> > Micro$oft has a 'technote' on this in their technet section on the
> > website. AFAIR you need to allow protocol 37 to be forwarded between =
the
> > two.
> I have added a rule that forwards the protocol 37, but it still not wor=
ks?

PPTP relies on a slightly modified GRE tunnel, which protocol _47_, not
37.

cbr@anduril:~$ grep gre /etc/protocols
gre     47      GRE             # General Routing Encapsulation

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

