From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: 2 ISPs again
Date: Fri, 10 Dec 2004 11:28:03 -0800
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E3A4@alderaan.smgtec.com>
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
To: Andreas Grabner <andi@vnc.at>
Cc: netfilter@lists.netfilter.org

Andreas Grabner wrote:
> Thanks a lot for your reply!!!
>=20
>> If your own IP's on the firewall aren't bound to the network, you'll
> What does                                 ^^^^^^^^^^^^^^^^^^^^^ this
> mean?=20

Think about in the terms of promisc vs. non-promisc modes in tcpdump.

If the kernel doesn't know what IP addresses to properly receive data
on, the kernel will either let everything in or silently throw them
away. RP_filter is the mechanism used to protect routing integrity.
Since there is no IP, or an incorrect IP associated with the incoming
packet, it gets tossed. If you turn off the rp_filter, you're saying
that you want to receive all data incoming to the interface even if it
shouldn't be there.

EG:=20

INET - eth1 - FW - eth0 -INTERNAL (192.168.1.0/24)

If you receive an inbound connection request from the internet from the
source address 192.168.1.2, the rp_filter will drop the packet flat.
There may be issues with having your two internet interfaces. Maybe
they're expecting traffic on one another. =20

Question:

1. Are either inbound connections working, or do they both die?=20
2. Do you see your DNAT counter increment when the packet comes in?
3. Can you confirm that the destination in the DNAT is correct from the
firewall? Make sure that the route on the firewall can properly get to
the target machine.

