From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: what filtering to do on the OUTPUT chain?
Date: 23 Oct 2002 12:24:10 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1035368650.8853.33.camel@elendil>
References: <Pine.LNX.4.44.0210221605170.15445-100000@localhost.localdomain>
	<1035328874.10494.38.camel@elendil> 
	<200210230943.g9N9hiL02304@vulcan.rissington.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200210230943.g9N9hiL02304@vulcan.rissington.net>
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
To: Antony Stone <Antony@Soft-Solutions.co.uk>
Cc: netfilter mailing list <netfilter@lists.netfilter.org>

Le mer 23/10/2002 =E0 11:43, Antony Stone a =E9crit :
> The OUTPUT rules are always going to allow traffic to or from expected
> ports. 53 is a good one to guess is going to be made accessible, so
> you simply set up netcat to contact your external system on port 53,
> and you can still do what you've outlined above even with pretty good
> OUTPUT filters in place.

Yes you can. Even if you're facing a rule like=20

	iptables -A OUTPUT -p udp -d $IN_DNS --dport 53 -j ACCEPT

You can use DNS tunnel stuff. But it makes things more difficult. And it
is just the point of security tools.

> If you're concerned about this level of security (which you should be) =
then=20
> you need to deal with Operating System security and things like Host=20
> Intrustion Detection - netfilter is not going to do the job effectively=
 for=20
> you.

Yeah sure, but it's an active part of the overall stuff, and, as such,
must be completly configured.

If I begin to admit the fact that because one tool does not all the job
for me, I can let it unconfigured, well, I do not see the point of
filtering INPUT with Netfilter ? My closed ports are closed, and open
ones can be wrapped, so what's the point adding packet filtering for
local applications that can provide address based access control through
tcpd or internal wrappers ? No tool can provide full security alone.
Each one is one brick of the wall. If bricks are missing, you wall is
shacky.

My point of vue is that you should use every security mecanism available
to enforce your security policy. You can say that it is too much work,
too much time or too much money to do ; I understand this kind of
reason. But doing nothing because what you can implement can be evaded
is not a valuable reason, imho. If you extend this, you would not set
security at all, as every security tool can be evaded.

--=20
C=E9dric Blancher  <blancher@cartel-securite.fr>
IT systems and networks security expert  - Cartel S=E9curit=E9
Phone : +33 (0)1 44 06 97 87 - Fax: +33 (0)1 44 06 97 99
PGP KeyID:157E98EE  FingerPrint:FA62226DA9E72FA8AECAA240008B480E157E98EE

