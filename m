From: "Luis Fernando Barrera" <luba@assist.com.gt>
Subject: iptables suddently stop working
Date: Wed, 6 Nov 2002 12:09:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <NABBIDJPNCAGKGOFGHBFKEGNPIAA.luba@assist.com.gt>
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

Hi all,

I have a strange behavior in my Red Hat 7.3 box using iptables...I allow
certain users to send ICMP packages across the firewall, using the FORWARD
chain and NAT table(with SNAT).

However sometimes the firewall stop routing the packets, but only certain
traffic. In my
case is the traffic accross the FORWARD chain.
Then... I just restart (flush) the iptables script and it works again.
I'm wondering whether there is some buffer which is getting full, so the
iptables code stop routing the packets?

Is there anything I should check? I use state-full connections in all the
rules.


Thanks in advance

Luis Fernando Barrera
luba@assist.com.gt



