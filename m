From: "Aaron Stavens" <aaron.stavens@nmwco.com>
Subject: What can I use to set up a transparent proxy?
Date: Tue, 18 Jan 2005 17:07:10 -0800
Message-ID: <68B9548ED9F8A341B21CDB320655D613EE7BA2@mercury.nmwco.com>
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

I have a chunk of software I am porting to Linux. Given what I have
heard and read, I suspect Linux might already perform the software's
function. However, I'm quite new to Linux and I'm not sure where to
start. I'm hoping someone here can point me in the right direction.

The software is essentially a proxy server serving a potentially large
number (~1000) of clients. When a client connects to the proxy, it is
assigned a "virtual address" (VA). The rest of the network communicates
with the client using the VA via the proxy. The software performs the
following functions:

1. The proxy server should send out a gratuitous ARP when a VA is first
assigned.
2. The proxy server must respond to ARP requests for the VA with its own
MAC address.
3. The proxy server must respond to ICMP echo requests for the VA.
4. Unicast traffic destined for a {VA, port} pair should be redirected
to a corresponding local address and port on the proxy.
5. Unicast traffic from a local address and port on the proxy should be
translated to the corresponding {VA, port} pair.
6. Broadcast/multicast traffic to a given port must be forwarded to each
local proxy port. That is, one broadcast packet to a given port must be
delivered to n local proxy ports, where n is the number of clients
listening on the broadcast port.
7. The proxy needs to slam the TCP MSS on client streams.'
8. The proxy software should be the only local client communicating on
the VAs via its local address. That is, I don't want a collocated web
server opening INADDR_ANY on port 80 and consequently opening port 80 on
every VA in the system.

Although I'm sure I could accomplish these functions by writing a kernel
module, I believe existing infrastructure should be considered before
pursuing that path. I've been researching netfilter and iptables. I
haven't done proof of concept yet, but my requirements are very
NAT-like. It appears that iptables can accomplish #4 & #5 above as well
as possibly #7. However, I did not see how I can make iptables do #1 &
#2. #6 is also in question. Are there facilities within iptables to
accomplish these goals? In Linux?

Also, {VA, port}<->{real addr, port} mappings are quite dynamic.
Comments in, "Iptables Tutorial 1.1.19" concern me. I am led to believe
that continually changing the iptables rules, especially given the large
number of mappings the software must perform, could be inefficient/time
consuming. Can anyone comment on that? Another comment from the same
tutorial leads me to ask another question. Do all existing rules remain
in effect when an update is made to iptables? That is, if iptables
contains 10 mappings and I add another, is the operation of those
existing 10 mappings interrupted at any point during the update?
Similarly, is there any interruption should one of the mappings be
removed?

Thanks,
Aaron Stavens

