From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: TARPIT target
Date: Fri, 26 Sep 2003 23:32:27 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1064611946.812.36.camel@elendil.intranet.cartel-securite.net>
References: <7A3B4AA360FDEF448F3390421FC8D731F41374@coxhpexg.coxhp.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <7A3B4AA360FDEF448F3390421FC8D731F41374@coxhpexg.coxhp.com>
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
To: bmcdowell@coxhealthplans.com
Cc: netfilter@lists.netfilter.org

Le ven 26/09/2003 =E0 22:45, bmcdowell@coxhealthplans.com a =E9crit :
> How do I use the TARPIT target?
> I have iptables 1.2.8 installed and working otherwise.  I'm running Red=
Hat 9.
> When I try and use
> 	'iptables -A FORWARD -j TARPIT'
> I get
> 	'iptables: No chain/target/match by that name'

Your kernel does not support TARPIT.

> I have rebuilt the kernel, but I do not see an option for 'TARPIT'
> anywhere in the netfilter stuff.  Yes, I do have 'experimental' turned
> on.  I have also deleted iptables completely and used only the source
> to install it.

TARPIT target is in patch-o-matic (extra section). So you have to
download and install it.

	1. install patch-o-matic (see README)
	2. rebuild your kernel from sources that got patched
	3. build iptables

And it should work.

Not that TARPIT only applies to TCP connections. So your previously
given command won't work :

	cbr@elendil:~$ sudo iptables -A FORWARD -j TARPIT
	iptables: Invalid argument

You have to specify TCP matching :

	cbr@elendil:~$ sudo iptables -A FORWARD -p tcp -j TARPIT
	cbr@elendil:~$ sudo iptables -L FORWARD
	Chain FORWARD (policy ACCEPT)
	target     prot opt source               destination
	TARPIT     tcp  --  anywhere             anywhere

--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE

