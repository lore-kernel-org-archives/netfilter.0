From: "George Vieira" <georgev@citadelcomputer.com.au>
Subject: RE: Not quite understanding DNAT
Date: Fri, 25 Jul 2003 08:06:33 +1000
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <09B04A55822EFF4DA48D2E0BB2941D4A15BFB7@wardrive.citadelcomputer.com.au>
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
To: netfilter@lists.netfilter.org

basically, I stay away from aliases now. I'd stick to iproute2 commands =
and put all the IPs into the eth0 devices and not aliases..

so then it becomes..

ip addr add 204.48.178.3/25 broadcast 204.48.178.127 dev eth0
ip addr add 204.48.178.4/25 broadcast 204.48.178.127 dev eth0
ip addr add 204.48.178.5/25 broadcast 204.48.178.127 dev eth0


ifconfig won't see the IPs added so you use iproute2 command to see =
them.

ip addr show


Thanks,
____________________________________________
George Vieira
Systems Manager
georgev@citadelcomputer.com.au

Citadel Computer Systems Pty Ltd
http://www.citadelcomputer.com.au

