From: Vincent Elderkamp <vincent@ducky.nl>
Subject: FTP Problem
Date: Mon, 26 Feb 2007 20:46:12 +0100
Message-ID: <45E33904.4060103@ducky.nl>
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

I'm a new user for netfilter en doesn't have experience with it...

I have written a simple firewall script in the past it works perfect,
but know the FTP section doesn't work at all....

Maybe can somebody help me.

Here is my code :

iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -p tcp -i eth0 -s any/0 -d any/0 --dport 21 -j ACCEPT
iptables -A OUTPUT -p tcp -o eth0 -s any/0 --sport 21 -d any/0 ! --syn
-j ACCEPT
iptables -A INPUT -p tcp -i eth0 -s any/0 -d any/0 --dport 20 -j ACCEPT
iptables -A OUTPUT -p tcp -o eth0 -s any/0 --sport 20 -d any/0 ! --syn
-j ACCEPT


I have found some code on the internet but that doesn't work at all :

## FTP
# Allow ftp outbound.
iptables -A INPUT  -i eth0 -p tcp --sport 21 -m state --state
ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 21 -m state --state
NEW,ESTABLISHED -j ACCEPT
# Now for the connection tracking part of ftp. This is discussed more
completely in my section
# on connection tracking to be found here.
# 1) Active ftp.
# This involves a connection INbound from port 20 on the remote machine,
to a local port
# passed over the ftp channel via a PORT command. The ip_conntrack_ftp
module recognizes
# the connection as RELATED to the original outgoing connection to port
21 so we don't
# need NEW as a state match.
iptables -A INPUT  -i eth0 -p tcp --sport 20 -m state --state
ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --dport 20 -m state --state
ESTABLISHED -j ACCEPT
# 2) Passive ftp.
# This involves a connection outbound from a port >1023 on the local
machine, to a port >1023
# on the remote machine previously passed over the ftp channel via a
PORT command. The
# ip_conntrack_ftp module recognizes the connection as RELATED to the
original outgoing
# connection to port 21 so we don't need NEW as a state match.
iptables -A INPUT  -i eth0 -p tcp --sport 1024:65535 --dport 1024:65535 \
  -m state --state ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth0 -p tcp --sport 1024:65535 --dport 1024:65535 \
  -m state --state ESTABLISHED,RELATED -j ACCEPT


Hope someone can help me,

Thank you very much

Vincent

