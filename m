From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: DNAT and promiscuous mode
Date: Mon, 26 Apr 2004 19:43:55 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083001435.1795.8.camel@anduril.intranet.cartel-securite.net>
References: <408D40DC.2010201@ida.net>
	 <1083000628.1795.4.camel@anduril.intranet.cartel-securite.net>
	 <408D4875.2030407@ida.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <408D4875.2030407@ida.net>
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
To: Travis Johnson <tlj@ida.net>
Cc: netfilter@lists.netfilter.org

Le lun 26/04/2004 =E0 19:35, Travis Johnson a =E9crit :
> The traffic would not be destined to that MAC address, it would simply
> be going past this machine.

Do you mean this machine is bridge ?

> I am looking to re-direct my customers that are past due to a
> different web page.

Then transparent proxying is what you need and do not require
promiscuous mode.


PS : you should reply to the list (at least Cc)

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

