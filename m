From: "Eric Leblond" <eric@inl.fr>
Subject: Re: [libipq] owner of packet, possible patch
Date: Wed, 7 Mar 2007 14:56:25 +0100 (CET)
Message-ID: <54539.192.168.33.2.1173275785.squirrel@mail.inl.fr>
References: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <619420780703060739k18ec820dnc8f681b8fc517825@mail.gmail.com>
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
To: Jack Bauer <mlsubscriber@gmail.com>
Cc: netfilter@lists.netfilter.org

> Hi,
>
> I'm a student in computer science and for my master thesis i have to
> handle packets in a userspace queue. Libipq works fine for me, except
> one information which is missing: the owner of a (transmitted) packet.

You may fine some interest in

http://people.mandriva.com/~sbellabes/cn_net/

It implements a new approach of local firewalling.

BR,
--
Regit

>
> With the following two additional lines, the problem seems to be solved:
>
> in file
>    include/linux/netfilter_ipv4/ip_queue.h
> in
>    typedef struct ipq_packet_msg_t
> line 33 add:
>
>         unsigned int uid;               /* uid of packet owner*/
>
>
> in file
>    net/ipv4/netfilter/ip_queue.c
> line 249 add:
>
>         pmsg->uid             = entry->skb->sk->sk_socket->file->f_uid;
>
>
> Initial tests have been successful and are showing the correct uid in
> ipq_packet_msg_t in userspace. Please tell me, what you think about
> this modification.
>
> Since I found some other people who are looking for the same
> information, i wonder if there is a possibility to include the uid
> field officially in the source of netfilter?!
>
> Regards,
> Jack
>
>



