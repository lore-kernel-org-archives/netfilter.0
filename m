From: Askar <askarali@gmail.com>
Subject: slow ftp
Date: Thu, 17 Feb 2005 21:48:06 +0500
Message-ID: <a0f69e505021708481c4be836@mail.gmail.com>
Reply-To: Askar <askarali@gmail.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: "netfilter@lists.netfilter.org" <netfilter@lists.netfilter.org>

hi list

we are running ftp "proftpd" server it takes times when a user
connects to ftp server however when I flush the iptables rules
connection doesn't takes time, iptables firewall on the same machine,
default policies are DROP,
firewall script is very straight forward

rules
.
.
# Using Connection State to By-pass Rule Checking
iptables -A INPUT  -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT
.
.
.iptables -A INPUT -p tcp --dport 20:21 -m state --state NEW -j ACCEPT
.
.

# Load the FTP connection state helper module.
modprobe ip_conntrack_ftp
# Load the FTP NAT module.
modprobe ip_nat_ftp

any idea?

regards

-- 
I love deadlines. I like the whooshing sound they make as they fly by.
Douglas Adams

