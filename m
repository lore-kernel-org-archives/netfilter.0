From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Tue, 15 Nov 2005 18:53:19 -0500
Message-ID: <20051115235319.GA1727@bostoncoop.net>
References: <4372A989.5090606@rosi-kessel.org>
	<20051110031834.GB9770@samad.com.au>
	<20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
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
Content-Transfer-Encoding: 7bit
To: Jozsef Kadlecsik <kadlec@blackhole.kfki.hu>
Cc: netfilter@lists.netfilter.org

Jozsef: By the way, I'm unable to email you directly either from my
personal account or from gmail. I assume that is by design, but I thought
I'd mention it just in case.

On Tue, Nov 15, 2005 at 03:00:18PM +0100, Jozsef Kadlecsik wrote:
> > So, setting aside the question of why I wasn't seeing that before, shouldn't
> > I be able to see the incoming packets as they are routed to the internal
> > client machine, even if they are tracked connections?  When I watch the
> > inward-facing interface with tcpdump, I don't see any of these packets
> > getting routed to that machine, although I do see the outbound packets.
> I don't clearly understand you here. It is always best to run tcpdump on
> both interfaces so that one can compare what packets are routed properly
> and how they were mangled/NAT-ed by the firewall. If some packets are
> missing from either side then that's a clear sign that those packets were
> dropped by either a matching rule/policy or by the system itself.
> Did the logging produce anything?

No luck with logging, but I don't seem to have
/proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid 
even with ipt_LOG or ipt_ULOG loaded.

I'm running kernel 2.6.8-2-k7 from Debian Stable, iptables v1.2.11.

I did try adding the LOG rule to mangle PREROUTING for INVALID packets
but there was no result.

Below is the output of everything I can think of that would be relevant.
As per your suggestion, I ran tcpdump on all interfaces.  What you'll
notice is that there are packets coming in that go from the internal
client to the external server, and then are remapped form the NAT box's
external IP address to the external server (on the way out); and you'll
see packets coming in from the external server to the NAT box, but they
never go out the NAT box's LAN-facing interface to the internal client.

That is:

  LOCAL_CLIENT = machine behind the NAT box in the LAN with a 192.168.* IP address
  EXTERNAL_IP_OF_NAT_BOX = machine that has two network cards, one facing
           the Internet the other facing the LAN, where this IP address is its
           external IP address
  SERVER = the VPN server I am attempting to connect to on the Internet

# iptables -t mangle -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
LOG        all  --  0.0.0.0/0            0.0.0.0/0           state INVALID LOG flags 0 level 4 prefix `INVALID packet: '

Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination

# grep "INVALID" /var/log/syslog

[no results after several minutes of attempting to connect]

# iptables -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
SNAT       all  --  192.168.98.0/24      0.0.0.0/0           to:EXTERNAL_IP_OF_NAT_BOX

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination

# netstat-nat -n | grep 500
udp   LOCAL_CLIENT:500              SERVER:500            ASSURED

# tcpdump -i any 'udp port 500'
18:40:06.977738 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:40:06.977836 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:40:07.620295 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:40:15.154788 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:40:24.305185 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:40:31.012740 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:40:31.012812 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:40:41.588975 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:40:59.054904 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:40:59.055032 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:41:21.622936 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:41:21.623044 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:41:21.974515 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:41:28.358127 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:41:31.103115 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:41:31.103171 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:41:37.508037 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:41:44.122683 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:41:44.122824 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:41:55.808152 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:42:00.146797 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:42:00.146908 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:42:19.175413 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:42:19.175524 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:42:41.208547 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:42:41.208661 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:42:41.560743 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:42:45.930721 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:42:55.085313 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
18:43:06.247160 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
18:43:06.247272 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
18:43:14.093473 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
-- 
Adam Rosi-Kessel
http://adam.rosi-kessel.org

