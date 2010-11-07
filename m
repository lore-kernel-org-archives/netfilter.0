From: Joelly Alexander <alex@joelly.net>
Subject: unable to source and destination nat at the same time on multi-homed
 server
Date: Sun, 07 Nov 2010 16:24:54 +0100
Message-ID: <4CD6C4C6.3050508@joelly.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@vger.kernel.org

i am not able to do source and destination nat for local outgoing packets;

what i need:

there are two instances of software running on the same server, both 
instances send traffic to the same destination ip's;
the destination ip's must see the traffic from different source ip's for 
each instance;

what i tried:

the server has both ip's in the same subnet (one physical and one 
virtual), but the ip-stack sends traffic out always with the lowest ip 
which works for the first instance - but i need to manipulate the 
traffic for the second instance;

so, my plan was to send the traffic from the second instance to a false 
destination and perform source-nat to the virtual-ip and destination-nat 
not to the real destination  - which seems not to work;

it is not possible to perform source-nat and destination-nat in the same 
rule, and on the output chain i can only perform destination-nat where i 
afterwards cannot do source-nat in the postrouting chain;

i need that in the reverse order - first source-nat and then 
destination-nat to have the destination ip (the temp. false one) as a 
matching criteria;

in other words - source-nat must be done before destination-nat, but 
iptables does not allow this because the output chain with 
destination-nat is handled before the source-nat from the postrouting 
chain;

does anyone know a way to solve this?

thx,
alex
