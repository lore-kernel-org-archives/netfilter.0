From: "security" <security@lea-linux.com>
Subject: list delete bug: kernel crash
Date: Tue, 31 Aug 2004 01:34:22 +0200
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <003701c48ee9$e1ad1f40$0a00a8c0@aziz>
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
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hi all,

I hope i mail in the right mailing list.


Sometime my kernel crash (i must reset my computer) and i have this logs:

Aug 30 20:42:24 gateway kernel: NF_IP_ASSERT:
net/ipv4/netfilter/ip_conntrack_core.c:1115(ip_conntrack_alter_reply)
Aug 30 20:42:24 gateway kernel: NF_IP_ASSERT:
net/ipv4/netfilter/ip_conntrack_core.c:1115(ip_conntrack_alter_reply)
Aug 30 20:44:24 gateway kernel: LIST_DELETE:
net/ipv4/netfilter/ip_conntrack_core.c:300
`&ct->tuplehash[IP_CT_DIR_REPLY]'(f3cedca4) not in
 &ip_conntrack_hash[hr].

I have search in bugzilla and google and, apparently, this bug has been solve
since kernel 2.6.5.
But i have kernel 2.6.8.1 and i have try kernel 2.6.6 and 2.6.7: same crash

But it hard to "see" because i can stay 1 week without crash, or 5mn.

I have the "local NAT" activated.

I have made a bugzilla report:
https://bugzilla.netfilter.org/bugzilla/show_bug.cgi?id=236

If you need more informations, want me to made debug trace etc... i can, just
ask me and tell me how do that :)

Thanks.




