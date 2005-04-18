From: Filipe Abrantes <fla@inescporto.pt>
Subject: UDP nat question
Date: Mon, 18 Apr 2005 15:26:42 +0100
Message-ID: <4263C3A2.70006@inescporto.pt>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Hi all,

I have a basic question about iptables UDP NAT.

Imagine that you have 2 UDP sessions in your private LAN using the same 
port. How does iptables nat these connections? One of the sessions will 
get one external port of the NAT machine and the other session will get 
another one? Does the usual MASQUERADE command suffice to achieve this?

iptables MASQUERADE command:

$IPTABLES -t nat -A POSTROUTING -o $OUTBOUND_IFACE -j MASQUERADE

Hope I have made myself clear and,

Thanks for your attention

Filipe Abrantes

-- 
Filipe Lameiro Abrantes
INESC Porto
Campus da FEUP
Rua Dr. Roberto Frias, 378
4200-465 Porto
Portugal

Phone: +351 22 209 4266
E-mail: fla@inescporto.pt

