From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: -m tcp
Date: Thu, 25 Mar 2004 09:46:04 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1080204363.1921.1.camel@anduril.intranet.cartel-securite.net>
References: <017e01c411cd$c358a170$0300a8c0@max2>
	 <20040324183937.GB20010@jesus.seclab.jp>
	 <019301c411cf$94dbc5f0$0300a8c0@max2>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <019301c411cf$94dbc5f0$0300a8c0@max2>
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
To: "j.travis" <skynet@psinode.com>
Cc: netfilter@lists.netfilter.org

Le mer 24/03/2004 =E0 19:41, j.travis a =E9crit :
> -Then why might one be inclined to use the '-m tcp' in a situation like
> this?  Clarity?

One does not need it. Once you've specified -p tcp, iptables deduce
automagically you're working with tcp match and then loads it.

> -Under what circumstances might '-m tcp' give added value?

None.

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

