From: Nicholas Sherwood <nickzor@gmail.com>
Subject: nf_reinject(ing) and the lack of skbuff in ipq_read
Date: Mon, 6 Dec 2004 12:11:23 -0500
Message-ID: <5ce4d70b0412060911260a7819@mail.gmail.com>
Reply-To: Nicholas Sherwood <nickzor@gmail.com>
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

Ok so I need to capture some packets in userspace to mess with them,
particularly switch the order in which they are sent out. Ok I can
capture them in my program with libipq. Now I need to store them and
reinject them LATER. Here's the problem; when I capture them using
ipq_read and ipq_get_packet I get a buffer of type ipq_packet_msg.
This type looks like this:

----/usr/include/linux/netfilter_ipv4/ip_queue.h----

/* Messages sent from kernel */
typedef struct ipq_packet_msg {
       unsigned long packet_id;        /* ID of queued packet */
       unsigned long mark;             /* Netfilter mark value */
       long timestamp_sec;             /* Packet arrival time (seconds) */
       long timestamp_usec;            /* Packet arrvial time (+useconds) */
       unsigned int hook;              /* Netfilter hook we rode in on */
       char indev_name[IFNAMSIZ];      /* Name of incoming interface */
       char outdev_name[IFNAMSIZ];     /* Name of outgoing interface */
       unsigned short hw_protocol;     /* Hardw  Dec 3 2004, 10:43 AM
Average number of posts peare protocol (network order) */
       unsigned short hw_type;         /* Hardware type */
       unsigned char hw_addrlen;       /* Hardware address length */
       unsigned char hw_addr[8];       /* Hardware address */
       size_t data_len;                /* Length of packet data */
       unsigned char payload[0];       /* Optional packet data */
} ipq_packet_msg_t;


To reinject a packet, presumably by using the nf_reinject function
(see include/linux/netfilter.h) I require as inputs an sk_buff and an
nf_info, two structs usually associated with packets in the netfilter
context. But all I have is that ipq_packet_msg buffer which has the
packet and a few random tidbits of info.

Yes I've looked at Rusty's HOWTO on how to do everything in life and
then some, there just isn't very good documentation on queueing to
userspace, not to mention reinjecting packets back afterward. And once
again I do mean reinject, not just NF_ACCEPT something, I mean take it
out and put it back in.

I would really really appreciate anyone's input if they've done this
or if they know how to retrieve a packet's sk_buff/nf_info in
userspace, thanks!!!!!

-Nik

