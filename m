From: Arvanitis Kostas <arvanit@ellemedia.com>
Subject: Multiple instances of match extensions
Date: Mon, 23 Jun 2003 14:49:09 +0300
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200306231449.09703.arvanit@ellemedia.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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

Is it possible to specify more than one instance of a match extension for a 
given rule? The code seems to accept this, but when I try giving two TCP 
match options using iptables, it exits with an unclear error:
root@home# iptables -t nat -A POSTROUTING --source 10.0.0.0/8 -mtcp 
--destination-port 8080 --syn -mtcp --destination-port 80 -j MASQUERADE

iptables v1.2.7a: Unknown arg `80'

I know that my example can be accomplished using multiport, but it is just 
used to clarify my question, which is: Can more than one instance of a match 
extension exist for a single rule? Even if not, is this something possible in 
a future version of iptables?

I am trying to build a MIB and a NET-SNMP module for iptables and I have to be 
sure of that, to avoid unneccessary work now or complications in the future.

-- 
A: No. See http://www.netmeister.org/news/learn2quote.html
Q: Should I include quotations after my reply ?


