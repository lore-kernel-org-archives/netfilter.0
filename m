From: "Gabby James" <lizard0000092@hotmail.com>
Subject: Best Practices for iptables
Date: Fri, 05 Dec 2003 07:01:25 -0700
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <BAY10-F59WC6BgBxfpG0000cde9@hotmail.com>
Mime-Version: 1.0
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
Content-Type: text/plain; format=flowed; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hi,

I want to allow everything on eth1 and be selective on eth0.  What is the 
best way of handling unwanted packets?

A) Change the policy of the chain to DROP then allow what I want.  Example:
iptables -P INPUT DROP
iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT


B) or leave the policy of the INPUT chain to ACCEPT but put REJECT rules at 
the end. Example:
iptables -A INPUT -p tcp -m tcp --dport 22 --syn -j ACCEPT
iptables -A INPUT -p tcp -m tcp -j REJECT
iptables -A INPUT -p udp -m udp -j REJECT
iptables -A INPUT -p icmp -j DROP

This will give me the same outcome won't it?

Thanks in advance!

_________________________________________________________________
Winterize your home with tips from MSN House & Home. 
http://special.msn.com/home/warmhome.armx


