From: Linux Query <linux_query@yahoo.com>
Subject: limiting outgoing connections
Date: Mon, 21 Mar 2005 22:19:12 -0800 (PST)
Message-ID: <20050322061913.21052.qmail@web30801.mail.mud.yahoo.com>
Mime-Version: 1.0
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


Hi All!

I want to limit each clients outgoing connections.
Will the following be ok ?

iptables -A FORWARD -i $internal_interface -s $ip -m
limit --limit 10/s -j ACCEPT
iptables -A FORWARD  -i $internal_interface -s $ip -j
DROP

What is a good limit figure ?

regards to all,
jim


 

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

