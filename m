From: yunus <yunus@neduet.edu.pk>
Subject: ipfilter on satellite receive only PC
Date: Sat, 26 Jun 2004 12:41:47 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <40DD28BA.82DEE8DA@neduet.edu.pk>
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

Dear netfilter gurus,

I am new to iptables. The computer on which I want to use iptables is a
Redhat linux 7.3 with satellite pentanet card. I want to filter the
traffice forwarded to our LAN. When I use iptables -P Forward DROP and
iptables -A INPUT -m state --state RELATED, ESTABLISHED -j ACCEPT
iptables -A Forward -m state --state RELATED, ESTABLISHED -j ACCEPT

It still does not allow me to browse from the LAN. Outgoing is through
router serial port.

Much oblige for all your help.

Regards.



