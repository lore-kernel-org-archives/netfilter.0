From: Sandy C <sc_netfiltermail@yahoo.com>
Subject: bridge/ebtables/iptables interaction question
Date: Tue, 23 Mar 2004 13:16:11 -0800 (PST)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <20040323211611.32198.qmail@web60004.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,
   I have a Linux box with 2 NICS. One is a standard
one port 10/100 NIC (eth0). The other is a Quad FE.
I'm running a bridge across the Quad FE NIC, so all
ports are enslaved by the bridge.

   I have 2 systems, a client and a server attached to
the Quad NIC (aka the bridge) Network connectivity etc
is fine. The client is on eth1 and the server is on
eth2. The single port (eth0) on the Linux box (lets
call this the middle box) running the bridge is
connected to the bridge through a hub on eth3..I ran
out of crossover cables, else I would've had a
crossover cable from eth0 to the bridge.

   I would like to filter the network traffic flowing
between the client and server, that is going through
the bridge. So on the "middle" box, I have the
following iptables rules:

iptables -A INPUT -m physdev --physdev-in eth1 -p tcp
--destination-port 2049 -j LOG
(The idea here is to log all traffic from the client
to the NFS server)

The other rule says:
iptables -A INPUT -m physdev --physdev-in eth2 -p tcp
--source-port 2049 -j LOG
(Log all traffic from the NFS server to the client)

I must be missing something though because I get
nothing in my logs. I ran ethereal, and it is able to
sniff traffic between the client and the server. So
I'm guessing I've missed something in the iptables
rules...what could I be doing wrong? 

Any suggestions would be much appreciated.
Thanks!
S C


__________________________________
Do you Yahoo!?
Yahoo! Finance Tax Center - File online. File on time.
http://taxes.yahoo.com/filing.html

