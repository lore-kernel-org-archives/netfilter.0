From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: silly question, how to block all outgoing traffic?
Date: Fri, 6 Jun 2003 08:16:19 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A0D6DDB@wardrive.citadelcomputer.com.au>
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Return-path: <netfilter-admin@lists.netfilter.org>
content-class: urn:content-classes:message
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
To: calvin <calvinproject@ihug.com.au>, netfilter@lists.netfilter.org

Please refer to the iptables tutorials to get a better idea of the =
chains and how a packet traverses it.

INPUT and OUTPUT are only used by the firewall and not for forwarding =
packets. So in other words, if C1 or C2 sends a packet through G1 or G2, =
both G1 and G2 packets will not pass through those 2 chains.

What you want is FORWARD.

ie.(rule below drops everything C1 is trying to get out via eth1.
--G1--
iptables -A FORWARD -i eth0 -o eth1 -s 137.112.220.166 -j DROP


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au


-----Original Message-----
From: calvin [mailto:calvinproject@ihug.com.au]
Sent: Thursday, June 05, 2003 6:28 PM
To: netfilter@lists.netfilter.org
Subject: silly question, how to block all outgoing traffic?



case2:   iptables -A output -s 137.112.220.165 -j DROP

case3:   iptables -A input -i 137.112.220.165 -s 137.112.220.165 -j DROP

case4: iptables -A output -s ! 137.112.220.165 -j ACCEPT


