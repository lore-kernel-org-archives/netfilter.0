From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: Prerouting question
Date: Tue, 06 Apr 2004 20:23:31 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1081275811.1737.31.camel@anduril.intranet.cartel-securite.net>
References: <000801c41c01$01e18b40$0464a8c0@stu>
	 <200404061916.39265.Antony@Soft-Solutions.co.uk>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200404061916.39265.Antony@Soft-Solutions.co.uk>
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
To: netfilter@lists.netfilter.org

Le mar 06/04/2004 =E0 20:16, Antony Stone a =E9crit :
> <Pedantic response>
> Because PREROUTING is a nat table, and nat tables are for Network Addre=
ss=20
> Translation.   FORWARD and INPUT are filter tables (the default if you =
don't=20
> specify in iptables rules), and that's where filtering operations such =
as=20
> DROP, REJECT, ACCEPT should be done.
> </Pedant>

Well, for nat table don't see all packets, only new ones, one could use
mangle table... But it's the same, mangle table is for mangling, not
filtering.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

