From: SBlaze <dagent.geo@yahoo.com>
Subject: Rate my rules. Take a look ICMP only
Date: Fri, 7 Feb 2003 15:11:05 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030207231105.50898.qmail@web40201.mail.yahoo.com>
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

Recently I created what I think are some pretty decent ICMP rules to allow me
to trace and ping outside of my network but not allow the same kind of
activities in...I think I did a pretty good job after reading the tutorial

You guys be the judge and let me know if there was better way for this to be
done.

iptables -A INPUT -p ICMP -i eth0 -m state --state NEW  -j DROP
iptables -A INPUT -p ICMP -i eth0 -m state --state ESTABLISHED,RELATED -j
ACCEPT
iptables -A OUTPUT -p ICMP -o eth0 -m state --state NEW,ESTABLISHED,RELATED -j
ACCEPT


=====
"No touchy NO TOUCHY! Emperor Kuzko -=Emperor's New Groove=-"

__________________________________________________
Do you Yahoo!?
Yahoo! Mail Plus - Powerful. Affordable. Sign up now.
http://mailplus.yahoo.com

