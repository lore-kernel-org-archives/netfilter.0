From: Nemeth Denes <nemeth.denes@iit.bme.hu>
Subject: sequence numbers in conntrack
Date: Sat, 09 Jan 2010 22:12:38 +0100
Message-ID: <4B48F146.4040303@iit.bme.hu>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Hello,

Could someone help me to explain what does the conntack module do
in TCP connection negotiation in the following three cases: (host N is
behind the NAT and host P is on the other side of the NAT)

A:
P sends a SYN to H and H replies with an SYN-ACK with an invalid
sequence number (If this passes normally through is it possible to
filter it out?)

B:
P sends a SYN to H and H replies with non SYN-ACK (3-way-handshake)
or SYN (TCP simultaneous open) package

C: If the "--random" option is given to the postrouting chain, what happens
if the clients use up all the ports?

Many thanks,
Denes Nemeth


