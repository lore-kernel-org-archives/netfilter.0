From: Ben Russo <ben@umialumni.com>
Subject: snmptraps incomming on udp port 162 REDIRECT to 4162 not working?
Date: 05 Nov 2002 11:16:29 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1036512998.8715.44.camel@ben.mis.tnsi.com>
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

Hi,

I have a server that performs many functions on a testing/lab network.
I don't really need a firewall, but I do want to restrict users from
having root access.

Sometimes users want to be able to bind a process to a low port like say
an snmptrap receiver to port 162, but the process needs privelages to do
that.

So I had the bright idea of using iptables to redirect the incomming
packets on the low port to a high port that the users program can bind
to without problems.

I tried the following:

iptables -t nat -p udp -m udp --dport 162 -j REDIRECT --to-ports 4162

The user started his program that bound to udp port 4162 (I could see it
while using netstat -nap ).  But his program didn't receive anything?
tcpdump -n | egrep "snmptrap|162 
did show incomming snmptraps to port 162, but "icmp unreachable" replies
were sent back?

Any ideas on how to make this work?

Thanks in advance,
-Ben.


