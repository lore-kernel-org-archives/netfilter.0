From: "Jack Bauer" <mlsubscriber@gmail.com>
Subject: [libipq] owner of packet, possible patch
Date: Tue, 6 Mar 2007 16:39:46 +0100
Message-ID: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
DKIM-Signature: a=rsa-sha1; c=relaxed/relaxed; d=gmail.com; s=beta;
	h=domainkey-signature:received:received:message-id:date:from:to:subject:mime-version:content-type:content-transfer-encoding:content-disposition;
	b=BNfCADYmma35+7DyoaZYglBmhmXRVUbZQVOwQwqb9nWg4EVBJV1jBNqHXhRueEddRP1Qj0LRhYbj2gr2kjxi1PSaJDX9IFB0rUEiAO5h6HHpOi7bC80mi03cqgMR3y+5hHto+veH7agyFawOvnRwM0mzYUAvIKJR+9MqxYYs5kw=
Content-Disposition: inline
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

Hi,

I'm a student in computer science and for my master thesis i have to
handle packets in a userspace queue. Libipq works fine for me, except
one information which is missing: the owner of a (transmitted) packet.

With the following two additional lines, the problem seems to be solved:

in file
   include/linux/netfilter_ipv4/ip_queue.h
in
   typedef struct ipq_packet_msg_t
line 33 add:

        unsigned int uid;               /* uid of packet owner*/


in file
   net/ipv4/netfilter/ip_queue.c
line 249 add:

        pmsg->uid             = entry->skb->sk->sk_socket->file->f_uid;


Initial tests have been successful and are showing the correct uid in
ipq_packet_msg_t in userspace. Please tell me, what you think about
this modification.

Since I found some other people who are looking for the same
information, i wonder if there is a possibility to include the uid
field officially in the source of netfilter?!

Regards,
Jack

