From: Geffrey Velasquez <g_netfilter@netfids.com>
Subject: Source and Destination port 0
Date: Tue, 15 Jul 2003 12:16:44 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <190809607.20030715121644@netfids.com>
Reply-To: Geffrey Velasquez <g_netfilter@netfids.com>
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
To: netfilter@lists.netfilter.org

Hello Friends,

I have in my IDS logs packets comming from outside to DMZ servers with
source port 0 and destination port 0.

The IDS is located in the DMZ network, and I have an iptables
firewall, kernel-2.4.18-26.1.99_kb2c.1foo over RH 8 (that is the
kernel with superfreeswan patches).

I tried with this couple of rules on top of FORWARD chain:

$IPT -A FORWARD -p tcp --sport 0 -j LOG --log-prefix "Zero: "
$IPT -A FORWARD -p tcp --sport 0 -j DROP

also:

$IPT -A FORWARD -p tcp --sport 0 --dport 0 -j LOG --log-prefix "Cero: "
$IPT -A FORWARD -p tcp --sport 0 --dport 0 -j DROP

After that I continue viewing the bad packets on IDS, how could I
filter this kind of packets?


-- 
Best regards,
 Geffrey                          mailto:g_netfilter@netfids.com


