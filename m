From: Pascal Hambourg <pascal.mail@plouf.fr.eu.org>
Subject: Re: Bridge Transparent Proxy
Date: Tue, 22 May 2007 18:06:12 +0200
Message-ID: <465314F4.1060007@plouf.fr.eu.org>
References: <C2785BE6.1C244%robert@leblancnet.us>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <C2785BE6.1C244%robert@leblancnet.us>
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
Content-Type: text/plain; charset="iso-8859-1"; format="flowed"
To: netfilter@lists.netfilter.org

Hello,

Robert LeBlanc a =E9crit :
> You will need to look at ebtables. Bridging will bypass iptables.

Bridged IPv4 packets traverse the iptables chains if the kernel was=20
compiled with Netfilter bridge support (CONFIG_BRIDGE_NETFILTER=3Dy). It=20
allows finer filtering than ebtables, for instance accepting only=20
outgoing HTTP/HTTPS connections and related ICMP messages in both=20
directions thanks to connection tracking, e.g. :

iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m physdev --physdev-in eth1 -m state --state NEW \
   -p tcp -m multiport --dports 80,443 -j ACCEPT

