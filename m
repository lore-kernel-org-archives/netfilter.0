From: Mike Ireton <mike-netfilter@tiedyenetworks.com>
Subject: Hashing iptables rules for improved peformance?
Date: Mon, 21 Apr 2003 11:12:33 -0700 (PDT)
Sender: netfilter-admin@lists.netfilter.org
Message-ID: <Pine.LNX.4.44.0304211022100.7357-100000@252.1.168.192.in-addr.arpa>
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
Content-Type: TEXT/PLAIN; charset="us-ascii"
Content-Transfer-Encoding: 7bit
To: netfilter@lists.netfilter.org

Hello all,

	I'm working on a project involving bandwidth management and I want 
it to include accurate ip accounting per ip address that is under it's 
control. Presently this is a /23 netblock but this is expected to grow 
substantially, and the number of rules needed to account for traffic is 
quite substantial. 

	My conceptual model is simple: For each ip address, I want to know 
four things - the number of bytes output for local destination, number 
output headed to the Internet, the number input from local destinations, 
and the number received from the Internet. This would generate four rules 
in the router for each ip address of interest:

iptables -A accounting -s ipaddress -d localnet/mask -j RETURN
iptables -A accounting -s ipaddress -d 0.0.0.0/0 -j RETURN
iptables -A accounting -s localnet/mask -d ipaddress -j RETURN
iptables -A accounting -s 0.0.0.0/0 -d ipaddress -j RETURN


So potentially we're looking at 1024 rules here.

(* Assuming that the 'acocunting' table exists and the forwarding table 
contains rules to jump here).

	Some problems with this are 1) This isn't going to scale very 
well. As I see it, there's going to be (?) many linear table searches for 
every packet passed thru this accounting table, and 2) I can't 
simultaniously read and reset the counters for any given address. 

	So then my thought was to counstruct these rules using hash 
tables, where there existed many accounting tables representing the entire 
address space in chunks ranging in size from /23 to /30. For example:


Network 1.1.1.0/24
iptables -N acct_1_1_1_0_25
iptables -N acct_1_1_1_0_26
iptables -N acct_1_1_1_0_27

iptables -I acct_1_1_1_0_25 -s 1.1.1.0/25 -j acct_1_1_1_0_26
iptables -I acct_1_1_1_0_25 -s 1.1.1.128/25 -j acct_1_1_1_128_26

iptables -I acct_1_1_1_0_26 -s 1.1.1.0/26 -j acct_1_1_1_0_27
iptables -I acct_1_1_1_0_26 -s 1.1.1.64/26 -j acct_1_1_1_64_27


and so on, until we get down to a /30. This would reduce the number of 
lookups for any given rule to some small garuenteed maximum, where it 
would also be easy for a userspace program to lookup any range of 
addresses and examine the byte counters. 

My question for the iptables hackers is - am I being silly by trying to 
peform accounting this way, and does netfilter already implement effecient 
internal hashing that destroys my presumption about a long list of rules 
resulting in linear table lookups? I would assume that netfilter does hash 
where it can, but filtering rules have a second key to worry about - 
namely, their order in the list is relevent, which makes me think 
netfilter would have to do the linear lookup.

	Thanks in advance for your feedback.

Mike-



