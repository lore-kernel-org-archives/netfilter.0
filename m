From: xchris <lyra@fastwebnet.it>
Subject: Re: VPN Issue - help
Date: Wed, 7 May 2003 11:23:09 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200305071123.09804.lyra@fastwebnet.it>
References: <006c01c31357$a1565ce0$6400a8c0@homes> <001001c313cd$662b19f0$6400a8c0@homes> <200305070937.29059.lyra@fastwebnet.it>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <200305070937.29059.lyra@fastwebnet.it>
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

On Wednesday 07 May 2003 09:37, xchris wrote:
> On Tuesday 06 May 2003 14:45, Voltaire Pascual wrote:
> > Hi Chris,
> >
> > Here's my configuration:
>
> CUT
>
>
> OK.
> Now it's more clear.
>
> Stupid question...
> did yoy try disabling firewall and enabling ip_forward?
>
> you should have all chains with policy ACCEPT and ip_forward to 1.
>
> If it goes... your problem is related to your firewall scripts,otherwis=
e
> it's a iptables problem.

ahem.. i mean..
if it goes your problem is your firewall otherwise your pptpd config.
sorry
xchris



