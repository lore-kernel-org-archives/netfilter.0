From: Akshay Kawale <linux781@gmail.com>
Subject: How can I add data to a packet before sending it?
Date: Sat, 2 Apr 2005 21:03:19 -0500
Message-ID: <72252ed0504021803e5b298@mail.gmail.com>
Reply-To: Akshay Kawale <linux781@gmail.com>
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

Hi,

I am trying to add data to a packet by expanding the tailroom using
skb_copy_expand()

I am using the following statements:
*skb = skb_copy_expand(*skb, 0, 256, GFP_ATOMIC);

I am calling this in the NF_IP_LOCAL_OUT hook, and does not give any
errors if I drop the packet in the NF_IP_POST_ROUTING hook.

However if I don't drop the packet, I get a kernel panic.

I am running Fedora Core 1.
Please let me know how I can achieve this.

Thanks.

- Akshay

