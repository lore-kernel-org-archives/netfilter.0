From: Rajesh Menon <secure2k4rrm@yahoo.com>
Subject: IPTables connection limitiing rule meaning
Date: Mon, 1 Nov 2004 11:55:27 -0800 (PST)
Message-ID: <20041101195527.75983.qmail@web53503.mail.yahoo.com>
Mime-Version: 1.0
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
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org


11/1

Hello,

I have a rule in my output chain as follows:

iptables -A OUTPUT -o <external-IF> -m limit --limit
15/minute --limit-burst 10 -j LOG --log-prefix
"GW->Intet: "

1. Would this rule LOG packets as long as the rule is
matched?

2. If the limit is reached (15/min) would the packets
stop going to the next rule in the chain? 

3. Supposing I have this rule after the above rule 

iptables -A OUTPUT -j ACCEPT

Would this over-ride the above rule applicable for the
external interface?

Thank You.
Menon




		
__________________________________ 
Do you Yahoo!? 
Check out the new Yahoo! Front Page. 
www.yahoo.com 
 


