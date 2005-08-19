From: YongHan Lee <y_h_lee@yahoo.com>
Subject: Different routing tables in ipv6 (netfilter6)
Date: Fri, 19 Aug 2005 05:17:59 -0700 (PDT)
Message-ID: <20050819121759.33459.qmail@web34207.mail.mud.yahoo.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
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

I do a project in networking. The subject is
"multipath in ipv6". For this I need to create
different routing
tables in ipv6 and add to each different routes
(different next hop) for the same destination to it.

For the implementation I have the following problem.

My scenario for testing is. I have two routes to a
destination D. When I send a SSH packet, I do it via
node B (fec0::B) and for a HTTP packet I do it via
node C (fec0::C). Node B and C are not connected
together.

When I do:
for SSH
# ip6tables -A PREROUTING -t mangle -i eth1 -p tcp
--dport 22 -j MARK --set-mark 1
# echo 201 ssh.out >> /etc/iproute2/rt_tables
# ip rule add fwmark 1 table ssh.out
# ip -6 route add default via fec0::B dev eth1 table
ssh.out

for HTTP
# ip6tables -A PREROUTING -t mangle -i eth1 -p tcp
--dport 80 -j MARK --set-mark 2
# echo 202 http.out >> /etc/iproute2/rt_tables
# ip rule add fwmark 2 table http.out
# ip -6 route add default via fec0::C dev eth1 table
http.out

then:
# ip -6 route show table all
it shows me the added route, but without "table
ssh.out" at the end of line as it do when we operated
in ipv4. This means it ignores the last two arguments
(table ssh.out or table http.out) when we add a route
to the table ssh.out (or http.out) and therefore these
tables remain empty. When it has a packet to send it
does not know to which next hop it has to send. So,
the marking packets is here useless.

Do I have to load explicitly some modules for
netfilter ipv6? How do I have to configure the config
files or the kernel? 

I achieved multipath in ipv4 (ip rule, ip route...)
without bigger problems. I use Kernel 2.6.8 and
Mandrake 10.0/1.




		
____________________________________________________
Start your day with Yahoo! - make it your home page 
http://www.yahoo.com/r/hs 
 

