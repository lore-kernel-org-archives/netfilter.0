From: "Giles Coochey" <giles@coochey.net>
Subject: PPTP Server behind NAT firewall
Date: Sun, 20 Apr 2003 20:17:59 +0100
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <HBEPKNCGBFEBMALKENGLCEFHCJAA.giles@coochey.net>
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

I have an interesting problem with the PPTP Conntrack patch. The server is
behind a firewall performing NAT, and I have port forwards enabled for both
GRE (protocol 47) and PPTP (tcp 1723).
Most clients can connect without issues, however, there are two clients that
seem to have the same problem.
They are able to connect, but are disconnected by a RST from the server on
the PPTP control channel.
It seems that the PPTP server is sending out SET-LINK packets and never
receives an ACK or reply to those packets. Eventually the server gives up
and RSTs the connection.
This happens on the client 3 minutes after establishing the connection.

Has anyone experienced this?

I'm running kernel 2.4.20 with P-O-M from late march CVS snapshot (It
doesn't seem to have changed much since).

iptables just recently upgraded to 1.2.8, without resolving the issue.

Just to make clear - most clients connect fine, just these two instances
seem to have the problem, and there isn't really much that makes them very
different. They're running Windows XP Pro. (The server is Windows 2000 SP3
Server)

If anyone can help it would be greatly appreciated.

Best Regards,

Giles


