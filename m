From: Mohammad Farooq <mohammadfarooq@tango-networks.com>
Subject: How to find out packet latency?
Date: Mon, 09 Oct 2006 09:51:20 -0500
Message-ID: <1160405480.28977.201.camel@mfarooq-1.tango-networks.com>
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

Hi all,

I am using linux box as router. Every ip packet which enters the box is
forwarded to some ip address. I have iptables rules which performs this
task. My question is how can I find out the duration ip packet took to
go out of the box. Basically I need time difference when the packet
entered the box and the time it left the box. I want to monitor the
latency. If it crosses some threshold value, I may have to notify. Since
the packets are switched at the kernel level, I am not sure how to get
this information. I would appreciate if someone can point me to the
right direction. Thanks in advance.

MF 


