From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Ports closed in spite of opening them?
Date: Fri, 02 Apr 2004 18:02:52 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080921772.1655.6.camel@anduril.intranet.cartel-securite.net>
References: <AD8D39C727CBD411BB2C0090273A727408F9F135@mortimer.law.uconn.edu>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <AD8D39C727CBD411BB2C0090273A727408F9F135@mortimer.law.uconn.edu>
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
To: "Hurley, Michael" <MHurley@law.uconn.edu>
Cc: "'netfilter@lists.netfilter.org'" <netfilter@lists.netfilter.org>

Le ven 02/04/2004 =E0 17:09, Hurley, Michael a =E9crit :
> Trying to write an iptables script to open ports 22, 25, 80, and 443 on=
 a
> little testing box. The problem is, when I scan for open ports, 25 and =
443
> report they are *closed*. Any idea what might be going on here?

If ports are reported /closed/ using a standard port scanner such as
nmap, then they sent back a RST to your initial SYN. That means your
firewall is OK to let packets go in and out for theses ports, but
there's no application listening on them... You should start your
daemons.

BTW, your ruleset just does the job, as packet/bytes couters shows.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

