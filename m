From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Redirecting mail
Date: Fri, 8 Apr 2005 13:57:44 -0500
Message-ID: <004501c53c6c$d9e81f90$f5001eac@riverview.office>
References: <MS_LEU1tDJt12e1s8HA000007ef@smtp.ttp.nl>
	<001701c53c2f$6f97dc80$648045ac@sneak>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: Ilo Lorusso <sneak@ipnoc.co.za>, Rob Sterenborg <rob@sterenborg.info>
Cc: netfilter@lists.netfilter.org

> > iptables -t nat -A OUTPUT -p tcp --dports smtp \
> > -j DNAT --to-destination 192.168.12.56

You have an error in your IPTables syntax.

iptables -t nat -A OUTPUT -p tcp --dport smtp -j DNAT --to-destination
192.168.12.56



Grant. . . .


