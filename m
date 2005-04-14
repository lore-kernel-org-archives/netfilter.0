From: "Stephen J. McCracken" <sjmccracky@myrealbox.com>
Subject: Re: Rule "labels"?
Date: Thu, 14 Apr 2005 16:32:47 -0500
Message-ID: <425EE17F.9010705@myrealbox.com>
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

Andrew Kraslavsky wrote:
[snip]
> This equates to the following 2 rules, one in the 'nat' table and the 
> other in the 'filter' table:
> 
> iptables -t nat -A PREROUTING -i $PUBLIC_IF -p tcp --dport 80 -j DNAT 
> --to 192.168.168.23
> 
> iptables -t filter -A FORWARD -i $PUBLIC_IF -d 192.168.168.23 -p tcp 
> --dport 80 -j ACCEPT
> 
> Later, the user decides to disable the policy which means deleting both 
> of the rules above.  Since I cannot rely on knowing the indices of each 
[snip]
> 
> Ideally, the delete command would remove all rules in the specified 
> chain with the specified label, or all rules within the specified table, 
> or even across all chains in all tables, but I'm not that greedy...
> 
> Suggestions?

It might not be as elegant as you are looking for, but I do something 
similar with adding/deleting rules when VPNs come up/go down.  I have 
been simply generating rules in a file and sourcing that file in the 
VPN_up script.  I then have that file saved for the case when the VPN 
goes down and just do a simple sed script to change all adds to deletes 
and source that file in the VPN_down script.  You don't have the problem 
of finding rules dynamically as you have the file that generated the 
rules hanging around and can easily reverse the process changing "-A" to 
"-D".

Like I said, maybe not elegant, but it works.

sjm

