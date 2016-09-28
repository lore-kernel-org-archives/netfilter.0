From: Dennis Jacobfeuerborn <dennisml@conversis.de>
Subject: iptables DNAT reply packets with RST flag are sent using private ip
Date: Thu, 29 Sep 2016 00:04:56 +0200
Message-ID: <13764fd5-d899-24ba-4693-4a6d4b311a28@conversis.de>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi,
I'm looking at a strange phenomenon that occurs on an iptables firewall.
There is a DNAT rule configured that maps a public IP to a private one
where a web serve is listening. Normal request operate as expected that
is the destination ip is modified to the private one when the request
arrives at the firewall and on the response packet the private ip is
mapped back to the public one.
What I noticed though is that for some response packets the source ip is
*not* mapped back to the public ip and instead tcpdump shows that the
packets are sent out with the private source ip. The thing all these
packets have in common is that they have the RST flag set.

What could be the reason for this? Is there some particular iptables
behavior that could explain this?

Regards,
  Dennis
