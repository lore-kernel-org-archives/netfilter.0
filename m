From: Dominic Duval <dd@dd.qc.ca>
Subject: Invalid httpd logs with port forwarding
Date: 03 Aug 2003 08:21:11 -0400
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <1059913270.1218.34.camel@office.dd.qc.ca>
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

Simply put, is there a way to do port forwarding without having the
source address modified?

Here is the problem: I'm using the following rules to forward port 80
trafic to a HTTP server behind a firewall:

iptables -t nat -A PREROUTING -p tcp --dport 80 -d 66.46.180.200 -j DNAT
--to-destination 192.168.1.200:80
iptables -A FORWARD -p tcp --dport 80 -d 192.168.1.200 -m state --state
NEW,ESTABLISHED,RELATED -j ACCEPT

The port forwarding works just fine, but all log entries on the HTTP
server show the same source address, which is the local address of the
firewall (192.168.1.4). I'd like the logs to show the real IP address of
the client from which the connection originates.

Any help, pointer or suggestion would be appreciated.

Thanks!

                        -Dominic
-- 
Dominic Duval		
SOLIDD Technologies, www.dd.qc.ca
Cell: 514-581-7975, ICQ: 4251006, MSN: dduval2@hotmail.com



