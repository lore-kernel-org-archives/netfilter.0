From: Maximilian Wilhelm <max@rfc2324.org>
Subject: "Carrier Grade" NAT44 setup
Date: Fri, 5 Jun 2020 18:23:10 +0200
Message-ID: <5c2c7d45-ea99-0f70-04ee-544f9837b8a8@rfc2324.org>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Content-Language: en-US
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,

I have to set up a high available and scalable NAT44 solution for 10k
(up to 20k) users at my university and am looking for options to
implement such a set up.

The easy way out would be to throw money at some vendor and for exmaple
get a pair of ASR1k etc. but as I like Linux a lot and am using it for
other production setup already I'd like to explore what folks deem
possible or maybe have build with Linux and netfilter in that regard.

My idea would be to set up two boxes with some 10G interfaces, some
decent CPUs/RAM and write some lines of nftables config (most likely
Debian buster with backports kernel 5.5.x). All traffic which would have
to be NATed would be routed through those boxes.

I drew a topology diagram to explain what I have in mind [0].

The primary focus for NATing are our wifi users. Within the university
network any connections should be made via IPv6 or the RFC1918 IPs, only
traffic for external destinations should be NATed. This could be
achieved by policy routing on the Nexus 7000 routers in the DC, which
would only route traffic for external targets to the NAT boxes. My
preference would be to set up BGP sessions to our DC routers and be able
to set up ECMP that way. Each box will get it's own pool of external
address so answer packets will be routed to the correct NAT box to
"de-NAT".  So far so straight forward.

What I'm wondering about is:

Did anyone here already build such a setup? If so, did you build it as I
described or different? Would you do it again? :)

What ressources would be required on the Linux box? I would assume any
decent server CPU with 6+ cores will be fine and 16-32GB of RAM would
suffice for storing the conntrack mappings?

According to the nft man pages

  snat to address - address [:port - port] [persistent, random,
fully-random]

SNATing to a pool of addresses should be possible and I guess
"persistent" would be a good idea in this case.

Does anyone have thoughts about wether active/active or active/passive,
most like with conntrack, would be a better move?

Thanks for any input, stay safe!

Best
Max

[0] https://homepages.uni-paderborn.de/mwilhelm/NAT-Topology.png
