From: Sorin Panca <sorin.panca@gmail.com>
Subject: The CLASSIFY target
Date: Fri, 07 Oct 2005 18:23:20 +0300
Message-ID: <434692E8.40008@gmail.com>
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
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi!
I have the next rule in my script:
iptables -t mangle -A FORWARD -i $EXT -o $INT -m mark --mark 2 -j
CLASSIFY --set-class 1:A
should i poit it to one of the htb subclasses or to the leaf qdisc?
iptables -t mangle -A FORWARD -i $EXT -o $INT -m mark --mark 2 -j
CLASSIFY --set-class A:
Can someone help me please?

