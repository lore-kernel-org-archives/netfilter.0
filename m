From: Fox <kerberos@intal.uz>
Subject: port forwarding
Date: Sun, 27 Apr 2003 14:09:16 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <548356826.20030427140916@intal.uz>
Reply-To: fox <kerberos@intal.uz>
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

Hi Everybody.

I want to forward all the packets to port 80 and 443 to 16721 and
using the following rules:

# 80->16721->80
${IPTABLES} -t nat -A PREROUTING -s 0.0.0.0/0 -d 192.168.0.1 -p tcp --dport 80 -j DNAT \
--to-destination 192.168.0.1:16721
${IPTABLES} -t nat -A POSTROUTING -s 192.168.0.1 -d 0/0 -p tcp --sport 16721 -j SNAT \
 --to-source 192.168.0.1:80

# 443->16721->443
${IPTABLES} -t nat -A PREROUTING -s 0.0.0.0/0 -d 192.168.0.1 -p tcp --dport 443 -j DNAT \
--to-destination 192.168.0.1:16721
${IPTABLES} -t nat -A POSTROUTING -s 192.168.0.1 -d 0/0 -p tcp --sport 16721 -j SNAT \
 --to-source 192.168.0.1:443

I'm just wondering - won't the source address of packets to 443 be
changed to 192.168.0.1:80 instead of 192.168.0.1:443 when they're
replied to the client?

I don't know what type of connection tracking to use. Your help is
appreciated.

Thanks in advance.

Fox


