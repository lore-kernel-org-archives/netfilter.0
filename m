From: "Robert Becskei" <brobiwbe@stcable.co.yu>
Subject: Active and Passive FTP
Date: Tue, 17 May 2005 18:27:08 +0200
Message-ID: <00c701c55afd$4568d0d0$1701a8c0@info2000256>
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
Content-Type: text/plain; format="flowed"; charset="us-ascii"; reply-type="original"
To: netfilter@lists.netfilter.org

Hello everyone ,

my clients access the internet like this

client --- proxy server --- eth0 firewall eth1 ----internet

in squid.conf I told squid to always direct allow ftp...

in iptables I've did the following modifications...

iptables -A INPUT -i eth1 -p tcp --sport 21 -m state --state ESTABLISHED -j 
ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 20 -m state --state 
ESTABLISHED,RELATED -j ACCEPT
iptables -A INPUT -i eth1 -p tcp --sport 1024:65535 --dport 1024:65535 -m 
state --state ESTABLISHED -j ACCEPT

iptables -A OUTPUT -o eth1 -p tcp --dport 21 -m state --state 
NEW,ESTABLISHED -j ACCEPT
iptables -A OUTPUT -o eth1 -p tcp --dport 20 -m state --state ESTABLISHED -j 
ACCEPT
iptables -A OUTPUT -o eth1 -p tcp --sport 1024:65535 --dport 1024:65535 -m 
state ESTABLISHED,RELATED -j ACCEPT

passive ftp works... but I cannot get active to work I always get a

 200: SWITCHING TO ASCII MODE
 500: ILLEGAL PORT COMMAND
 500: Unknown COMMAND

what did I mess up ? is there a way to get active working as well...are the 
above rules correct ? eth1 is my outside interface...the proxy server 
connects to eth0 directly

Sincerely
Robert B 


