From: "Frederic gilloteau" <fgilloteau@rightvision.com>
Subject: SNAT with ipchains in VPN configuration
Date: Fri, 21 Mar 2003 16:47:18 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NHBBIDPDOLGKNAAECDCCAEEACAAA.fgilloteau@rightvision.com>
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

Could someone help me in this case ?

I have two private networks : 172.20. and 192.168.
I have linked them with a VPN.
I have read that it is possible to write a rule with iptables which does
SNAT on VPN gateway to let it enter itself on the tunnel... (in a VPN config
: gateway - gateway)

Example : iptables -t nat -D POSTROUTING -s 20.0.0.1 -o ipsec0 -d
"client192.168" -j SNAT --to 172.20.xxx.xxx

... with 20.0.0.1 the external interface of 172.20 network and
172.20.xxx.xxx a free ip adress in the 172.20 network.

MY QUESTION IS : Is it possible to write a similar rule with IPCHAINS ???

Thanks in advance.


