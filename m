From: "JUSTIN GERRY" <JGERRY@butchers.com>
Subject: Redhat 8.0 with Iptables and Cisco 2514
Date: Tue, 07 Jan 2003 16:32:51 -0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <se1b0154.064@butchers.com>
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
To: netfilter@lists.netfilter.org

Trying to figure out why, when I enable the firewall on my cisco (which
is a state checking firewall) and I have my iptables (also state
checking) firewall enabled on my redhat box I can not establish a
connection with with my website (either website one as I have two
interfaces and I am using apache to host both)

It almost seems as if the cisco is destroying the incoming connection
(probably the outgoing response because I can see people connecting to
my box) before my box has a chance to send out a response.

If I run no firewall on my redhat box and leave the firewall up on my
cisco then you can access my website normally. 

If anyone has had this problem please let me know.

FYI, my simple firewall test:

F1="eth0"
IF2="eth1"
IP2="xxx" #(real ip address hidden)
IP1="xxx" #(real ip address hidden)
UNPRIVPORTS="1024:65535"

iptables -F
iptables -P INPUT DROP
iptables -P FORWARD DROP
iptables -P OUTPUT DROP

iptables -A INPUT -p tcp --sport $UNPRIVPORTS \
--dport 80 -m state --state NEW -j ACCEPT
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state NEW,ESTABLISHED,RELATED -j ACCEPT

Many thanks,
Justin


