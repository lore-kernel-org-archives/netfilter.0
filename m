From: "Jerry Kim" <netmask@independence.co.kr>
Subject: How to log dropped packet ?
Date: Wed, 16 Jul 2003 21:14:13 +0900
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <000701c34b93$c4da9180$96f2f8db@independence.co.kr>
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

Hi all.

I hope to know how to log dropped/accepted packets.
For example,

iptables -A INPUT -i eth0 -p tcp -d 10.10.10.1 --dport 22 -j ACCEPT

How can I log it ?
I don't understand how '-j LOG' target operate.

Help.



