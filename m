From: "Daniel Chemko" <dchemko@smgtec.com>
Subject: RE: Difference between arp proxy and dnat?
Date: Wed, 6 Oct 2004 15:58:33 -0700
Sender: netfilter-bounces@lists.netfilter.org
Message-ID: <7C9884991ADAE0479C14F10C858BCDF591E385@alderaan.smgtec.com>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-bounces@lists.netfilter.org>
content-class: urn:content-classes:message
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: mlist@libero.it, "John A. Sullivan III" <john.sullivan@nexusmgmt.com>, netfilter@lists.netfilter.org

> 1) Actually I have Checkpoint firewall one (4.1) running on NT.
> My firewall is like this:
<snip>

I can't say much about the checkpoint way of doing things, but it seems
'somewhat' right. Are you trying to add to the checkpoint firewall, or
are you're going to replace the checkpoint with Linux?

> 2) I have others office with structures like this in which there is an
> iptables firewall and I always use DNAT adding public ip to external
> interfaces and adding rules like this:
> iptables -t nat -A PREROUTING -d 2.2.2.10/24 -j DNAT --to-destination
> 192.168.0.5

# Loose the /24 since that means all traffic from 2.2.2.0 -> 2.2.2.255
are redirected to host 192.168.0.5 which is probably wrong. Ex.
iptables -t nat -A PREROUTING -d 2.2.2.7 -j DNAT --to-destination
192.168.0.7
iptables -t nat -A PREROUTING -d 2.2.2.10 -j DNAT --to-destination
192.168.0.5

> Now....and finally....^_^
> Are corrected the following affirmations? If not PLEASE CORRECT them
> with a brief explanation
> a) Proxy arp is a technique used by most firewall producers and its
> functionality is similar to that explained above (Checkpoint)

Think of ProxyARP as an add banner. It tells people who you are. If you
don't want adoring fans to mob you, you tell people to talk to your
talent agent. You are a machine hiding behind the firewall. The talent
agent is the firewall. It manages the relationship between you and those
that want to talk to you.

When you bind to an address by using 'ip addr add ${MYADDR} dev ${MYIF}'
or 'ifconfig ${MYIF} ${MYADDR} up' you are telling everyone in ${MYIF}'s
subnet that you are ${MYADDR}. ProxyARP does the exact same thing, but
instead of 'being' that interface, it just pretends to be ${MYADDR}.
Internally, Netfilter will look at the inbound packets and throw them
away because you haven't really 'bound' that address to your interface,
your just pretending.

The trick is, when you hit the IN->PREROUTING->nat stage of reading the
packet, you match a rule that says that destination ${MYADDR} really has
to go to xyz. Because the destination address is now 'valid' it doesn't
get dropped. When you 'bind' the IP address to the interface, everything
applies, but when a packet arrives that hasn't been DNAT'ed away, it
will be routed to the INPUT chain.

Comercial products typically use ProxyARP because the local networking
stacks on these devices never need to handle packets for that connection
locally. Plus binding to an interface carries a very small cpu/memory
penalty vs. ProxyARP.


Ex. Same firewall, one using IP's bound to the interface, one using
ProxyARP instead

itpables -t nat -A PREROUTING --destination ${MYADDR1} -p tcp --dport 80
-j DNAT --to ${MY_INSIDE_SERVER}
itpables -t nat -A PREROUTING --destination ${MYADDR2} -p tcp -j DNAT
--to ${MY_INSIDE_SERVER}

IP Addresses Bound to Interface

Inbound connection to MYADDR1:80 will get DNAT to MY_INSIDE_SERVER:80
Inbound connection to MYADDR1:21 will get routed to the INPUT chain of
the firewall
Inbound connection to MYADDR2:80 will get DNAT to MY_INSIDE_SERVER:80
Inbound connection to MYADDR2:21 will get DNAT to MY_INSIDE_SERVER:21

IP Addresses ProxyARP'ed to Interface

Inbound connection to MYADDR1:80 will get DNAT to MY_INSIDE_SERVER:80
Inbound connection to MYADDR1:21 will get dropped on the floor by
Linux's anti-spoofing code
Inbound connection to MYADDR2:80 will get DNAT to MY_INSIDE_SERVER:80
Inbound connection to MYADDR2:21 will get DNAT to MY_INSIDE_SERVER:21



> b) To map public ip address to private ip address, with LINUX you can
> use DNAT or PROXY ARP while others commercial products, generally
> offers only proxy arp (except those based on linux, like Astaro
> security linux). Technically speaking DNAT and PROXY arp aren't the
> same, but, in order to provide mapping (public to private) the result
> is the same.

ProxyARP doesn't map anything to anything. ProxyARP tells the world that
I'm address ${MYADDR}. DNAT receives packets destined for ${MYADDR} and
forwards it to server ${MY_INTERNAL_SERVER}

ProxyARP is on the same level as binding an IP address to a network
interface.


> c) With Linux you can use both, but, technically speaking, LINUX PROXY
> IMPLEMENTATION is not equal to that of others producers and, as john
> explained, this is not true "proxy ARP"

ProxyARP is a very primitive concept and everyone does it more or less
the same way. The difference is in the 'terminology' of the technology.
If I want to capture a subnet 2.2.2.0/24 from the internet and bring it
inside, I could setup proxyARP's for them all, or I could bind all the
IP addresses to the network interface. Either approach, you have to use
DNAT in conjunction. I prefer binding because its an easy way of doing
it. At times you ARE forced to use ProxyARP over binding to the
interface, but that is only when you are using Network bridging. If you
haven't done this before, I'd advise not trying to learn until you get
the rest of this.

