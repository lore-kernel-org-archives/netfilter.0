From: Chris Frederick <cdf123@cdf123.net>
Subject: Packets not hitting the nat POSTROUTING table
Date: Thu, 09 Jan 2014 15:57:20 -0600
Message-ID: <52CF1B40.2070201@cdf123.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

Can someone help me understand this issue?

I'm trying to do some load balancing, and nothing seems to be working quite right.  The plan would be to have an apache server listening on a 
private interface, while the load balancing happens on the public interface using keepalived's virtual address functions.  I seem to have 
everything setup right, but the apache responses are coming from the private interface.

I've added a TRACE rule to figure out what's happening and none of the response packets are hitting the nat table's POSTROUTING chain. 
Everywhere I've found online mentions packet traversal going through nat/POSTROUTING before being sent on.

Here's a flow of what seems to be happening:

Client (A.B.C.D) sends request to load balanced virtual ip (SYN from A.B.C.D to 1.2.3.4)
Keepalived recieves packet and sends it to a mirrored apache (SYN from A.B.C.D to 10.0.0.X)
Apache responds to client (SYN/ACK from 10.0.0.X to A.B.C.D)
Client receives response from unknown source, rightfully discards it (SYN/ACK from 10.0.0.X should have been from 1.2.3.4)

If I could just SNAT the packets with a rule like this:
iptables -t nat -A POSTROUTING -o eth0 -s 10.10.10.0/24 --sport 443 -j SNAT --to 12.34.56.78

I've run similar setups like this before, and they have worked, but I can't figure out why nothing is hitting the POSTROUTING chain in the nat 
table.

Any ideas would be helpful.

Chris Frederick
