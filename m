From: Oleg Savostyanov <savostyanov@internetplustravel.ru>
Subject: iptables: Invalid argument with PPTP conntrack enabled
Date: Mon, 8 Dec 2003 17:44:06 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <57370162285.20031208174406@internetplustravel.ru>
Reply-To: Oleg Savostyanov <savostyanov@internetplustravel.ru>
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
To: netfilter@lists.netfilter.org

Hello,

Iam trying to build the system, capable of making NAT for pptp
connections
Debian 3, Kernel 2.4.22(with debian patches) patch-o-matic 20030912

I found that if I apply PPTP patch to my kernel and compile it with
GRE protocol support and
PPTP protocol support
the simple command
iptables -t nat -A POSTROUTING -o eih0 -j SNAT --to-source $myIP
failed to execute
with the following:  iptables: Invalid argument

May be it's a bug in a patch-o-matic PPTP patch?
Is there anybody, who succeeded building the system capable of
masquariding more than one PPTP connection to one server
outside your lan?


On Wed, Nov 19, 2003 at 01:48:07AM +0300, Oleg Savostyanov wrote:
> Hello , Harald
> I tryed to install extra package, written by you -
> pptp-conntrack-nat
> but failed to do this.
please report such problems to netfilter@lists.gnumonks.org, or
netfilter-devel@lists.gnumonks.org (like documented on
http://www.netfilter.org/contact.html).
also, which version of patch-o-matic were you using?
> Do you have any ideas what to do?
Martin Josefsson is the patch-o-matic maintainer, maybe he can help you.



Oleg                          mailto:savostyanov@internetplustravel.ru


