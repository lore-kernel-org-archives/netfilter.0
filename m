From: Askar Ali Khan <askarali@gmail.com>
Subject: ftp access problem
Date: Sat, 24 Jul 2004 15:05:59 +0500
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <a0f69e504072403057b210342@mail.gmail.com>
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
To: netfilter <netfilter@lists.netfilter.org>

Hi

On my router/firewall which acting i am getting problem while anyone
tries to connect to ftp server he connected successfully however when
he types and command for example "ls" ftp server return error "500
Illegal PORT range rejected"
Everything else is working fine.

default policies are drop

iptables --policy INPUT DROP     
iptables --policy FORWARD DROP 
iptables --policy OUTPUT DROP 
.
.
.
iptables -t nat -A POSTROUTING -o ppp0 -s 192.168.0.0/24 -d 0/0  -j
MASQUERADE#iptables -t nat -A PREROUTING -i eth0 -p tcp --dport 80 -j
REDIRECT --to-port 3128
iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
iptables -A FORWARD -m state --state ESTABLISHED,RELATED -j ACCEPT

For FTP access..
iptables -A FORWARD -o ppp0 -p tcp -m multiport --dport 20,21 -m state
--state NEW -j ACCEPT

I understand that FTP server will also in return open a port on my
side and this is what causing problem. However I don't know which
chain and what rule to make for this to solve this problem. :)

I any quick help in this regard will be greatly appreciated :D

Regards
Askar

