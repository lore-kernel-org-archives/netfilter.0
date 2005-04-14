From: "Taylor, Grant" <gtaylor@riverviewtech.net>
Subject: Re: Rule "labels"?
Date: Thu, 14 Apr 2005 16:02:08 -0500
Message-ID: <425EDA50.1010201@riverviewtech.net>
References: <BAY106-F357CEE5BD3D8B2616C1AD6D6350@phx.gbl>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Return-path: <netfilter-bounces@lists.netfilter.org>
In-Reply-To: <BAY106-F357CEE5BD3D8B2616C1AD6D6350@phx.gbl>
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
To: Andrew Kraslavsky <andykras@hotmail.com>
Cc: netfilter@lists.netfilter.org

> Is there a way to associate rules together across tables or chains, 
> possibly with a label?

I can't give you a ""label, but I could give you a ""comment.  ;)  Try looking at a newer kernel (2.6.10?) as it includes the comment match (always returns true but let's you put a free text string in as a comment) which will be displayed when you iptables -L.

> iptables -t filter -A FORWARD -label POLICY001 -i $PUBLIC_IF -d 
> 192.168.168.23 -p tcp --dport 80 -j ACCEPT

iptables -t filter -A FORWARD -m comment --comment 'POLICY001' -i $PUBLIC_IF -p tcp --dport 80 -j ACCEPT

Should be the equivalent of what you are needing.

> 2) Support rule deletion based on -label, e.g.:
> 
> iptables -t filter -D FORWARD -label POLICY001
> 
> Ideally, the delete command would remove all rules in the specified 
> chain with the specified label, or all rules within the specified table, 
> or even across all chains in all tables, but I'm not that greedy...

Well comment will not do that.  I'm not sure that I really want the capability to do so in the iptables command and / or the kernel as this would be more overhead for something that is seldom used.  I think it would be FAR more practical to do an "iptables -t filter -L -n -v --line-numbers", "iptables -t nat -L -n -v --line-numbers", "iptables -t mangle -L -n -v --line-numbers" and parse the output looking for all lines that match POLICY001.  I think this would be an excellent shell or Perl script.  If you would be interested in collaborating on such a project I'd be interested in seeing if I could help.



Grant. . . .

