From: Jeff Simmons <jsimmons@goblin.punk.net>
Subject: Questions on state
Date: Sun, 13 Mar 2005 16:23:42 -0800
Message-ID: <200503131623.42711.jsimmons@goblin.punk.net>
Reply-To: jsimmons@goblin.punk.net
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
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

Sorry to bother anyone, but I'm new to iptables, and I'm debugging a working 
production machine, so I can't really test things too much. :-(

Is a connection ONLY added to the state table when the first packet matches a 
rule that contains the --state NEW directive, or can it happen in some other 
way?

When --state INVALID is matched, is it done only on the source and destination 
addresses and ports, or is something else also involved?

Are NAT 'states' available for examination anywhere, like 
/proc/net/ip_conntrack?

Thanks for any assistance.

-- 
Jeff Simmons                                   jsimmons@goblin.punk.net
     Simmons Consulting - Network Engineering, Administration, Security

"You guys, I don't hear any noise. Are you sure you're doing it right?"
	-- My Life With The Thrill Kill Kult

