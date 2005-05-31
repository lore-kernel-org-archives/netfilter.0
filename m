From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Request for Comments / Opinions on temporarily blocking access...
Date: Tue, 31 May 2005 01:25:57 -0500
Message-ID: <429C0375.60005@riverviewtech.net>
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
Content-Type: text/plain; charset="us-ascii"; format="flowed"
To: netfilter@lists.netfilter.org

I'm considering (re)writing a firewall script for my home system (as a test before I deploy it at my clients) that would temporarily block access to various hosts, LAN and / or internet, that have tripped one or more filters.  I would like this lists opinion on such a system as below:

iptables -t filter -A INPUT -j Bogon_Test
iptables -t filter -A INPUT -j SSH_Brute_Force
iptables -t filter -A INPUT -j Time_Out_Corner


iptables -t filter -A FORWARD -j Bogon_Test
iptables -t filter -A FORWARD -j SSH_Brute_Force
iptables -t filter -A FORWARD -j Proxy_Bypass_Attempt
iptables -t filter -A FORWARD -j Time_Out_Corner


iptables -t filter -A Bogon_Test ...
...
iptables -t filter -A Bogon_Test -j LOG
iptables -t filter -A Bogon_Test -m recent --name Time_Out_List --set --rsource
iptables -t filter -A Bogon_Test -m recent --name Time_Out_List --set --rdest
iptables -t filter -A Bogon_Test -j DROP


iptables -t filter -A SSH_Brute_Force ...
...
iptables -t filter -A SSH_Brute_Force -j LOG
iptables -t filter -A SSH_Brute_Force -m recent --name Time_Out_List --set --rsource
iptables -t filter -A SSH_Brute_Force -m recent --name Time_Out_List --set --rdest
iptables -t filter -A SSH_Brute_Force -j TARPIT


iptables -t filter -A Proxy_Bypass_Attempt
...
iptables -t filter -A Proxy_Bypass_Attempt -j LOG
iptables -t filter -A Proxy_Bypass_Attempt -m recent --name Time_Out_List --set --rsource
iptables -t filter -A Proxy_Bypass_Attempt -m recent --name Time_Out_List --set --rdest
iptables -t filter -A Proxy_Bypass_Attempt -j DROP


iptables -t filter -A Time_Out_Corner -m state --state NEW -m recent --name Time_Out_List --rcheck --rsource --seconds 60 --hitcount 1 -j DROP
iptables -t filter -A Time_Out_Corner -m state --state NEW -m recent --name Time_Out_List --rcheck --rdest --seconds 60 --hitcount 1 -j DROP
#iptables -t filter -A Time_Out_Corner -m recent --name Time_Out_List --rcheck --rsource --seconds 60 --hitcount 1 -j DROP
#iptables -t filter -A Time_Out_Corner -m recent --name Time_Out_List --rcheck --rdest --seconds 60 --hitcount 1 -j DROP


The idea I'm after is that any place you have a (sub) chain that does any checking in your firewall that could potentially LOG and DROP traffic I would like to add a recent set for source and / or destination address to the Time_Out_Corner recent list.  This Time_Out_Corner recent list could then be checked to see if a specific source and / or destination IP has done any thing to trigger any of the checks and deny any NEW access to the system if it has.  Optionally if you would rather disconnect any ongoing (not NEW) connections comment out the first two rules and uncomment the last two rules in the Time_Out_Corner table.  To pull this off all traffic would need to pass through the Time_Out_Corner chain.



Grant. . . .

