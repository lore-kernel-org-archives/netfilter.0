From: "Rob Sterenborg" <rob@sterenborg.info>
Subject: RE: updated iptables doesn't work with old rules
Date: Fri, 24 Feb 2006 07:26:27 +0100
Message-ID: <000301c6390b$3ff8eee0$0101000a@sterenborg.info>
References: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <5f56302b0602221253t7157857ejb15f87d9984da59c@mail.gmail.com>
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

>>> echo 0 > /proc/sys/net/ipv4/ip_forward
>>> $ipt -P FORWARD DROP
>>> $ipt -F FORWARD
>>> $ipt -A FORWARD -m state --state RELATED,ESTABLISHED -j ACCEPT
>>> $ipt -A FORWARD -m state --state NEW -i eth1 -o eth0 \
>>>   -s 192.168.11.0/24 -j ACCEPT
>>> $ipt -t nat -F POSTROUTING
>>> $ipt -t nat -A POSTROUTING -o eth0 -j SNAT --to 192.168.10.101
>>> echo 1 > /proc/sys/net/ipv4/ip_forward
> 
> 
> This set of rules didn't work either and in fact I don't understand
> why should one of the machines be named 192.168.11.x, everything
> being 192.168.10.x is not okay? 

You can only have one 192.168.10.0/24 subnet. If both your NIC's have an
IP from that range, your routing rules will point to both NIC's as
gateway. The first gateway that matches a routing rule is "accepted".

So, machine A :
eth0: 192.168.10.1 (192.168.10.0/24)
eth1: 192.168.10.2 (192.168.10.0/24)

Your kernel IP routing table will looke like :
Destination     Gateway         Genmask         Iface
192.168.10.0    192.168.10.1    255.255.255.0   eth0
192.168.10.0    192.168.10.2    255.255.255.0   eth1

Say, machine B is connected to eth1 on machine A. Machine A sends a
packet. The first rule matches so it will send that packet via eth0, not
eth1. So machine B will never see the packet.

> Anyway, what I have tried is:
> 
> # make sure we start from zero
> 
> iptables --flush
> iptables -t nat --flush
> iptables --delete-chain
> iptables -t nat --delete-chain
> 
> # set up masquerading from LAN to modem which is hook up on eth0
> 
> iptables -t nat -A POSTROUTING --out-interface eth0 -j MASQUERADE
> 
> # allow forwarding from LAN which is hookup up on eth1
> 
> iptables -A FORWARD --in-interface eth1 -j ACCEPT
> 
> # enable ip forwarding
> 
> echo 1 > /proc/sys/net/ipv4/ip_forwarding
> 
> Just to recap, my configuration is this:
> 
> machine A - eth0 ------------------ modem ------------ internet   |
>  eth1
>   |
>   |
>   |
>  hub
>   |
>   |
> machine B
> 
> And I would like to access the internet from machine B, however the
> above rules don't work even without specifying the sources and
> allowing everything. 
> 
> Any ideas?

Yeah.
If you don't use different subnets on each NIC, I still think you have a
routing problem.

==========
> Hi Chinh, I tried interchanging eth0 and eth1 and still no luck.

No. It won't work if you only allow forwarding from eth1 to eth0 (or
vv). You *also* need the reverse rule (not *instead of*).

If you do :
$ipt -A FORWARD -i eth1 -o eth0 -j ACCEPT

And do not accept RELATED,ESTABLISHED, you also need :
$ipt -A FORWARD -i eth0 -o eth1 -j ACCEPT

But that would be less secure. It's better to accept packets that are
already accepted by another (specific) rule. So, you'd have a rule like
:
$ipt -A FORWARD -m state --state RELATED,ESTABLISHED \
  -j ACCEPT
instead of the one above this.

===== Later post =====
> And I'm also quite confused about eth0/ppp0, perhaps a related
> issue is that the kernel ip table of 'machine A' is
> 
> Destination    Gateway        Genmask         Iface
> 213.191.89.30     *           255.255.255.255 ppp0
> 192.168.10.0      *           255.255.255.0   eth1
> 192.168.10.0      *           255.255.255.0   eth0
> 169.254.0.0       *           255.255.0.0     eth0
> default        213.191.89.30  0.0.0.0         ppp0

Ah.. I never saw anything about you using a ppp0 device before... From
your diagram I thought the modem(/router ?) was doing NAT also...
In that case, yes : you need MASQUERADE.

I think that your routing table shows the routing problem I'm talking
about.
If a packet gets sent to 192.168.10.100, you don't know via which NIC
it's going out, eth0 or eth1, because there are 2 rules for the same
subnet via different interfaces.
(I'm not sure if the routing table is showing the routes in processing
order.)

===== Later post =====
>> kernel: nat: IN=eth1 OUT= MAC=(mac address of eth1) SRC=(IP of
machine
>> B) DEST=213.191.74.18 LEN=54 TOS=0x00 PREC=0x00 TTL=64 ............
>> kernel: out: IN=eth1 OUT=ppp0 SRC=(IP of machine B)
DEST=213.191.74.18
>>  ...........
>> 
>> What does this supposed to mean? :)
> 
>It mean your packet traversed the prerouting nat eth1, and so on.

That depends on where the logging rules are and what they look like.
If the "nat" line is from the FORWARD chain, and the "out" line from the
OUTPUT chain, these packets are not really related because nat-ed
packets only travel the FORWARD chain, not the OUTPUT chain. The can be
related as such, because you use a ppp device over a eth0 (I thought it
was). But for netfilter that would be "another" packet.


Gr,
Rob


