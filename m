From: Bahamin Takhtaei <takhtaei@amnafzar.com>
Subject: Question about NFQUEUE
Date: Tue, 10 Jul 2007 11:01:13 +0330
Message-ID: <469335C1.5020808@amnafzar.com>
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

Hi everyone!
I add some rules to iptables such as:
"iptables -A INPUT -p icmp -j NFQUEUE"
and handle icmp packets by a program in userspace,
but I want that the packets come back to NFQUEUE later.
Please tell me what should I do?

Thank you,
Bahamin


