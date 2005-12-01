From: Frank.Mayer@knapp-systems.com
Subject: ipsets for both source and target in one iptables-rule?
Date: Thu, 1 Dec 2005 15:02:25 +0100
Message-ID: <OF6D4A24FC.BD8BFC33-ONC12570CA.004AA26A-C12570CA.004D205F@knapp.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello,

I'd like to use two ipsets in a single iptables rule similar to

iptables -A FORWARD -p tcp -m tcp --dport ssh -m set --set clients src -m 
set --set servers dst  -m state --state NEW,ESTABLISHED -j ACCEPT
iptables -A FORWARD -p tcp -m tcp --sport ssh -m set --set servers src -m 
set --set clients dst -m state --state ESTABLISHED -j ACCEPT

Can anyone tell me if that's just a syntax error or if this is entirely 
impossible?
(Kernel 2.4.32, iptables 1.3.4, ipset 2.2.7)

Thanks in Advance,
Frank Mayer
UNIX Systemadministration
----------------------------------------------------
KNAPP Systemintegration GmbH
Waltenbachstrasse 9
8700 Leoben, Austria
----------------------------------------------------
Phone: +43 3842 805-921
Fax: +43 3842 82930-921
frank.mayer@knapp-systems.com
www.knapp.com

