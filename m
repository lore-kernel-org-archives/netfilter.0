From: "Jon Wilson" <jon.wilson@3waynetworks.com>
Subject: Raw sockets send/receive through NAT
Date: Mon, 25 Sep 2006 10:35:27 +0100
Message-ID: <93EDDD37BB21F242B60066B66AC0D657AB6CA5@euw0300240.xe2hosting.net>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-class: urn:content-classes:message
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

Hi,

I have a requirement to NAT packets sent using raw sockets (
socket(AF_INET, SOCK_RAW, IPPROTO_TCP/ICMP) ).  The machine I'm using
has a single interface with a 192.168.x.x address and I want to send a
packet from this machine with a 10.x.x.x source address (hence raw
sockets) and have the 10.x.x.x address NAT'd to the 192.168.x.x address.
I'm using POSTROUTING MASQUERADE'ing on eth0.  I've got a couple of
questions:

1.  How do I receive the returned (raw) packets *after* they have
traversed the NAT i.e. in the 10.x.x.x IP space?  If I use libpcap for
example, I get the 192.168.x.x IP space packet but what I need is the
packet post-NAT with the 10.x.x.x IP address.

2.  I've found the NAT works on 2.6.15 (FC5) but doesn't on 2.4.22
(RH9).  Unfortunately I need to use the 2.4.22 kernel, at least for now.

Does anyone know at what point in the kernel releases this functionality
changed?  And ... clutching and straws ... the reason(s) for the change
- was it just a bug or is there some deeper story?

How would I go about patching 2.4.22 to give me the raw sockets NAT that
I need (not something I even know where to start...)?

Thanks in advance!

Jon

P.S. Interestingly (?) I found that the NAT worked fine for TCP packets
but ICMP packets only worked if I added virtual interfaces and routes
for each of the 10.x.x.x addresses I wanted to send from... any ideas
why?!


