From: "Thhoep" <thhoep@gmx.de>
Subject: Re: Iproute2 and fwmark usage
Date: Fri, 9 Jan 2004 17:50:41 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <001601c3d6d0$b8198e10$1684188d@Kiste>
References: <001401c3d63b$e9ebdff0$1684188d@Kiste> <20040109164718.GB24304@cannon.eng.us.uu.net> <001d01c3d6cc$191fc210$1684188d@Kiste> <20040109173530.GC24304@cannon.eng.us.uu.net>
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

> OK. You mean when doing MARK in mangle for ping a -> b, you see both
> ping and pong on ppp4 but the pongs get dropped somewhere between
> PREROUTING and FORWARD. When you remove the MARK from netfilter then
> all works fine??

nonono, the marking isnt the problem. but first:

for marking i use:
"iptables -t mangle -A PREROUTING -i eth4 -s 192.168.0.22 -d 141.24.12.2 -j
MARK --mark-with 1"

for selecting a routing table upon that marking i use:
"ip rule add fwmark 1 table test"

while table test has a local network route, a host route to the ppp peer and
a default route to the internet over the ppp peer as gateway.

the main table is the same but using another ppp interface.

all the other tables only differ only in the way out, but all include the
route to the one and only local net.


back to the problem:
the marking doesnt seem to be the problem. if i let the marking stay and
just remove the upon routing rule and replace it with:
"ip rule add from 192.168.0.22 table test"
then everything works absolutely fine. so i think its something with the
iproute trying to use the firewall mark what drops the packet, because it
seems to disappear while beeing routed.



