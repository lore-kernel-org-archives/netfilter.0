From: "Eric Soneson" <esoneson@lantronix.com>
Subject: Can't get libipq program to forward packets.
Date: Mon, 5 Jun 2006 13:42:01 -0700
Message-ID: <2F0FC2A92C0B154BB406D5E74CB3E69302B7CEA0@3putt.int.lantronix.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Class: urn:content-classes:message
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

I appologize if this is the wrong forum.  If it is wrong, please give me
a pointer to the right one.
=20
I am using iptables to direct all traffic to my libipq program
I have tried all each of these iptables calls:
=20
iptables -t nat -A PREROUTING -i eth0 -j QUEUE
iptables -t mangle -A PREROUTING -i eth0 -j QUEUE
iptables -t nat -A INPUT -i eth0 -j QUEUE
iptables -t mangle -A INPUT -i eth0 -j QUEUE
=20
I look at all tcp traffic and let all others go through unchanged.
In my libipq program I test the source ip address.  If it is my client
ip address,
I change the destination IP address to a different server IP address,
change the source IP address
to my ip address, recalculate the checksum.  I then copy the payload to
a new buffer and
call ipq_set_verdict using the pointer to the new buffer and length.
=20
My expectation is that the packet will be sent back out on the wire with
the new header in place.
But nothing happens.  It goes into a black hole.
=20
Any ideas?
=20
Thanks.
=20
Eric
**********************************************************************
This e-mail is the property of Lantronix. It is intended only for the =
person or entity to which it is addressed and may contain information =
that is privileged, confidential, or otherwise protected from =
disclosure. Distribution or copying of this e-mail, or the information =
contained herein, to anyone other than the intended recipient is =
prohibited.


