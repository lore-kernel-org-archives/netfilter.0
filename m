From: "Calin Onofrei" <Calin.Onofrei@cassidiancommunications.com>
Subject: How to do NAT for an udp reply packet?
Date: Wed, 17 Aug 2011 09:48:07 -0400
Message-ID: <3173206D0F5F6B418F76F5997B2AE75201F164B3@gatex01.CMLnet.peinet.peinc.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8BIT
Return-path: <netfilter-owner@vger.kernel.org>
Content-class: urn:content-classes:message
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="us-ascii"
To: netfilter@vger.kernel.org

Hi netfilter list,
I want to do NAT with specific rules for an udp reply packet. The
current behaviour is that a reverse NAT is done automatically and it is
not taking care of the NAT rules implemented. The only way I was able to
do NAT with different rules for an udp reply packet was by setting the
udp connection timeout to 0 (echo "0" >
/proc/sys/net/ipv4/netfilter/ip_conntrack_udp_timeout). There is another
way?
Thank you!
Calin Onofrei

