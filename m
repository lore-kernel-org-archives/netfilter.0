From: aksingh@hss.hns.com
Subject: Re: ip_queue.o and libipq
Date: Wed, 26 May 2004 13:37:02 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <OF2CBA4952.3993EE2F-ON65256EA0.002BCFD2@hss.hns.com>
Mime-Version: 1.0
Content-Type: multipart/mixed; 
	Boundary="0__=EABBE433DFB849428f9e8a93df938690918cEABBE433DFB84942"
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
To: Sven Schuster <schuster.sven@gmx.de>
Cc: netfilter@lists.netfilter.org


--0__=EABBE433DFB849428f9e8a93df938690918cEABBE433DFB84942
Content-type: text/plain; charset=US-ASCII





Hi Sven,

  Yes even i saw netlink_unicast is called for the packet after building
the packet, but in this case what if the socket receive buffer is full. are
the packets which cannot be written onto the netlink socket receive buffer,
because the buffer is full kept in the ip_queue's queue or are they
discarded, and if they are discarded what is the significance of
ip_queue_maxlen field ? (/proc/sys/net/ipv4/ip_queue_maxlen) ?


Amit




Sven Schuster <schuster.sven@gmx.de> on 05/26/2004 01:07:47 PM

To:    Amit Kumar Singh/HSS@HSS
cc:    netfilter@lists.netfilter.org

Subject:    Re: ip_queue.o and libipq



Hi Amit,

On Wed, May 26, 2004 at 10:45:23AM +0530, aksingh@hss.hns.com told us:
>
> Hi,
>
>    Does anybody have an idea which function of ip_queue.c is invoked when
> a userland process does a ipq_read ?

ipqueue works via netlink. When a packet is queued ipq_enqueue_packet
is called with the skb as one of its arguments. This function then
prepares the netlink packet and sends it to userspace via
netlink_unicast. netlink_unicast itself will enqueue the netlink packet
on the socket receive queue of the socket (see net/netlink/af_netlink.c::
netlink_sendskb which is called from netlink_unicast). When userspace
(ipq_read) reads from the netlink socket, when there's data on this
socket receive queue the first packet will be dequeued and returned to
userspace.

(I hope this explanation is understandable, I'm still in the learning
process with regard to how the kernel works, so should I be wrong
anybody please correct me :)

> Also, once a NF_QUEUE is returned by a netfilter hook and till the packet
> is copied to userland by ipq_read how many copies are involved ?.
>
> I believe there is just one copy when the packet is copied from sk_buff
in
> the queue maintained by ip_queue is copied to the buffer supplied by
> ipq_read ? or are there more involved ?
>
> also --- is netfilter server down ? havent received any mails since the
> last two days, there seems to be no problem at my mail server ?

Seems like it's down, I didn't receive mails since may 23rd...
>
> thanks
> Amit
>
> "DISCLAIMER: This message is proprietary to Hughes Software Systems
Limited

Do you think such a disclaimer makes sense when posting to a
mailing list??


Sven

--
Linux zion 2.6.6-tcp #4 Thu May 13 20:39:05 CEST 2004 i686 athlon i386
GNU/Linux
  09:27:29  up 12 days, 11:30,  1 user,  load average: 0.10, 0.03, 0.01


--0__=EABBE433DFB849428f9e8a93df938690918cEABBE433DFB84942
Content-type: application/octet-stream; 
	name="C.DTF"
Content-Disposition: attachment; filename="C.DTF"
Content-transfer-encoding: base64

LS0tLS1CRUdJTiBQR1AgU0lHTkFUVVJFLS0tLS0NClZlcnNpb246IEdudVBHIHYxLjIuMSAoR05V
L0xpbnV4KQ0KDQppRDhEQlFGQXRFbExvNEZBZEIyUG5lUVJBdllYQUo5b0xNUjJVTTNCaFZteTkw
UXZ5SHZ0Ull2OEVBQ2NESVRwDQpISngzYm9LZ25UeGUrNWN5bGdsSXFXbz0NCj1JQ1FZDQotLS0t
LUVORCBQR1AgU0lHTkFUVVJFLS0tLS0NCg0K

--0__=EABBE433DFB849428f9e8a93df938690918cEABBE433DFB84942--


