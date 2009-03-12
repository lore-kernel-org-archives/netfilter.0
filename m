From: "Vitor =?iso-8859-1?Q?Ant=F3nio?= das Neves Pinto" <vpinto@av.it.pt>
Subject: Iptables special config
Date: Thu, 12 Mar 2009 11:32:50 +0000
Message-ID: <web-35205651@av.it.pt>
Mime-Version: 1.0
Content-Transfer-Encoding: QUOTED-PRINTABLE
Return-path: <netfilter-owner@vger.kernel.org>
Sender: netfilter-owner@vger.kernel.org
List-ID: <netfilter.vger.kernel.org>
Content-Type: text/plain; charset="windows-1252"; format="flowed"
To: netfilter@vger.kernel.org

Dear all,

I have a question regarding a special configuration with=20
iptables, I hope you can help me:
- Behind the NAT there=92s a terminal with IP1 that sends a=20
UDP packet to a host outside the NAT with IP2 (Source=20
port=3D1033 Dport=3D 123)
- The response to this packet (due to load balancing=20
issues) comes from a machine outside the NAT with IP3 (not=20
from IP2!!) with Source port=3D123 Dport=3D1033

Since iptables is configured as a port restricted NAT the=20
response packet is dropped not reaching terminal with IP1=85=20
Any idea how to make the packet reach the terminal with=20
IP1?
I know that with a full cone nat this wouldn=92t happen=85

Best regards,
Vitor Pinto
