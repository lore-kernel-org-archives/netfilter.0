From: Binish A R <binishar@poornam.com>
Subject: iptables LOG options
Date: Tue, 24 May 2005 09:08:15 +0530
Message-ID: <4292A1A7.3020401@poornam.com>
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

Hello,

I am trying to write my custom firewall rules.
I want to drop all outgoing ssh for non root users and log any such attempts at the same time.
I want to log the username trying to do that. What option should I give?

The following won't definitely work.

iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root -j LOG --log-prefix "$USER NO SSH ALLOWED"

because the shell expands $USER variable immediately.

Is there any other option to find the value of owner that get matched by the below rule:


iptables -I OUTPUT -p tcp --dport 22  -m owner ! --uid-owner root


Any help is much appreciated.


Thanks and Regards,

Binish



