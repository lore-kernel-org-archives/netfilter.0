From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Sun, 11 Jan 2004 21:57:13 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000d01c3d885$8181e710$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net> <001601c3d6d0$b8198e10$1684188d@Kiste> <20040109194247.GD24304@cannon.eng.us.uu.net> <001101c3d6e3$cdf03e60$1684188d@Kiste> <20040109204745.GE24304@cannon.eng.us.uu.net> <004101c3d6ec$7801b6b0$1684188d@Kiste> <20040109212241.GF24304@cannon.eng.us.uu.net> <006501c3d6f7$d96ecf90$1684188d@Kiste> <001501c3d6fc$3a889c80$1684188d@Kiste>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: Ramin Dousti <ramin@cannon.eng.us.uu.net>
Cc: netfilter@lists.netfilter.org

in my opinion something is completely wrong with my 2.4.23 kernel. i just
used another server of mine to reproduce the same situation. for this
purpose i compiled a completely new 2.4.23 kernel with advanced routing and
netfilter and whatever support and installed fresh versions of the iptables
and iproute2 package with the debian system (using 'stable'). because the
host only has 1 ethernet interface i used a ppp-over-ssh tunnel to simulate
routing behaviour.

in just plain routing mode everything was fine, packets has been routed from
the lan through the ppp tunnel and back.

then i added a firewall rule
"iptables -t nat -A POSTROUTING -o ppp0 -j MASQUERADE"

is anything wrong with it??

well do make it short: it changed nothing. packets still get un-masqueraded
out of ppp0 with local lan ips. i really dont understand that. kernel new,
iptables new, iproute new. no modules, all network stuff statically built
in. and its the 2nd server which shows strange behaviour with this
configuration. cant believe its a problem with me.

i'm just downloading the 2.4.24 kernelsource and will try with that kernel.




