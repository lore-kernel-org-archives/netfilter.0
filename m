From: "Jorge Agrelo" <jagrelo@novadevices.com>
Subject: Limit module accept negation?
Date: Mon, 10 Jan 2005 20:08:43 -0500
Message-ID: <41E2E0CB.18071.252B3E2C@localhost>
Reply-To: jagrelo@novadevices.com
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Description: Mail message body
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
To: netfilter@lists.netfilter.org

Can I replace this two rules

iptables -A INPUT -p tcp --syn -m limit --limit 1/s --limit-burst 4 -j ACCEPT
iptables -A INPUT -p tcp --syn -j DROP

For only this one? (Using negation)

iptables -A INPUT -p tcp --syn -m limit ! --limit 1/s --limit-burst 4 -j DROP

Thanks in advanced
**********************************
CTO: Eng. Jorge Agrelo O.
WEb: www.novadevices.com
E-Mail: jagrelo@novadevices.com
Phone: (593-2) 225-7711 ext. 105
Av. Brasil N45-08 y Condor, Quito Ecuador
**********************************
