From: Markus Oswald <moswald@iirc.at>
Subject: Problems with SNAT/DNAT
Date: 07 Jan 2003 11:37:30 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1041935850.18445.47.camel@dev04.internal.iirc.at>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
Errors-To: netfilter-admin@lists.netfilter.org
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: <https://lists.netfilter.org/pipermail/netfilter/>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi folks,

I have the following Network of routers and computers:

[OfficePC]---[NAT-Box]---[CiscoRouter]---[CustomerRouter]---[CustomerPC]

The network configuration of the routers and PCs like this:

Office PC:

    IP-Address: 172.28.8.109
    S-Mask: 255.255.255.0
    Default-GW: 172.28.8.1

NAT-Box:

    Interface 1
    IP-Address: 172.28.8.1
    S-Mask: 255.255.255.0

    Interface 2
    IP-Address: 193.186.19.1
    S-Mask: 255.255.255.0
    Default-GW: 172.222.41.1

Cisco Router:

    Interface 1
    IP-Address: 193.186.19.3
    S-Mask: 255.255.255.0

    Interface 2
    IP-Address: 172.222.41.3
    S-Mask: 255.255.255.0

    Route to the net 192.64.28.0/24 via 193.186.19.1

Customer Router:

    Interface 1
    IP-Address: 172.222.41.1
    S-Mask: 255.255.255.0

    Interface 2
    IP-Address: 172.111.41.1
    S-Mask: 255.255.255.0

    Route to the net 192.64.28.0/24 via 172.222.41.3

Customer PC:

    Interface 1
    IP-Adress: 172.111.41.151
    S-Mask: 255.255.255.0
    Default-GW: 172.111.41.1

The function of this system shall be as described below:

The office PC [172.28.8.109] sends a packet to the IP-Address
172.29.17.2 which is not assigned to a physically interface. The packet
travels from the office PC to the NAT-Box. There the destination address
is rewritten to 172.111.41.151 and the source address to 192.64.28.109.
The packet is now forwarded to the cisco router, then to the customer
router and finally reaches the customer PC. Then the customer PC answers
to the received packet with a packet from 172.111.41.151 to the
IP-Address 192.64.28.109. This packet is forwarded from the customer
router to the cisco router which forwards it to the Nat-Box. The Nat-Box
rewrites the destination address to 172.28.8.109 and the source address
to 172.29.17.2.

This function ist accomplished with the following iptables commands (on
the nat box):

From the office PC
# iptables -t nat -A PREROUTING -i eth0 -d 172.29.17.2 -j DNAT
--to-destination 172.111.41.151
# iptables -t nat -A POSTROUTING -o eth1 -s 172.28.8.109 -j SNAT
--to-source 192.64.28.109

To the office PC
# iptables -t nat -A PREROUTING -i eth1 -d 192.64.28.109 -j DNAT
--to-destination 172.28.8.109
# iptables -t nat -A POSTROUTING -o eth0 -s 172.111.41.151 -j SNAT
--to-source 172.29.17.2

This setup works fine for tcp-connections from the office PC to the
customer PC. Pinging the customer PC from the office PC also works fine,
but if I do the following I get mysterious results:

Office PC pings Customer PC [with the IP 172.29.17.2] (ttl set to 1)

The office PC now gets a response from 172.28.8.1 with the message
that the ttl expired - that's ok

Office PC pings Customer PC [with the IP 172.29.17.2] (ttl set to 2)

The office PC gets a response from 172.29.171.2 with the message that
the ttl expired - that's not ok - or am I wrong?

tcpdumping on the Nat-Box shows some interesting results:

The cisco router gets the ping packets with the correct ip-addresses
(SRC: 192.64.28.109, DST: 172.111.141.151) and answers correctly to the
ping (SRC: 172.111.141.151, DST: 192.64.28.109).

Now it gets weird:

On eth1 (that's the interface where the response packets get in) I see
packets with a rewritten source address (172.29.17.2).
Two questions get in my mind:
 1) Why do the packets get rewritten?
 2) Why are the rewritten to that specific ip-adress?

On eth0 (where the packets get out and travel back to the office PC) I
see packets with a rewritten source and destination address (SRC:
172.29.17.2, DST: 172.28.8.109). The same questions as above get in
mind.

And thats the question of the long post - what happens in the described
situation? Any ideas?

The Nat-Box is a Debian System with a 2.4.18 kernel.

Thanks in advance,
 Markus
-- 
Markus Oswald <moswald@iirc.at>  \ Unix and Network Administration
Graz, AUSTRIA                     \ High Availability / Cluster
Mobile: +43 676 6485415            \ System Consulting
Fax:    +43 316 428896              \ Web Development


