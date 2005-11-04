From: Manuel Marquez <Manuel.Marquez@isotrol.com>
Subject: Problem with conntrack idle connection timeout
Date: Fri, 04 Nov 2005 16:19:26 +0100
Message-ID: <436B7BFE.3060807@isotrol.com>
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

Greetings to you all,

I have been looking for a solution to a problem one of our clients has
regarding a netfilter firewall and Oracle. I would very much appreciate
any help on this.

We have a linux firewall with 3 network interfaces:
	-Internet interface to connect to the router
	-Inner LAN to hold all the Windows PCs, etc.
	-DMZ

They have connected a Tomcat 5 application server to the DMZ network and
the corresponding Oracle database server into the inner LAN.

The problem is the use a JDBC connection pool and (I think) the linux
firewall drops the pool connections after about 600 seconds of idle
time. They can change the pool to make it reconnect whenever this
happens, but they are planning to set up another interface (backend
network) and move the oracle server there. If they did this, sqlplus and
oracle forms would also get disconnected after this idle period (they
have made tests with the same results on an oracle server connected to
the DMZ). It also happens with SSH connections to the application
(Tomcat 5) server.


We have been testing the
/proc/sys/net/ipv4/netfilter/ip_conntrack_generic_timeout since we guess
its the conntrack module which closes the connection, but although we
set up a value of more than 600 seconds, connections keep getting closed.

What I would like to know is which netfilter (or linux TCP/IP stack)
timer is expiring and/or if there is a means of maintaining these idle
connections open. We tested the /proc/sys/net/ipv4/tcp_keepalive_time
flag, but it does not work (maybe the firewall is dropping these tcp
packets too).

I have googled long time for an answer, but I only found some people
with similar problems. Some of them suggest the use of "ipchains -M -S",
but since we use netfilter, this does not help.

Thanks in advance for your help

Manuel Marquez Garrido

