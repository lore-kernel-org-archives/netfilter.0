From: "Jeremy M. Dolan" <jmd@pobox.com>
Subject: port forwarding local connections
Date: Wed, 19 Mar 2003 16:02:08 -0600
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20030319220207.GA1783@foozle.attbi.com>
Mime-Version: 1.0
Return-path: <netfilter-admin@lists.netfilter.org>
Content-Disposition: inline
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.samba.org

I have a firewall machine (Red Hat 7.2) doing SNAT for a LAN, and port
forwarding inbound 25 to the internal mail server.

Public IP: 65.1.1.1
Internal IP: 10.1.1.1
kernel: 2.4.18-24.7.x
iptables: 1.2.5-3

The problem is mail sent from the firewall that needs to end up on the
internal mail server. The firewall looks up the MX record, and gets
back mailserver.domainname.com (which is 65.1.1.1). I'm not entirely
clear what happens next, but at this point there is a biff connection
(refused) over the loopback, and sendmail seems to fall back to using
domainname.com (proper SMTP behavior) instead of
mailserver.domainname.com, the MX. This, of course, bounces back.

TCP connections to 65.1.1.1:25 from the outside are fine, and connect
to the MS Exchange server directly. But on the firewall, the
connection is refused, not forwarded (local sendmail is listening only
on 127.0.0.1).

I think Linux 2.2 sent packets destined for the eth0 IP through the
loopback ipchains rules, but there is no interface specified in this
iptables rule, so that should not be an issue:

# iptables -t nat -vnL|head -4
Chain PREROUTING (policy ACCEPT 632K packets, 53M bytes)
 pkts bytes target     prot opt in     out     source            destination
   71  3304 DNAT       tcp  --  *      *       0.0.0.0/0         0.0.0.0/0          tcp dpt:25 to:10.1.1.4
    0     0 DNAT       tcp  --  eth1   *       0.0.0.0/0         0.0.0.0/0          tcp dpt:5902 to:10.1.1.2:5900

How can I get mail from the firewall to send to the internal mail
server, without using user@[10.1.1.4] instead of user@company.com ?
I've checked the Netfilter FAQ and NAT HOWTO but didn't see any
information about how port forwarding behaves on the firewall itself.

Thanks for any info (please Cc me, not on list)

-- 
Jeremy M. Dolan <mailto:jmd@pobox.com> <http://jmd.us/>
PGP: 1024D/3C68A1BA 9470 210C A476 FFBB 6D11  0223 0D1C ABFC 3C68 A1BA

