From: Cedric Blancher <blancher@cartel-securite.fr>
Subject: Re: IPChains
Date: Thu, 29 Apr 2004 20:07:29 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1083262049.1861.34.camel@anduril.intranet.cartel-securite.net>
References: <40913f1d.2b2.cb4.4237@cnc.bc.ca>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
In-Reply-To: <40913f1d.2b2.cb4.4237@cnc.bc.ca>
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
To: gagel@cnc.bc.ca
Cc: netfilter@lists.netfilter.org

Le jeu 29/04/2004 =E0 19:45, Kevin W. Gagel a =E9crit :
> Has all support been dropped for ipchains?

ipchains support has been dropped from 2.6 kernels.

> Is there a need to change from ipchains to iptables?

As it is not supported since 2.4, I would say yes.
Regarding Netfilter's functionnalities, opposed to ipchains ones, I
would say DE-FI-NI-TLY yes. Stateful filtering is a major improvement,
for both security and ease of ruleset writing (once understood), and NAT
capabilities are far behond what ipchains can do (all NAT forms
supported), not to mention all available matches and targets, mangle
stuff and existing extensions such as l7-filter.

So, imho, the question would be, is there any need to stay with ipchains
on new kernels ? Except lazyness of course :)


--=20
http://www.netexit.com/~sid/
PGP KeyID: 157E98EE FingerPrint: FA62226DA9E72FA8AECAA240008B480E157E98EE
>> Hi! I'm your friendly neighbourhood signature virus.
>> Copy me to your signature file and help me spread!

