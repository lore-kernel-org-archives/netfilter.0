From: Etienne Ledoux <etienne@unix.za.org>
Subject: 3 iptables accounting questions
Date: Tue, 6 Jul 2004 10:17:43 +0200
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <200407061017.43252.etienne@unix.za.org>
Reply-To: etienne@unix.za.org
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
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
To: netfilter@lists.netfilter.org

Greetings,

1) I have a firewall and would like to count all the traffic entering/leaving 
the external interface (I want to count only internet traffic, which is the 
traffic entering/leaving the external if). Is this rule right ?

iptables -N ACCT
iptables -I FORWARD -j ACCT
iptables -I INPUT -j ACCT
iptables -I OUTPUT -j ACCT
iptables -A ACCT -s 10.168.0.2/32 -d 0.0.0.0/0 -o eth0
iptables -A ACCT -s 0.0.0.0/0 -d 10.168.0.2/32 -i eth0

10.168.0.2 is my external interface ip and is also the ip which my internal 
network is natted behind.

2) I would like to save/restore only this accounting rule. I thought 
'iptables-save -c -t ACCT' would work but it doesn't. 'iptables -L ACCT -n -v 
-x' gives me the right counter values but how can I save and restore only my 
accounting rule to prevent loosing the values after a reboot and I don't want 
to save/restore all the accounting stats.

3) How do I flush the accounting stats. 

I'm trying to count all traffic for a month and would then like to flush it at 
the 1st of the next month, so I can start counting the new month. I'm stuck.

tx, in advance

e.

