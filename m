From: "Jens =?iso-8859-15?q?Lechtenb=F6rger?=" <lechten@wi.uni-muenster.de>
Subject: NEW vs INVALID
Date: 30 Sep 2002 12:18:26 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <m2elbb4w7h.fsf@pcwi1068.uni-muenster.de>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi there,

using stateful packet matching I wonder how an INVALID tcp packet is
defined.  In particular, I set up a rule to log inbound NEW ssh
connections to port 22:
iptables -A INPUT  -m state --state NEW -p TCP --dport 22 -j LOG --log-level 5 --log-prefix "IPTABLES: Legal NEW TCP: "

What confuses me, is that this rule not only logs initial SYN
packets but also (initial) packets with SYN and FIN set. 
I thought that such packets should be INVALID...
Is this a bug or a feature?

Jens


