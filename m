From: Jason Vas Dias <jason.vas.dias@gmail.com>
Subject: Anyone achieved BSD natd(8) compatibility with Linux netfilter or 
	Solaris ipf - ie. single-address-on-same-interface bidirectional mapping to 
	DMZ private subnet ?
Date: Fri, 15 May 2009 20:10:28 -0400
Message-ID: <102f5c010905151710m7bf674e9s6abb5d36b8c4fcca@mail.gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=gamma;
        h=domainkey-signature:mime-version:received:date:message-id:subject
         :from:to:content-type:content-transfer-encoding;
        bh=fg0Z//f58JzDCSBzlf5Yy5msX0066LBuB///85fkhlk=;
        b=Jorogj0jY/Lb1MTugb5rBh7ukMztk2ddmp7fZ8Rj35GqTTxkk9BJnPbvieRAGzYaBT
         VbOwRkWQ9rge1Rj/p05x5ts2AzVLCQKFiwWruodSxK86zhKmC7gVs+oXQwP1CZ6cnNUY
         +m+EIAWZFcBBjycp8YIGTAVCV70C75SMYJRjs=
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi -

This is my first post to this list, so please excuse me if I miss something or
if this is an inappropriate posting for this list.

Question :

I am trying to replace an ancient MacOSX box, whose natd(8) does a
really great job of
"Connection Sharing" - becoming a router for the "External Internet"
to my local LAN
subnet whose addresses it has provided with DHCP ( 192.168.2.2 - 4 ) .

So natd(8) maps the IP source address in packets originating from the
local 192.168.2.{2,3.4} subnet
that appear from the en0 interface, to the external internet address
given to the single interface en0 by
my DSL modem , and sends such packets out on en0 with the destination
address and port mapped back
to natd's address and port on the external internet .   natd(8)
maintains a table of all such packets sent
out to the external internet, such that when a response for such a
packet it received, the destination
IP address is mapped back to the original packet originator, and is
then sent back out on en0 to the
local DMZ subnet host that originated it,  as in this diagram :

   MacOS Host:
   single IP interface  en0:
        ipv4 address 192.168.2.1
        ipv4 address 66.68.31.192 (assigned from DSL router)
   natd:
        listens on      66.68.31.192:natd
  bootpd:
        listens on      192.168.2.1:bootps

    DMZ   hosts:  192.168.2.2, 192.168.2.3,   192.168.2.4

  All these hosts are connected to the same hub, whose uplink cable is
connected to the DSL Router.

  natd(8) reads a raw socket to receive every packet that is received
on interface  en0.
  When a packet is received from a 192.168.2.x source address  with a
destination address
   that is not  in subnet 192.168.2/24 , it replaces the 192.168.2/24
address with 66.68.31.192,
   and the destination address and port with 66.68.31.192:natd , and
sends the packet back out on en0;
   the DSL router sends such packets on to the external internet, and
the external internet host sends
   responses back to 66.68.31.192:natd;  natd can then use  the packet
 identifiers it generated
  for the request packets to the response packet (it could  even use a
separate port to receive
  response packets  for each separate DMZ  host, so the mapping
becomes trivial).

My  question is : how can this be achieved with Linux netfilter or
Solaris IP Filter / ipnat(4) ?
I have either a Solaris host or Linux host I can use for this job. The
old MacOSX ppc32 host is
too slow, and does not support more than two other hosts on the DMZ .

What I don't understand from the netfilter / ipfilter documentation is
precisely how a response
from the external internet , whit a destination IP + port on the
gateway , is translated into a response
for a DMZ host in the same way as netd does.

I have looked  at the open-source firestarter project, which can
construct NAT rules to do this for a gateway
 host with two physical interfaces, but all my hosts have only one
physical ethernet interface.

Could anyone please explain how response packets can be routed back to
the DMZ host with Linux netfilter or Solaris ipfilter rules ?

Thanks in advance,
Jason.
