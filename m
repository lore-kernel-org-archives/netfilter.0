From: xchris <lyra@fastwebnet.it>
Subject: Re: VPN Issue - help
Date: Wed, 7 May 2003 09:37:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305070937.29059.lyra@fastwebnet.it>
References: <006c01c31357$a1565ce0$6400a8c0@homes> <200305061135.30694.lyra@fastwebnet.it> <001001c313cd$662b19f0$6400a8c0@homes>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <001001c313cd$662b19f0$6400a8c0@homes>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org
Cc: Voltaire Pascual <voltaire@voltaire.servebeer.com>

On Tuesday 06 May 2003 14:45, Voltaire Pascual wrote:

> Hi Chris,
>
> Here's my configuration:
>
CUT


OK.
Now it's more clear.

Stupid question...
did yoy try disabling firewall and enabling ip_forward?

you should have all chains with policy ACCEPT and ip_forward to 1.

If it goes... your problem is related to your firewall scripts,otherwise =
it's=20
a iptables problem.

More stupid question (just to be sure)

I guess this box is the default gateway for your lan. right?
(you reach the internet natted by this box)


To be honest i always prefer to give vpn remote client different IP...
(for example.. 192.168.1.x) to be more clear... but this is not the probl=
em!

Let me know.
bye
xchris

