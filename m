From: "Jim Gifford" <maillist@jg555.com>
Subject: Quota
Date: Tue, 29 Oct 2002 21:33:50 -0800
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <006c01c27fd5$edc4e260$fb00a8c0@W2RZ8L4S02>
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

Is it possible to use the Quota option to put a quota on a specific IP
address?

I would assume it would look something like this

iptables -A INPUT -s (IP_ADDRESS) -m quota --quota (bytes) -j ACCEPT
iptables -A OUTPUT -d  (IP_ADDRESS) -m quota --quota (bytes) -j ACCEPT
iptables -A FORWARD -s  (IP_ADDRESS) -m quota --quota (bytes) -j ACCEPT
iptables -A FORWARD -d  (IP_ADDRESS) -m quota --quota (bytes) -j ACCEPT



