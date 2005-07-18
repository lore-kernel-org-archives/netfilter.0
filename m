From: Fatih TURKMEN <fatihturkmen99@yahoo.com>
Subject: ssh connection is not allowed in NAT, SUSE 9.2
Date: Mon, 18 Jul 2005 06:21:09 -0700 (PDT)
Message-ID: <20050718132109.88338.qmail@web50210.mail.yahoo.com>
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

Hi everybody,
I am trying to create small NAT network on SUSE 9.2
computers.I don't know what is missing in my iptables
policy but I have added three rules for SNAT:

1) iptables -t nat -A POSTROUTING -o eth0 -j
MASQUERADE
2) iptables -A FORWARD -i eth0 -o eth1 -m state
--state RELATEd,ESTABLISHED -j ACCEPT
3) iptables -A FORWARD -i eth1 -o eth0 -j ACCEPT

I stopped firewalls on local computers, and installed
ssh server/client on all computers.I can ssh to local
machines from locals.But I can't ssh to nat
server.Also I can only ping one computer from NAT
Server.
When I try to ssh to local clients from NAT server I
got either  "No route to host" or "Connection refused"
although I stopped firewalls on locals and set the NAT
server as the default gateway for local clients.

Any ideas? What is missing?

Thanks in advance.

Fatih TURKMEN

__________________________________________________
Do You Yahoo!?
Tired of spam?  Yahoo! Mail has the best spam protection around 
http://mail.yahoo.com 

