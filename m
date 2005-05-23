From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: SSH Brute force attacks
Date: Mon, 23 May 2005 11:14:11 -0500
Message-ID: <42920153.902@riverviewtech.net>
References: <427B93EE.3030905@eccotours.dyndns.org>	<42898402.10507@eccotours.dyndns.org><4289E72F.7020901@wp.pl>	<200505211200.28314.pvolkov@mics.msu.su>	<428FB81F.6030403@riverviewtech.net>	<004501c55ebb$61a49b00$4206a8c0@loki>
	<4290658F.20002@wp.pl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <4290658F.20002@wp.pl>
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

> ipt=/usr/local/sbin/iptables
> 
> $ipt -N SSH_Brute_Force
> $ipt -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name SSH
> $ipt -A INPUT -s ! $MyIP -m recent --rcheck --name SSH -j SSH_Brute_Force
> $ipt -A SSH_Brute_Force -m recent ! --rcheck --name SSH --seconds 60 --hitcount 3 -j RETURN
> $ipt -A SSH_Brute_Force -j LOG --log-prefix "SSH Brute Force Attempt:  "
> $ipt -A SSH_Brute_Force -j DROP
> $ipt -A INPUT -m recent --rcheck --name SSH -j ACCEPT

Are you sure that your two INPUT rules are doing what you want the way that you want?  As I read this your first input rule "$ipt -A INPUT -p tcp --dport 22 -m state --state NEW -m recent --set --name SSH" sets every (NEW) packet that is inbound to port 22 in the SSH recent list.  The very next rule "$ipt -A INPUT -s ! $MyIP -m recent --rcheck --name SSH -j SSH_Brute_Force" checks to see if the packet has been set in the SSH recent list.  To me this is a bit on the redundant side unless there is something that I'm missing.  The only thing that I can see to gain by doing this would be that every packet other than the NEW packets would have fewer rules to traverse in the chain?  Is this what you are after?

Also, a comment on the way that you are testing for $MyIP:  What you are doing is ok if you have only one IP that you want to ""white list but how would you ""white list multiple IP, say your friends house that you go over to and hang out once and a while or how about your parent's house where you have to work on their computer once a year (we all have been there).  This is the reason that I jumped in to the SSH_Brute_Force chain and then put multiple RETURN lines at the very top of it.  If you jump in to the SSH_Brute_Force chain to immediately call one of a few RETURN rules you can have as many ""white listed IPs as you would like with very little extra processing on the part of the firewall.



Grant. . . .


