From: James <krunkalot@hotpop.com>
Subject: Odd iptables behavior. One port range works, another doesn't
Date: Sun, 21 Nov 2004 19:56:33 -0600
Message-ID: <BC36F80F-3C29-11D9-9337-000A95B6BD3E@hotpop.com>
Mime-Version: 1.0 (Apple Message framework v619)
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
To: netfilter@lists.netfilter.org, netfilter@lists.netfilter.org, netfilter@lists.netfilter.org

I am trying to use non-standard ports with torrents. If I use the 
standard ports: 6880:6899, it works fine. However, if I simply change 
the port range to 6280:6299, it no longer matches and my default DROP 
rule at the end of my chain catches the packets.

My full script can be found here, it is fairly thorough in its comments:
http://www.tuxmac.homelinux.org/~james/scripts/fwsoho.full

In an attempt to debug, I trimmed out all of the DROP and REJECT rules 
except the default, catch-alls at the bottom. I discovered that if I 
used the --dport with the following rules the alternate port range 
would not work, but if I left the --dport off and did a straight 
accept, it did:

$IPT -A OUTPUT  -o $EXTIF -p tcp -s $EXTIP  \
     --dport $ports -m state --state NEW -j ACCEPT
    $IPT -A FORWARD -i $INTIF -p tcp -s $INTNET \
     --dport $ports -m state --state NEW -j ACCEPT

Here is a link to the trimmed down rule set:
http://www.tuxmac.homelinux.org/~james/scripts/fwsoho

Finally, here is the output of "iptables -L" and below it "iptables -t 
nat -L PREROUTING -vn" with the troublesome 6280:6299 range used
http://www.tuxmac.homelinux.org/~james/scripts/rules


Any input is greatly appreciated, thanks in advance

-james


