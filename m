From: Craig Nellist <nellistc@gmail.com>
Subject: multiple nat'd clients to poptop
Date: Tue, 14 Dec 2004 22:42:48 +1100
Message-ID: <eec8890104121403425019cf9c@mail.gmail.com>
Reply-To: Craig Nellist <nellistc@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
List-Id: <netfilter.vger.kernel.org>
List-Unsubscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=unsubscribe>
List-Archive: </pipermail/netfilter>
List-Post: <mailto:netfilter@lists.netfilter.org>
List-Help: <mailto:netfilter-request@lists.netfilter.org?subject=help>
List-Subscribe: <https://lists.netfilter.org/mailman/listinfo/netfilter>,
	<mailto:netfilter-request@lists.netfilter.org?subject=subscribe>
Sender: netfilter-bounces@lists.netfilter.org
Errors-To: netfilter-bounces@lists.netfilter.org
Content-Type: text/plain; charset="us-ascii"
To: netfilter@lists.netfilter.org

Hi,

I've searched the archives for this subject and found plenty of
documentation, but nothing that's worked so far.

I have a number of clients behind a router using NAT trying to connect
to a server which is itself behind a router and NAT'd. First client
can connect no problem, any additional clients generate "GRE:
Discarding out of order packet" messages on the server. (The first
client stays connected.)

I'm using the pptp conntrack patch from pom20031219 with 2.4.24.
ip_nat_proto_gre, ip_nat_pptp, ip_conntrack_proto_gre and
ip_conntrack_pptp are loaded. iptables has been recompiled and I am
able to create rules in the nat table.

The server only has one interface and it's IP is 10.10.10.99. The
clients connect to 61.61.61.163 -- the NAT for this address is
performed on a router at the server end; the server has no visibility
of the external address.

The local IP range for poptop is 192.168.0.0/24, the remote is
10.10.10.50-10.10.10.60.

Should this config be possible and if so, can anyone provide the
iptables rules necessary to get it up and running?

thanks in advance,
 Craig

