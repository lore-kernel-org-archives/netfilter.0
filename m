From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: BANDWIDTH MANAGEMENT
Date: 29 Jul 2003 12:36:50 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059475009.844.11.camel@elendil.intranet.cartel-securite.net>
References: <3F2647E5.8000206@libero.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <3F2647E5.8000206@libero.it>
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
To: Giulius <blizzards@libero.it>
Cc: netfilter@lists.netfilter.org

Le mar 29/07/2003 =E0 12:09, Giulius a =E9crit :
> I need to find a method to limit my bandwidth, and i would like to know=
=20
> if exist a module with netfilter that do this.

Netfilter is a packet filter, so it is not the appropriate tool to
enforce bandwidth limitation. You should have a look at iproute2 package
that contains tc (Traffic Control).

Read Linux Advanced Routing and Traffic Control HOWTO at :

	http://lartc.org/

You will find a quite complete documentation for bandwidth limitation.
You can also download cbq.init or htb.init scripts that can make things
a lot easier (scripts are self documented, just edit them) :

	https://sourceforge.net/projects/cbqinit/
	https://sourceforge.net/projects/htbinit/


My 0.02=A4...

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

