From: Park Sangsu <sangsu@gmail.com>
Subject: Problem with forwarding network packet (help me)
Date: Mon, 14 Feb 2005 13:19:47 +0900
Message-ID: <9f37d7da050213201963c5fcc0@mail.gmail.com>
Reply-To: Park Sangsu <sangsu@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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

I want to forward network packet to other computer.

First, explain my way.
I captured network packet in NF_IP_PRE_ROUTING (in netfilter hook).
And I changed its destination address, returned NF_ACCEPT. But it
doesn't work well.

Despite of my poor English, thanks for your patient..^^
Plz help me~~

