From: "B H R Balaji" <balaji@sol.net.in>
Subject: MASQ problem
Date: Tue, 10 Jun 2003 10:00:48 +0530
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <00c801c32f09$1134f400$c2bf09ca@Housecall>
Reply-To: "B H R Balaji" <balaji@sol.net.in>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-admin@lists.netfilter.org>
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
To: netfilter@lists.samba.org



HI

i have 20 alias interface, iam not able to MASQ using that interface, is
this iptables supports this option

[root@netxpress root]# iptables -I FORWARD -i eth0:1  -s
92.168.100.0/24  -j MASQUERADE
Warning: wierd character in interface `eth0:1' (No aliases, :, ! or *).
iptables: Target problem


hare


