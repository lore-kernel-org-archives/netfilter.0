From: Michele Codutti <michele.codutti@uniud.it>
Subject: ClusterIP and MAC NAT
Date: Tue, 26 Oct 2010 16:30:38 +0200
Message-ID: <1288103438.2727.69.camel@nerino>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hello, I'm trying to fix a problem with ClusterIP and Cisco (and also
other brands) routers. The problem is the multicast MAC address that
these routers doesn't "like". They discard any incoming packet with MAC
multicast address to be compliant with RFC1812.
The only documented (by Cisco) workaround is to put a fixed arp entry
with the multicast address that maps the clustered IP in the router.
This method is deprecated here by the network staff so i must find
another solution.
In my opinion a possible solution is to use the existing bridge in front
of the pool of clustered IP hosts with some ebtable rules that
substitute the multicast MAC address with a forged unicast MAC address
for the outgoing packets and substitute the forged unicast MAC address
with the multicast one for the incoming packets.
Suppose that the multicast MAC address is: 01:02:03:04:05:06
and the ClusterIP address is: 10.0.0.100
Now I forge a unicast MAC address for the ClusterIP: 00:02:03:04:05:06
So the rule for the incoming packets is (taken from
http://ebtables.sourceforge.net/examples/basic.html#ex_nat):
ebtables -t nat -A PREROUTING -d 00:02:03:04:05:06 -i incoming-eth1 -j
dnat --to-destination 01:02:03:04:05:06
And similarly the rule for the outgoing packets is:
ebtables -t nat -A POSTROUTING -s 01:02:03:04:05:06 -o outgoing-eth0 -j
snat --to-source 00:02:03:04:05:06
Now the problem is with the arp queries. In need to "NAT" also the
queries substituting the mac address also in the payload of the packet
not only in the header. Can i do that?



Michele Codutti
Centro Servizi Informatici e Telematici (CSIT)
Universita' degli Studi di Udine
via Delle Scienze, 208 - 33100 UDINE
tel +39 0432 558928
fax +39 0432 558911
e-mail: michele.codutti at uniud.it





