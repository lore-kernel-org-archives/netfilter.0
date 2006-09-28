From: "Rajesh Mahajan" <rajeshmahajan09@gmail.com>
Subject: Multiport Module
Date: Thu, 28 Sep 2006 20:00:33 +0530
Message-ID: <c9961d450609280730l2176c0b5pdbf1c0c3efdf52f5@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-devel-bounces@lists.netfilter.org>
Content-Disposition: inline
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter-devel>
List-Post: <mailto:netfilter-devel@lists.netfilter.org>
List-Help: <mailto:netfilter-devel-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter-devel>, 
	<mailto:netfilter-devel-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-devel-bounces@lists.netfilter.org
Errors-To: netfilter-devel-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter <netfilter-devel@lists.netfilter.org>, netfilter@lists.netfilter.org

How can i use both source and destination ports in multiport module of
iptable 1.5

I m geting error when i apply a explample rule

iptables -D post-ids  -d 192.168.10.1 -p tcp -m multiport --sport
10002:10005 -m multiport--dport 50:80 -j QUEUE;
*** glibc detected *** double free or corruption (!prev): 0x08056148 ***
Aborted

Regards
Rajesh

