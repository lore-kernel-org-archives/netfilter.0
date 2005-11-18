From: Adam Rosi-Kessel <adam@rosi-kessel.org>
Subject: Re: Why would certain packets not reach nat PREROUTING chain?
Date: Thu, 17 Nov 2005 20:52:54 -0500
Message-ID: <20051118015254.GA21128@bostoncoop.net>
References: <20051110032733.GA19073@bostoncoop.net>
	<3063e50511100055m41abd50hc3af78a67896db7d@mail.gmail.com>
	<20051114145348.GA12841@bostoncoop.net>
	<Pine.LNX.4.58.0511141559360.1983@blackhole.kfki.hu>
	<4378A8B1.8010206@rosi-kessel.org>
	<Pine.LNX.4.58.0511150855520.4319@blackhole.kfki.hu>
	<4379E61F.5000807@rosi-kessel.org>
	<Pine.LNX.4.58.0511151453480.4373@blackhole.kfki.hu>
	<20051115235319.GA1727@bostoncoop.net>
	<Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.58.0511160923120.6746@blackhole.kfki.hu>
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

On Wed, Nov 16, 2005 at 10:42:38AM +0100, Jozsef Kadlecsik wrote:
> > Jozsef: By the way, I'm unable to email you directly either from my
> > personal account or from gmail. I assume that is by design, but I thought
> > I'd mention it just in case.
> *.dsl.speakeasy.net is blacklisted at our campus.

As is, apparently, gmail? Pretty draconian blacklist!

> > No luck with logging, but I don't seem to have
> > /proc/sys/net/ipv4/netfilter/ip_conntrack_log_invalid
> > even with ipt_LOG or ipt_ULOG loaded.
> > I'm running kernel 2.6.8-2-k7 from Debian Stable, iptables v1.2.11.
> Try to upgrade to a newer kernel.

I guess I'd do this as a last resort. I'm trying to keep the system in
question on Debian Stable if possible. Is there reason to think a kernel
upgrade would just fix it?

> > I did try adding the LOG rule to mangle PREROUTING for INVALID packets
> > but there was no result.
> That means the packets are not INVALID then. Drop the INVALID state
> matching part from the logging rule and repeat the test.

Okay, I've done that below. I added logging rules for mangle PREROUTING
and POSTROUTING with descriptive log prefixes as will be clear below.

> > Below is the output of everything I can think of that would be relevant.
> [...]
> > # netstat-nat -n | grep 500
> > udp   LOCAL_CLIENT:500              SERVER:500            ASSURED
> The connection is in the conntrack table and the NAT rule was applied.
> Good. But next time please send the output of
> 'grep port=500 /proc/net/ip_conntrack' instead.

Okay, I've done that below as well.

> > # tcpdump -i any 'udp port 500'
> > 18:40:06.977738 IP LOCAL_CLIENT.500 > SERVER.500: isakmp: phase 1 I agg
> > 18:40:06.977836 IP EXTERNAL_IP_OF_NAT_BOX.500 > SERVER.500: isakmp: phase 1 ? agg
> Packet natted and sent out.
> > 18:40:07.620295 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
> > 18:40:15.154788 IP SERVER.500 > EXTERNAL_IP_OF_NAT_BOX.500: isakmp: phase 1 R agg
> Server responds but it seems the firewall does not forward the packet.

Right. It's just somewhere disappearing after getting into the mangle
PREROUTING table from the Internet and not getting routed properly to the
internal box. Yet, other NAT connections work fine.

> I have no better idea than repeating the test with general logging in the
> mangle table. You mentioned the raw table earlier. What is the output of
> 'iptables -t raw -L'? Do you know what (other) patches from
> patch-o-matic(-ng) was applied in your kernel?

The raw table is empty, see below.

I don't think the Debian stock kernel has any patch-o-matic patches
applied. I think the only netfilter/iptables patch that is applied is a
security hole that lead to memory corruption:

http://svn.debian.org/wsvn/kernel/patch-tracking/netfilter-NAT-memory-corruption.dpatch?op=file&rev=0&sc=0

Here are my logs below--showing everything as you suggested. IP and MAC
addresses are replaced with descriptive names, but otherwise this is
exactly what appears in my logs.

# grep 500 /proc/net/ip_conntrack
udp      17 163 src=LOCAL_CLIENT dst=SERVER sport=500 dport=500 src=SERVER dst=EXTERNAL_IP_OF_NAT_BOX sport=500 dport=500 [ASSURED] use=1 

# grep Mangle /var/log/syslog | sed "s/^.*kernel: //g"

Mangle Prerouting:IN=eth1 OUT= MAC=ETH1_MAC SRC=LOCAL_CLIENT DST=SERVER LEN=1584 TOS=0x00 PREC=0x00 TTL=128 ID=50876 PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Postrouting:IN= OUT=eth0 SRC=LOCAL_CLIENT DST=SERVER LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=50876 MF PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Prerouting:IN=eth0 OUT= MAC=ETH0_MAC SRC=SERVER DST=EXTERNAL_IP_OF_NAT_BOX LEN=2288 TOS=0x00 PREC=0x00 TTL=55 ID=63908 PROTO=UDP SPT=500 DPT=500 LEN=2268 

Mangle Prerouting:IN=eth0 OUT= MAC=ETH0_MAC SRC=SERVER DST=EXTERNAL_IP_OF_NAT_BOX LEN=2288 TOS=0x00 PREC=0x00 TTL=55 ID=63910 PROTO=UDP SPT=500 DPT=500 LEN=2268 

Mangle Prerouting:IN=eth1 OUT= MAC=ETH1_MAC SRC=LOCAL_CLIENT DST=SERVER LEN=1584 TOS=0x00 PREC=0x00 TTL=128 ID=50908 PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Postrouting:IN= OUT=eth0 SRC=LOCAL_CLIENT DST=SERVER LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=50908 MF PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Prerouting:IN=eth0 OUT= MAC=ETH0_MAC SRC=SERVER DST=EXTERNAL_IP_OF_NAT_BOX LEN=2288 TOS=0x00 PREC=0x00 TTL=55 ID=63912 PROTO=UDP SPT=500 DPT=500 LEN=2268 

Mangle Prerouting:IN=eth1 OUT= MAC=ETH1_MAC SRC=LOCAL_CLIENT DST=SERVER LEN=1584 TOS=0x00 PREC=0x00 TTL=128 ID=50933 PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Postrouting:IN= OUT=eth0 SRC=LOCAL_CLIENT DST=SERVER LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=50933 MF PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Prerouting:IN=eth0 OUT= MAC=ETH0_MAC SRC=SERVER DST=EXTERNAL_IP_OF_NAT_BOX LEN=2288 TOS=0x00 PREC=0x00 TTL=55 ID=63916 PROTO=UDP SPT=500 DPT=500 LEN=2268 

Mangle Prerouting:IN=eth1 OUT= MAC=ETH1_MAC SRC=LOCAL_CLIENT DST=SERVER LEN=1584 TOS=0x00 PREC=0x00 TTL=128 ID=51082 PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Postrouting:IN= OUT=eth0 SRC=LOCAL_CLIENT DST=SERVER LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=51082 MF PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Prerouting:IN=eth1 OUT= MAC=ETH1_MAC SRC=LOCAL_CLIENT DST=SERVER LEN=1584 TOS=0x00 PREC=0x00 TTL=128 ID=51190 PROTO=UDP SPT=500 DPT=500 LEN=1564 

Mangle Postrouting:IN= OUT=eth0 SRC=LOCAL_CLIENT DST=SERVER LEN=1500 TOS=0x00 PREC=0x00 TTL=127 ID=51190 MF PROTO=UDP SPT=500 DPT=500 LEN=1564 


# iptables -t nat -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
SNAT       all  --  192.168.98.0/24      0.0.0.0/0           to:EXTERNAL_IP_OF_NAT_BOX 

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


# iptables -t mangle -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         
LOG        udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:500 LOG flags 0 level 4 prefix `Mangle Prerouting:' 

Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination         
LOG        udp  --  0.0.0.0/0            0.0.0.0/0           udp dpt:500 LOG flags 0 level 4 prefix `Mangle Postrouting:' 


# iptables -t filter -L -n
Chain INPUT (policy ACCEPT)
target     prot opt source               destination         

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         


# iptables -t raw -L -n
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination         

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination         

