From: Jason Opperisano <opie@817west.com>
Subject: Re: Odd iptables behavior. One port range works, another doesn't
Date: Mon, 22 Nov 2004 10:32:30 -0500
Message-ID: <20041122153230.GA30649@bender.817west.com>
References: <BC36F80F-3C29-11D9-9337-000A95B6BD3E@hotpop.com>
Mime-Version: 1.0
Return-path: <netfilter-bounces@lists.netfilter.org>
Content-Disposition: inline
In-Reply-To: <BC36F80F-3C29-11D9-9337-000A95B6BD3E@hotpop.com>
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

On Sun, Nov 21, 2004 at 07:56:33PM -0600, James wrote:
> I am trying to use non-standard ports with torrents. If I use the 
> standard ports: 6880:6899, it works fine. However, if I simply change 
> the port range to 6280:6299, it no longer matches and my default DROP 
> rule at the end of my chain catches the packets.
> 
> My full script can be found here, it is fairly thorough in its comments:
> http://www.tuxmac.homelinux.org/~james/scripts/fwsoho.full
> 
> In an attempt to debug, I trimmed out all of the DROP and REJECT rules 
> except the default, catch-alls at the bottom. I discovered that if I 
> used the --dport with the following rules the alternate port range 
> would not work, but if I left the --dport off and did a straight 
> accept, it did:
> 
> $IPT -A OUTPUT  -o $EXTIF -p tcp -s $EXTIP  \
>     --dport $ports -m state --state NEW -j ACCEPT
>    $IPT -A FORWARD -i $INTIF -p tcp -s $INTNET \
>     --dport $ports -m state --state NEW -j ACCEPT
> 
> Here is a link to the trimmed down rule set:
> http://www.tuxmac.homelinux.org/~james/scripts/fwsoho
> 
> Finally, here is the output of "iptables -L" and below it "iptables -t 
> nat -L PREROUTING -vn" with the troublesome 6280:6299 range used
> http://www.tuxmac.homelinux.org/~james/scripts/rules

looking at the above link--your FORWARD rules allow the bittorrent
traffic OUT, not IN [1]; whereas, if you're using PREROUTING NAT rules, i'm
assuming you're trying to allow the traffic IN.

[1]
Chain FORWARD (policy DROP)
target     prot opt source                      destination 
ACCEPTl    tcp  --  james.tuxmac.homelinux.org  anywhere tcp dpt:6280 

-j

--
"I have been shot eight times this year, and as a result, I almost
 missed work."
        --The Simpsons

