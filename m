From: Nathan March <nmarch@overdrawn.net>
Subject: Re: Suse 9.1 port forwarding woes
Date: Mon, 10 Jan 2005 17:30:36 -0800
Message-ID: <41E32C3C.2080907@overdrawn.net>
Mime-Version: 1.0
Content-Transfer-Encoding: 7BIT
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

Argh, I copied and pasted the wrong stuff over.

Correct:

ace:~ # iptables --list
Chain INPUT (policy ACCEPT)
target     prot opt source               destination
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:ssh
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:smtp
ACCEPT     tcp  --  anywhere             anywhere            tcp dpt:imap

Chain FORWARD (policy ACCEPT)
target     prot opt source               destination
ACCEPT     all  --  anywhere             anywhere            state 
ESTABLISHED
ACCEPT     icmp --  anywhere             anywhere            state RELATED
ACCEPT     all  --  anywhere             anywhere            state 
NEW,ESTABLISHED
ACCEPT     all  --  anywhere             anywhere            state 
NEW,ESTABLISHED
ACCEPT     tcp  --  anywhere             192.168.0.3         tcp dpt:http

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination
ace:~ # iptables -t nat --list
Chain PREROUTING (policy ACCEPT)
target     prot opt source               destination
DNAT       tcp  --  anywhere             anywhere            tcp 
dpt:http to:192.168.0.3:80

Chain POSTROUTING (policy ACCEPT)
target     prot opt source               destination
MASQUERADE  all  --  anywhere             anywhere

Chain OUTPUT (policy ACCEPT)
target     prot opt source               destination



